
function [Sim,TT] = RankSim(prob,mu_est)
    M = prob.HLFideMu;
    M(:,1) = mu_est;
    [~,T] = sort(M,1,'ascend');  % sort each column
    [~,R] = sort(T,1,'ascend');
    
    dif =abs(R(:,1)-R(:,2:end)); [K,b]=size(dif);   
    for i=1:K
        r(:,i) =1./(exp(-dif(i,:)*0.1)+1);
    end
    for i=1:b
        rho(i) =corr(R(:,1),R(:,i+1),'type' ,'Spearman');
    end
    rho =rho+1;
    rho =rho/sum(rho);
    Sim =(rho*r)';
end