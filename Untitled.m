clc, clear all, close all
addpath('Problems','queue','ECSim'); P='A4'; prob = Problems(P); prob.T   =1000000; R=10000; 

a =1:1:length(prob.Mu);

for i=1:prob.T
    b = normrnd(prob.Mu,sqrt(prob.Var)); 
    rho(i)=corr(a',b,'type' ,'Spearman');
end
histogram(rho,'BinWidth',0.05,'Normalization','probability','FaceColor','b')
ylabel('Probability' , 'Interpreter','LaTex')
xlabel('Correlation' , 'Interpreter','LaTex')
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize',16);
% legend('$i=3$','$i=4$','Interpreter','LaTex','Location','best')
print('-painters','-depsc','pdfA1')

[f,x] = ecdf(rho);
plot(x,f,'b-','LineWidth',2)
ylabel('Empirical CDF' , 'Interpreter','LaTex')
xlabel('Correlation' , 'Interpreter','LaTex')
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize',16);
