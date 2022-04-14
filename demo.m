
clc, clear all, close all
addpath('Problems','queue','ECSim'); P='D4'; prob = Problems(P); prob.T   =5*10^6; R=1;    
for index=1:1
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
    for r=1:R
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


clc, clear all, close all
addpath('Problems','queue','ECSim'); P='E2'; prob = Problems(P); prob.T   =1000; R=10000;    
for index=1:1
    if     index==1
        policy ='OREI'; 
    elseif index==2
        policy ='EA'; 
    elseif index==3
        policy ='AOAP'; 
    elseif index==4
        policy ='OCBA';
    elseif index==5
        policy ='MFOR';
    end
    for r=1:R
        Out = AcquisionPol(prob,policy); 
        OC(r,:) =Out.oc;
        CS(r,:) =Out.true;
    end
    Rep.EOC  = mean(OC); Rep.PCS  = mean(CS);  
    folder= fullfile('..\MFRS/Res',policy);
    [~,~]      = mkdir(folder); % make new folder
    save(fullfile(folder,sprintf('%s_T%d_R%d.mat',P,prob.T,R)),'Rep'); 
end

clc, clear all, close all
addpath('Problems','queue','ECSim'); P='E3'; prob = Problems(P); prob.T   =1000; R=10000;    
for index=1:1
    if     index==1
        policy ='OREI'; 
    elseif index==2
        policy ='EA'; 
    elseif index==3
        policy ='AOAP'; 
    elseif index==4
        policy ='OCBA';
    elseif index==5
        policy ='MFOR';
    end
    for r=1:R
        Out = AcquisionPol(prob,policy); 
        OC(r,:) =Out.oc;
        CS(r,:) =Out.true;
    end
    Rep.EOC  = mean(OC); Rep.PCS  = mean(CS);  
    folder= fullfile('..\MFRS/Res',policy);
    [~,~]      = mkdir(folder); % make new folder
    save(fullfile(folder,sprintf('%s_T%d_R%d.mat',P,prob.T,R)),'Rep'); 
end

clc, clear all, close all
addpath('Problems','queue','ECSim'); P='E4'; prob = Problems(P); prob.T   =1000; R=10000;    
for index=1:1
    if     index==1
        policy ='OREI'; 
    elseif index==2
        policy ='EA'; 
    elseif index==3
        policy ='AOAP'; 
    elseif index==4
        policy ='OCBA';
    elseif index==5
        policy ='MFOR';
    end
    for r=1:R
        Out = AcquisionPol(prob,policy); 
        OC(r,:) =Out.oc;
        CS(r,:) =Out.true;
    end
    Rep.EOC  = mean(OC); Rep.PCS  = mean(CS);  
    folder= fullfile('..\MFRS/Res',policy);
    [~,~]      = mkdir(folder); % make new folder
    save(fullfile(folder,sprintf('%s_T%d_R%d.mat',P,prob.T,R)),'Rep'); 
end

