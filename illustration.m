% clc,clear,close all
% load('..\MFRS\Res\OREI2\D4_T100000_R1183.mat')
% C =count;
% x =1000:100:100000;
% figure; hold on
% yyaxis left;
% plot(x,6*log(x),'-','LineWidth',2);
% plot(x,C(3,x),'--','LineWidth',2);
% ylabel('$N_{i}^n$' , 'Interpreter','LaTex')
% yyaxis right;
% plot(x,C(4,x),'-','LineWidth',2); %'color','[0.4940 0.1840 0.5560]'
% ylabel('$N_{i}^n$' , 'Interpreter','LaTex')
% xlabel('Budget $n$' , 'Interpreter','LaTex')
% set(gca,'FontName', 'Times New Roman')
% set(gca,'FontSize',18);% ylim([0.3 1])
% legend('$6\log n$','$i=3$','$i=4$','Interpreter','LaTex','Location','best')
% print('-painters','-depsc','mfor_NumBudget_n2')
% 
% clc,clear,close all
% load('..\MFRS\Res\OREI\D4_T10000000_R1.mat')
% C =count;
% x =1000:100:10000000;
% addpath('Problems','queue','ECSim'); P='D4'; prob = Problems(P);
% Sim = RankSim(prob,prob.Mu);
% weight =((sqrt(prob.Var)./(prob.Mu-prob.Mu(1)))).^2;
% ratio =weight(3)/weight(4);
% y =C(3,:)./C(4,:);
% plot(x,y(x),'b-','LineWidth',2);
% hold on;
% yline(ratio,'r--','LineWidth',2);
% 
% xlabel('Budget $n$' , 'Interpreter','LaTex')
% set(gca,'FontName', 'Times New Roman')
% set(gca,'FontSize',18); % ylim([-0.1 2.5])
% legend('$N_{3}^n/N_{4}^n$','Limit','Interpreter','LaTex','Location','best')
% print('-painters','-depsc','OptimalRatio34')
% 
% clc,clear,close all
% load('..\MFRS\Res\MFOR\D4_T100000_R1000.mat')
% C =count;
% x =1000:100:100000;
% addpath('Problems','queue','ECSim'); P='D4'; prob = Problems(P);
% Sim = RankSim(prob,prob.Mu);
% weight =((sqrt(prob.Var)./(prob.Mu-prob.Mu(1)))).^2;
% ratio =weight(3)/weight(4);
% y =C(3,:)./C(4,:);
% plot(x,y(x),'b-','LineWidth',2);
% hold on;
% yline(ratio,'r--','LineWidth',2);
% C=C/100000; sig =sqrt(prob.Var);
% for n=1:100000
%     p=C(:,n)./sig; yy(n)=sum(p.^2)-2*p(1)^2;
% end 
% plot(x,yy(x)+2,'m-','LineWidth',2);
% xlabel('Budget $n$' , 'Interpreter','LaTex')
% set(gca,'FontName', 'Times New Roman')
% set(gca,'FontSize',18); % ylim([-0.1 2.5])
% legend('$N_{3}^n/N_{4}^n$','Limit','$\Delta^n+2$' ,'Interpreter','LaTex','Location','best')
% print('-painters','-depsc','OptimalRatio34')

