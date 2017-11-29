function [ Xout,Fdist,Tout] = runge_kuttaG(Fode, X,T,h)

k1=Fode(X,T);
k2=Fode(X+k1*h/2,T+h/2);
k3=Fode(X+k2*h/2,T+h/2);
k4=Fode(X+k3*h,T+h/2);

Xout=X+(h/6)*(k1+2*k2+2*k3+k4);
Xout(7,:)=X(7,:);
Tout=T+h;
Fdist=0;


end

