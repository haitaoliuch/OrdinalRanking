clc, clear all, close all
addpath('Problems','queue','ECSim'); P='D4'; prob = Problems(P); prob.T   =10^6; R=500;    
for index=1:2
    if     index==1
        policy ='OREI'; 
    elseif index==2
        policy ='MFOR'; 
    elseif index==3
        policy ='AOAP'; 
    elseif index==4
        policy ='OCBA'; 
    elseif index==5
        policy ='KG'; 
    elseif index==6
        policy ='EA'; 
    end
    count =zeros(10,prob.T);
    parfor r=1:R
        tic
        [~,num] = AcquisionPol(prob,policy); % num is a k by T matrix
        num =cumsum(num,2);
        count = count+num;
        toc
    end
    count = count/R;
    folder= fullfile('..\MFRS/Res',policy);
    [~,~]      = mkdir(folder); % make new folder
    save(fullfile(folder,sprintf('%s_T%d_R%d.mat',P,prob.T,R)),'count'); 
end