% clc,clear,close all
% x = 200:20:1000;
% figure(1)
% hold on
% load('..\MFRS\Res\OREI2\A4_T1000_R10000.mat')
% plot(x,Rep.PCS(x),'r->','LineWidth',1);
% load('..\MFRS\Res\MFOR\A4_T1000_R10000.mat')
% plot(x,Rep.PCS(x(:)),'m-p','LineWidth',1);
% load('..\MFRS\Res\AOAP\A4_T1000_R10000.mat')
% plot(x,Rep.PCS(x(:)),'g-s','LineWidth',1);
% load('..\MFRS\Res\OCBA\A4_T1000_R10000.mat')
% plot(x,Rep.PCS(x),'-o','color','[0.6350 0.0780 0.1840]','LineWidth',1);
% load('..\MFRS\Res\EA\A4_T1000_R10000.mat')
% plot(x,Rep.PCS(x),'b-d','LineWidth',1);
% ylabel('PCS','FontName', 'Times New Roman')
% xlabel('Budget' , 'Interpreter','LaTex')
% set(gca,'YColor', 'k','FontName', 'Times New Roman')
% set(gca,'FontSize',18);% ylim([0.3 1])
% % legend({'{MFOR}','mMFOR','{AOAP}', '{OCBA}','{EA}'},'Location','best')
% print('-painters','-depsc','A4_PCS')
%  
% clc,clear,close all
% x = 200:20:1000;
% figure(1); hold on
% load('..\MFRS\Res\OREI2\A2_T1000_R10000.mat')
% plot(x,Rep.EOC(x),'r->','LineWidth',1);
% load('..\MFRS\Res\MFOR\A2_T1000_R10000.mat')
% plot(x,Rep.EOC(x(:)),'m-p','LineWidth',1);
% load('..\MFRS\Res\AOAP\A2_T1000_R10000.mat')
% plot(x,Rep.EOC(x(:)),'g-s','LineWidth',1);
% load('..\MFRS\Res\OCBA\A2_T1000_R10000.mat')
% plot(x,Rep.EOC(x),'-o','color','[0.6350 0.0780 0.1840]','LineWidth',1);
% load('..\MFRS\Res\EA\A2_T1000_R10000.mat')
% plot(x,Rep.EOC(x),'b-d','LineWidth',1);
% ylabel('EOC','FontName', 'Times New Roman')
% xlabel('Budget' , 'Interpreter','LaTex')
% set(gca,'YColor', 'k','FontName', 'Times New Roman')
% set(gca,'FontSize',18); % xlim([x(1) x(end)]); ylim([0 1])
% legend({'{MOR}','mMOR','{AOAP}', '{OCBA}','{EA}'},'Location','best')
% print('-painters','-depsc','A2_EOC')

% clc,clear,close all
% x = 1000:100:5000;
% figure(1)
% hold on
% load('..\MFRS\Res\OREI2\ECS_T5000_R10000.mat')
% plot(x,Rep.PCS(x),'r->','LineWidth',1);
% load('..\MFRS\Res\MFOR\ECS_T5000_R10000.mat')
% plot(x,Rep.PCS(x(:)),'m-p','LineWidth',1);
% load('..\MFRS\Res\AOAP\ECS_T5000_R10000.mat')
% plot(x,Rep.PCS(x(:)),'g-s','LineWidth',1);
% load('..\MFRS\Res\OCBA\ECS_T5000_R10000.mat')
% plot(x,Rep.PCS(x),'-o','color','[0.6350 0.0780 0.1840]','LineWidth',1);
% load('..\MFRS\Res\EA\ECS_T5000_R10000.mat')
% plot(x,Rep.PCS(x),'b-d','LineWidth',1);
% ylabel('PCS','FontName', 'Times New Roman')
% xlabel('Budget' , 'Interpreter','LaTex')
% set(gca,'YColor', 'k','FontName', 'Times New Roman')
% set(gca,'FontSize',18); % xlim([x(1) x(end)]); ylim([0 1])
% legend({'{MOR}','mMOR','{AOAP}', '{OCBA}','{EA}'},'Location','best')
% print('-painters','-depsc','ECS_PCS')

% clc,clear,close all
% x = 1000:100:5000;
% figure(1)
% hold on
% load('..\MFRS\Res\OREI2\ECS_T5000_R10000.mat')
% plot(x,Rep.EOC(x),'r->','LineWidth',1);
% load('..\MFRS\Res\MFOR\ECS_T5000_R10000.mat')
% plot(x,Rep.EOC(x(:)),'m-p','LineWidth',1);
% load('..\MFRS\Res\AOAP\ECS_T5000_R10000.mat')
% plot(x,Rep.EOC(x(:)),'g-s','LineWidth',1);
% load('..\MFRS\Res\OCBA\ECS_T5000_R10000.mat')
% plot(x,Rep.EOC(x),'-o','color','[0.6350 0.0780 0.1840]','LineWidth',1);
% load('..\MFRS\Res\EA\ECS_T5000_R10000.mat')
% plot(x,Rep.EOC(x),'b-d','LineWidth',1);
% ylabel('EOC','FontName', 'Times New Roman')
% xlabel('Budget' , 'Interpreter','LaTex')
% set(gca,'YColor', 'k','FontName', 'Times New Roman')
% set(gca,'FontSize',18); % xlim([x(1) x(end)]); ylim([0 1])
% % legend({'{MOR}','mMOR', '{OCBA}','{EA}'},'Location','best')
% print('-painters','-depsc','ECS_EOC')

