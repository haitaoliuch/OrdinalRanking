function prob = Problems(options)

switch options
    case 'A1'
        X = 0.1:0.05:2; 
        for i=1:length(X)
            x =X(i);
            prob.Mu(i,1)  = ackley(x);
        end       
        prob.Var =9*ones(length(X),1); % EQUAL Variance
        prob.HLFideMu=prob.Mu; L=5;
        for i=1:L
            prob.HLFideMu = [prob.HLFideMu, normrnd(prob.Mu,prob.Var)];
        end    
    case 'A2' 
        X = 0.1:0.05:4; 
        for i=1:length(X)
            x =X(i);
            prob.Mu(i,1)  = ackley(x);
        end        
        prob.Var =9*ones(length(X),1); % EQUAL Variance
        prob.HLFideMu=prob.Mu; L=5;
        for i=1:L
            prob.HLFideMu = [prob.HLFideMu, normrnd(prob.Mu,prob.Var)];
        end 
    case 'A3' 
        X = 1:0.05:10; 
        for i=1:length(X)
            x =X(i);
            prob.Mu(i,1)  = ackley(x);
        end        
        prob.Var =9*ones(length(X),1); % EQUAL Variance
        prob.HLFideMu=prob.Mu; L=5;
        for i=1:L
            prob.HLFideMu = [prob.HLFideMu, normrnd(prob.Mu,prob.Var)];
        end
    case 'A4'
        k =10;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =9*ones(k,1);
        prob.HLFideMu=prob.Mu; L=5;
        for i=1:L
            prob.HLFideMu = [prob.HLFideMu, normrnd(prob.Mu,prob.Var)];
        end
    case 'A40'
        k =30;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =9*ones(k,1);
        prob.HLFideMu=prob.Mu; L=5;
        for i=1:L
            prob.HLFideMu = [prob.HLFideMu, normrnd(prob.Mu,prob.Var)];
        end
    case 'A70'
        k =30;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =9*ones(k,1);
        prob.HLFideMu=prob.Mu; L=5;
        for i=1:L
            prob.HLFideMu = [prob.HLFideMu, normrnd(prob.Mu,prob.Var)];
        end
    case 'A100'
        k =30;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =9*ones(k,1);
        prob.HLFideMu=prob.Mu; L=5;
        for i=1:L
            prob.HLFideMu = [prob.HLFideMu, normrnd(prob.Mu,prob.Var)];
        end
    case 'C1'
        k =20;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =16*ones(k,1);
        prob.HLFideMu=prob.Mu; L=1;
            % [a,b]=sort(normrnd(prob.Mu,prob.Var/2)); [c,d]=sort(b);
            prob.HLFideMu = [prob.HLFideMu, [14;11;9;12;5;8;17;18;6;2;1;3;4;19;10;16;20;7;13;15]];
    case 'C2'
        k =20;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =16*ones(k,1);
        prob.HLFideMu=prob.Mu; L=4;
        prob.HLFideMu = [prob.HLFideMu, [6,14,5,4;7,4,3,1;11,16,1,12;1,3,13,2;4,8,7,3;3,9,17,17;10,15,12,14;19,6,9,5;14,5,2,15;18,18,6,6;8,12,15,9;5,1,10,19;13,13,19,20;20,2,4,7;12,17,14,11;17,19,16,18;2,11,11,16;15,7,18,10;9,20,20,13;16,10,8,8]];
    case 'C3'
        k =20;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =16*ones(k,1);
        prob.HLFideMu=prob.Mu; L=7;
            prob.HLFideMu = [prob.HLFideMu, [14,8,9,3,2,19,13;8,9,13,7,13,1,10;6,3,2,14,18,5,6;16,17,1,19,12,11,2;10,4,4,2,11,6,8;2,7,16,10,10,13,9;9,6,12,5,16,18,1;17,5,14,13,5,14,19;18,12,6,12,4,20,15;12,2,3,6,14,2,3;3,10,20,1,8,12,20;19,19,8,4,17,9,12;11,20,11,8,1,17,4;13,1,7,11,20,8,7;20,16,15,20,7,3,17;15,11,10,9,15,15,5;1,18,5,17,9,4,11;4,15,18,18,19,10,16;7,13,19,16,3,16,14;5,14,17,15,6,7,18]];
    case 'C4'
        k =20;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =16*ones(k,1);
        prob.HLFideMu=prob.Mu; L=10;
        prob.HLFideMu = [prob.HLFideMu, [5,18,2,6,2,5,18,19,9,2;7,14,1,12,9,8,4,9,16,1;9,12,18,19,13,12,11,14,2,13;1,3,5,17,1,2,2,4,3,11;2,11,13,2,16,10,8,7,6,8;3,19,8,3,14,17,13,1,13,14;11,2,3,4,8,7,17,11,10,7;13,9,9,18,18,11,10,16,17,10;6,4,12,10,10,1,6,3,5,4;18,7,4,7,3,16,7,10,12,9;16,10,16,14,15,6,9,6,14,3;12,17,17,20,20,18,5,5,1,5;20,15,10,13,6,15,16,18,15,6;10,5,14,16,5,9,3,12,20,12;17,20,6,1,17,3,1,17,4,20;14,6,15,8,11,19,12,15,8,15;4,13,11,5,4,14,14,20,7,16;19,16,19,11,19,20,15,2,19,17;8,1,7,9,12,13,20,8,11,19;15,8,20,15,7,4,19,13,18,18]];

    case 'D1' % TEST the impact of multi-fideity rankings
        k =10;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =9*ones(k,1);
        prob.HLFideMu = [prob.Mu, prob.Mu,prob.Mu,prob.Mu];
    case 'D2' 
        k =10;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =9*ones(k,1);
        prob.HLFideMu = [prob.Mu,prob.Mu,prob.Mu,[1,2,3,10,9,8,7,6,5,4]'];
    case 'D3' 
        k =10;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =9*ones(k,1);
        prob.HLFideMu = [prob.Mu,prob.Mu,[10,9,8,7,6,1,2,3,4,5]',[1,2,3,10,9,8,7,6,5,4]'];
    case 'D4' 
        k =10;       
        prob.Mu  =2+0.5*[1:1:k]';
        prob.Var =9*ones(k,1);
        prob.HLFideMu = [prob.Mu,[3,8,10,7,6,1,2,5,4,9]',[10,9,8,7,6,1,2,3,4,5]',[1,2,3,10,9,8,7,6,5,4]'];

        
    case 'MMT' 
        prob.case   = 'MMT';  load('MMK2000.mat');
        prob.design =X;  
        prob.Mu  =P.Time'; prob.Var =P.TimeV';
        prob.HLFideMu = [P.Time', P.Time1',P.Time2',P.Time3',P.Time4']; 
    case 'MML' 
        prob.case   = 'MML';  load('MMK2000.mat');
        prob.design =X;  
        prob.Mu  =P.Time'; prob.Var =P.LenthV';
        prob.HLFideMu = [P.Time', P.Lenth1',P.Lenth2',P.Lenth3',P.Lenth4'];
    case 'ECS' 
        load('ECS.mat');  [st,index] =sort(P.T','descend'); tt=index([100:201:2100]);
        prob.design =P.design(tt,:);  
        prob.Mu  =P.T(tt)'; prob.Var =P.Tvar(tt)'; % prob.case='ECS';
        prob.HLFideMu = [P.T(tt)', P.T1(tt)',P.T2(tt)',P.T3(tt)',P.T4(tt)',P.T5(tt)'];
end