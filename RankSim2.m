% function [Sim,best] = RankSim(prob,mu_est,beta_est)
%     M = prob.HLFideMu;
%     M(:,1) = mu_est;
%     [~,T] = sort(M,1,'ascend');  % sort each column
%     [~,R] = sort(T,1,'ascend');
%     
%     dif =abs(R(:,1)-R(:,2:end)); [K,b]=size(dif);   
%     for i=1:b
%         rho(i) =corr(R(:,1),R(:,i+1),'type' ,'Spearman');
%     end
%     for i=1:K
%         r(:,i) =1./(exp(-dif(i,:)*0.1)+1);
%     end
%     rho =rho/sum(abs(rho));
%     Sim =(rho*r)';
%     % find the best design
%     for i=1:K
%         for j=1:b
%             temp(j) = R(i,j+1)*rho(j)/beta_est(i) + R(i,1);
%         end
%         S(i)=sum(temp);
%     end
%     [~,best] =min(S);
% end


function [Sim,TT] = RankSim2(prob,mu_est)
    M = prob.HLFideMu;
    M(:,1) = mu_est;
    [~,T] = sort(M,1,'ascend');  % sort each column
    [~,R] = sort(T,1,'ascend');
    
    dif =abs(R(:,1)-R(:,2:end)); [K,b]=size(dif);   
    for i=1:K
        r(:,i) =1./(exp(-dif(i,:)*0.1)+1);
    end
    for i=1:b
        rho(i) =-corr(R(:,1),R(:,i+1),'type' ,'Spearman');
    end
    rho =abs((rho+1)/2);
    
    Sim =(rho*r)';
end