% clc,clear,close all
% x = 50:50:500;
% figure(1)
% hold on
% load('..\MFRS\Res\OREI\C1_T1000_R10000.mat'); base= 1;% Rep.PCS(x);
% plot(x,Rep.PCS(x)./base,'r->','LineWidth',1);
% load('..\MFRS\Res\OREI\C2_T1000_R10000.mat')
% plot(x,Rep.PCS(x)./base,'g-s','LineWidth',1);
% load('..\MFRS\Res\OREI\C3_T1000_R10000.mat')
% plot(x,Rep.PCS(x)./base,'m-o','LineWidth',1);
% load('..\MFRS\Res\OREI\C4_T1000_R10000.mat')
% plot(x,Rep.PCS(x)./base,'b-d','LineWidth',1);
% ylabel('PCS','FontName', 'Times New Roman')
% xlabel('Budget' , 'Interpreter','LaTex')
% set(gca,'YColor', 'k','FontName', 'Times New Roman')
% set(gca,'FontSize',18);  xlim([x(1) x(end)]); % ylim([0 1])
% legend('$L=1$','$L=4$', '$L=7$','$L=10$','Interpreter','LaTex','Location','best')
% print('-painters','-depsc','C_PCSratio')
% 
clc,clear,close all
x = 50:50:500;
figure(1)
hold on
load('..\MFRS\Res\OREI\C1_T1000_R10000.mat'); base=1;% Rep.EOC(x);
plot(x,Rep.EOC(x)./base,'r->','LineWidth',1);
load('..\MFRS\Res\OREI\C2_T1000_R10000.mat')
plot(x,Rep.EOC(x)./base,'g-s','LineWidth',1);
load('..\MFRS\Res\OREI\C3_T1000_R10000.mat')
plot(x,Rep.EOC(x)./base,'m-o','LineWidth',1);
load('..\MFRS\Res\OREI\C4_T1000_R10000.mat')
plot(x,Rep.EOC(x)./base,'b-d','LineWidth',1);
ylabel('EOC','FontName', 'Times New Roman')
xlabel('Budget' , 'Interpreter','LaTex')
set(gca,'YColor', 'k','FontName', 'Times New Roman')
set(gca,'FontSize',18); xlim([x(1) x(end)]);  % xlim([x(1) x(end)]); ylim([0 1])
legend('$L=1$','$L=4$', '$L=7$','$L=10$','Interpreter','LaTex','Location','best')
print('-painters','-depsc','C_EOCratio')

% clc,clear,close all
% x = 20:10:300;
% figure(1)
% hold on
% load('..\MFRS\Res\OREI\D1_T1000_R10000.mat')
% plot(x,Rep.PCS(x),'r->','LineWidth',1);
% load('..\MFRS\Res\OREI\D2_T1000_R10000.mat')
% plot(x,Rep.PCS(x(:)),'g-s','LineWidth',1);
% load('..\MFRS\Res\OREI\D3_T1000_R10000.mat')
% plot(x,Rep.PCS(x),'m-o','LineWidth',1);
% load('..\MFRS\Res\OREI\D4_T1000_R10000.mat')
% plot(x,Rep.PCS(x),'b-d','LineWidth',1);
% ylabel('PCS','FontName', 'Times New Roman')
% xlabel('Budget' , 'Interpreter','LaTex')
% set(gca,'YColor', 'k','FontName', 'Times New Roman')
% set(gca,'FontSize',18);  xlim([x(1) x(end)]);
% legend({'{MFORf0}','{MFORf1}', '{MFORf2}','{MFORf3}'},'Location','best')
% print('-painters','-depsc','D_PCS')

clc,clear,close all
x = 20:10:300;
figure(1); hold on
load('..\MFRS\Res\OREI\D1_T1000_R10000.mat')
plot(x,Rep.EOC(x),'r->','LineWidth',1);
load('..\MFRS\Res\OREI\D2_T1000_R10000.mat')
plot(x,Rep.EOC(x(:)),'g-s','LineWidth',1);
load('..\MFRS\Res\OREI\D3_T1000_R10000.mat')
plot(x,Rep.EOC(x),'m-o','LineWidth',1);
load('..\MFRS\Res\OREI\D4_T1000_R10000.mat')
plot(x,Rep.EOC(x),'b-d','LineWidth',1);
ylabel('EOC','FontName', 'Times New Roman')
xlabel('Budget' , 'Interpreter','LaTex')
set(gca,'YColor', 'k','FontName', 'Times New Roman')
set(gca,'FontSize',18); xlim([x(1) x(end)]); % ylim([0.1,1.2])
legend({'$C_0$','$C_1$', '$C_2$','$C_3$'},'Interpreter','LaTex','Location','best')
print('-painters','-depsc','D_EOC')







