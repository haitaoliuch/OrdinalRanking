function F=OptMala(p,mu,sigma)
L = length(mu);
t=1;
for j=2:L-1
    for k=j+1 : L    
        F(t)=((mu(j)-mu(1))^2)/(sigma(1)/p(1)+ sigma(j)/p(j))-...
            ((mu(k)-mu(1))^2)/(sigma(1)/p(1)+ sigma(k)/p(k));
        t=t+1;
    end
end

summation=0;
for i=2:L
    summation =summation + p(i)^2/sigma(i);
end
F(t)=p(1)-sqrt(sigma(1))*sqrt(summation);
t=t+1;
F(t)=sum(p)-1;
end