function [Out,count] = AcquisionPol(prob,options)
Mu  = prob.Mu; L  = length(Mu); % number of designs
switch options
    case 'OREI' 
        M =length(prob.Mu); mu_0=ones(length(prob.Mu),1); beta_0=ones(length(prob.Mu),1);
        mu_est=ones(length(prob.Mu),1);
        beta_W=1./prob.Var; % measurement precision
        beta_est=beta_0;  count=zeros(M,prob.T);   sample =zeros(prob.T,M);
        for t=1:prob.T       
             zeta=min(mu_est)-mu_est;
             v   =zeta.*normcdf(zeta.*sqrt(beta_est))+ (1./sqrt(beta_est)).*normpdf(zeta.*sqrt(beta_est));
             Sim = RankSim(prob,mu_est); EI = v.*Sim;
             [~, k]=max(EI); count(k,t)=1;
            if  isfield(prob,'case') && strcmp(prob.case,'MML')
                [ sample(t,k),~]=MMK(prob.design(k,:),2000); % ML, MT
            elseif isfield(prob,'case') && strcmp(prob.case,'MMT')
                [~, sample(t,k)]=MMK(prob.design(k,:),2000);
            elseif isfield(prob,'case') && strcmp(prob.case,'ECS')
                sample(t,k) =EsophagealCancerSim(prob.design(k,:));
            else
                 sample(t,k) = normrnd(prob.Mu(k),sqrt(prob.Var(k))); 
            end
             sample(t,k) = normrnd(prob.Mu(k),sqrt(prob.Var(k))); 
             W = sum(sample(:,k));
             beta_est(k)=beta_est(k)+beta_W(k);   %update belief
             mu_est(k)=(beta_0(k)*mu_0(k)+beta_W(k)*W)/beta_est(k);    %update belief            
            % calculate result 
            [~,m1] =min(mu_est); [~,m2] =min(prob.Mu);
            if m1==m2
                Out.true(t) =1;
            else
                Out.true(t) =0;
            end
            Out.oc(t) = prob.Mu(m1)-prob.Mu(m2);
        end       
    case 'KG' 
        M =length(prob.Mu); mu_0=ones(length(prob.Mu),1); beta_0=ones(length(prob.Mu),1);
        mu_est=ones(length(prob.Mu),1);
        beta_W=1./prob.Var; % measurement precision
        beta_est=beta_0;    
        sigmatilde=zeros(M,1);   count=zeros(M,1);  sample =zeros(prob.T,M);
        for t=1:prob.T %----acquisition function and calculate expected value
             sigmatilde = sqrt(1./beta_est-1./(beta_est+beta_W));
             %calculate zeta
             aux =repmat(mu_est, 1, M);
             aux1=aux(diag(ones(M,1))~=1);
             aux2= reshape(aux1, M-1,M);
             zeta=-abs((mu_est-min(aux2)')./ sigmatilde);
             f   =zeta.*normcdf(zeta)+normpdf(zeta);
             KGfactor=  sigmatilde.*f; [~, k]=max(KGfactor);
             count(k)=count(k)+1;
             sample(t,k) = normrnd(prob.Mu(k),sqrt(prob.Var(k)));          
             beta_est(k)=beta_est(k)+beta_W(k);   %update belief
             mu_est(k)=(beta_0(k)*mu_0(k)+beta_W(k)*sum(sample(:,k)))/beta_est(k);    %update belief   
            % calculate result 
            [~,m1] =min(mu_est); [~,m2] =min(prob.Mu);
            if m1==m2
                Out.true(t) =1;
            else
                Out.true(t) =0;
            end
            Out.oc(t) = prob.Mu(m1)-prob.Mu(m2);
        end       
    case 'EA' %% Equal allocation
        alc  =zeros(L,1); sample   =zeros(prob.T,L); AlcDec   =zeros(prob.T,L);
        for t=1:prob.T
            [~,k] =min(alc); alc(k)=alc(k)+1;
            if  isfield(prob,'case') && strcmp(prob.case,'MML')
                [ sample(t,k),~]=MMK(prob.design(k,:),2000); % ML, MT
            elseif isfield(prob,'case') && strcmp(prob.case,'MMT')
                [~, sample(t,k)]=MMK(prob.design(k,:),2000);
            elseif isfield(prob,'case') && strcmp(prob.case,'ECS')
                sample(t,k) =EsophagealCancerSim(prob.design(k,:));
            else
                 sample(t,k) = normrnd(prob.Mu(k),sqrt(prob.Var(k))); 
            end 
            AlcDec(t,k) = 1;
            for k=1:L
                Xi =sample(AlcDec(:,k)==1,k);
                mu_t(k,1) = mean(Xi); var_t(k,1)= var(Xi);
            end 
            % calculate result 
            [~,m1] =min(mu_t); [~,m2] =min(prob.Mu);
            if m1==m2
                Out.true(t) =1;
            else
                Out.true(t) =0;
            end
            Out.oc(t) = prob.Mu(m1)-prob.Mu(m2);
        end

    case 'OCBA' 
        T0 =5;  alc =ones(L,1)*T0; sample   =zeros(prob.T,L); AlcDec   =zeros(prob.T,L);     
        for k=1:L
            for t=1:T0
                if  isfield(prob,'case')&& strcmp(prob.case,'MML')
                    [sample((k-1)*T0+t,k),~]=MMK(prob.design(k,:),2000); % ML, MT
                elseif isfield(prob,'case') && strcmp(prob.case,'MMT')
                    [~,sample((k-1)*T0+t,k)]=MMK(prob.design(k,:),2000);
            elseif isfield(prob,'case') && strcmp(prob.case,'ECS')
                sample(t,k) =EsophagealCancerSim(prob.design(k,:));
                else
                    sample((k-1)*T0+t,k) =  normrnd(prob.Mu(k),sqrt(prob.Var(k))); 
                end 
                AlcDec((k-1)*T0+t,k) = 1;
            end 
            Xi =sample(AlcDec(:,k)==1,k); % Calculate Sample Mean and Varinace
            mu_t(k,1) = mean(Xi);  var_t(k,1)= var(Xi);
        end
        for t = T0*L+1 : prob.T
            [mu_st, index]=sort(mu_t,'ascend');
            var_st = var_t(index);
            N_ocba = (var_st(2:end)./(mu_st(1)-mu_st(2:end))).^2;
            N_ocba = [sqrt(var_st(1))*sqrt(sum((N_ocba./var_st(2:end)).^2));N_ocba];
            P_ocba = N_ocba /sum(N_ocba);
            [~,ind] = max(P_ocba-alc(index)/t);
            k = index(ind); alc(k) =alc(k)+1; AlcDec(t,k) =1;
            if  isfield(prob,'case') && strcmp(prob.case,'MML')
                [ sample(t,k),~]=MMK(prob.design(k,:),2000); % ML, MT
            elseif isfield(prob,'case') && strcmp(prob.case,'MMT')
                [~, sample(t,k)]=MMK(prob.design(k,:),2000);
            else
                 sample(t,k) =  normrnd(prob.Mu(k),sqrt(prob.Var(k)));
            end 
            Xi =sample(AlcDec(:,k)==1,k);         % Calculate Sample Mean and Varinace
            mu_t(k) = mean(Xi); var_t(k)= var(Xi);     
            % calculate result 
            [~,m1] =min(mu_t); [~,m2] =min(prob.Mu);
            if m1==m2
                Out.true(t) =1;
            else
                Out.true(t) =0;
            end
            Out.oc(t) = prob.Mu(m1)-prob.Mu(m2);
        end
    case 'MFOR' % MODIFIED MFOR to converge to the optimal allocation
        M =length(prob.Mu); mu_0=ones(M,1); beta_0=ones(M,1); mu_est=ones(M,1);
        beta_W=1./prob.Var; % measurement precision
        beta_est=beta_0;  count=zeros(M,prob.T);    sample =zeros(prob.T,M); N=zeros(M,1); 
        for t=1:prob.T
            [~,b] =min(mu_est); ratio =N/t; Q =sum(ratio.^2.*beta_W)-2*ratio(b)^2*beta_W(b);
            if Q >0
                k=b;
            else
                zeta=min(mu_est)-mu_est;
                v =zeta.*normcdf(zeta.*sqrt(beta_est))+ (1./sqrt(beta_est)).*normpdf(zeta.*sqrt(beta_est));
                Sim = RankSim(prob,mu_est); EI = v.*Sim;
                [~, index]=maxk(EI,2); 
                if index(1)==b
                    k=index(2);
                else
                    k=index(1);
                end
            end
            N(k)=N(k)+1; count(k,t)=1;
            if  isfield(prob,'case') && strcmp(prob.case,'MML')
                [ sample(t,k),~]=MMK(prob.design(k,:),2000);
            elseif isfield(prob,'case') && strcmp(prob.case,'MMT')
                [~, sample(t,k)]=MMK(prob.design(k,:),2000);
            elseif isfield(prob,'case') && strcmp(prob.case,'ECS')
                sample(t,k) =EsophagealCancerSim(prob.design(k,:));
            else
                 sample(t,k) = normrnd(prob.Mu(k),sqrt(prob.Var(k))); 
            end
             sample(t,k) = normrnd(prob.Mu(k),sqrt(prob.Var(k))); 
             W = sum(sample(:,k));
             beta_est(k)=beta_est(k)+beta_W(k);   %update belief
             mu_est(k)=(beta_0(k)*mu_0(k)+beta_W(k)*W)/beta_est(k);    %update belief            
            % calculate result 
            [~,m1] =min(mu_est); [~,m2] =min(prob.Mu);
            if m1==m2
                Out.true(t) =1;
            else
                Out.true(t) =0;
            end
            Out.oc(t) = prob.Mu(m1)-prob.Mu(m2);
        end   
        
      case 'AOAP' 
        M =length(prob.Mu); mu_0=1*ones(length(prob.Mu),1); beta_0=1*ones(length(prob.Mu),1);
        mu_est=mu_0;
        beta_W=1./prob.Var; % measurement precision
        beta_est=beta_0;     
        count=zeros(M,1);
        sample =zeros(prob.T,M);
        for t=1:prob.T %----acquisition function and calculate expected value 
            [~,b] = min(mu_est);  zeta =(mu_est(b)-mu_est).^2 ./(1/beta_est(b)+1./beta_est);
            for i=1:M
                if i==b
                    temp =(mu_est(b)-mu_est).^2 ./(1/(beta_est(b)+beta_W(b))+1./beta_est); temp(b) = [];  
                    v(i) = min(temp);
                else
                    temp =zeta;
                    temp([b,i]) =[]; temp =[min(temp);(mu_est(b)-mu_est(i))^2/(1/beta_est(b)+ 1/(beta_est(i)+beta_W(i)))];
                    v(i) = min(temp);
                end
            end
             [~, k]=max(v); count(k)=count(k)+1;
            if  isfield(prob,'case') && strcmp(prob.case,'MML')
                [ sample(t,k),~]=MMK(prob.design(k,:),2000); % ML, MT
            elseif isfield(prob,'case') && strcmp(prob.case,'MMT')
                [~, sample(t,k)]=MMK(prob.design(k,:),2000);
            elseif isfield(prob,'case') && strcmp(prob.case,'ECS')
                sample(t,k) =EsophagealCancerSim(prob.design(k,:));
            else
                 sample(t,k) = normrnd(prob.Mu(k),sqrt(prob.Var(k))); 
            end
             %update belief
             beta_est(k)=beta_est(k)+beta_W(k);  
             mu_est(k)=(beta_0(k)*mu_0(k)+beta_W(k)*sum(sample(:,k)))/beta_est(k);           
            % calculate result 
            [~,m1] =min(mu_est); [~,m2] =min(prob.Mu);
            if m1==m2
                Out.true(t) =1;
            else
                Out.true(t) =0;
            end
            Out.oc(t) = prob.Mu(m1)-prob.Mu(m2);
        end
end
end


