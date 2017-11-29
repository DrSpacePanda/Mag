clear 
close all

Start;

tau=2*pi*RO/V0 /(LAMB0/V0);

h=10^-4 * tau;

NT= 200;

N=NT*(tau/h) 
SIZE=1e3; dN=N/SIZE;


X=[ 0 0 3   0 0 0] ;
Tout=zeros(1,SIZE);

Xout=zeros( [ 6, SIZE]);
Xout1=X; Xout2=zeros(size(X));
Tout1=0;

tic
for i = 2:N
    
      

   [ Xout2,Fdist,Tout2]=runge(@FEB, Xout1, Tout1 ,h);
 
   if rem(i,dN) == 0
        Xout(:,fix(i/dN)+1)=Xout2(:);
        Tout(fix(i/dN)+1) = Tout2;
   end
    
    if rem(i,0.01*N)== 0
        toc
        i / (N)
        tic
    end
    
    Xout1=Xout2;Tout1=Tout2;
end

%%
clear('R')
figure
R=(Xout(1,:).^2+Xout(2,:).^2+0*Xout(3,:).^2).^0.5;
% plot3(Xout(1,:),Xout(2,:),Xout(3,:))
plot(Tout*(LAMB0/V0) , (R) * LAMB0/1000)
% plot(Tout*(LAMB0/V0) , (Xout(1,:)) * LAMB0/1000)

%%
clear('R','RT')
figure
R=Xout(4,:).^2+Xout(5,:).^2+Xout(6,:).^2;
R=((R)*V0^2*Mp/(2*EVD) );
RT=( (Qp* 1 *E0)^2/Mp ) * ((Tout*(TAU) ).^2)/2 /EVD ;
% plot3(Xout(1,:),Xout(2,:),Xout(3,:))
% plot(Tout*(LAMB0/V0) , (R)*V0^2*Mp/(2*EVD))

hold on
% plot (Tout*(TAU) , Qp*E0*( Qp*E0/Mp ) * (Tout*(TAU) ).^2/2 /EVD ./ ((R)*V0^2*Mp/(2*EVD) )  -1 )

plot (Tout/tau , (RT./R)-1  )
% plot (Tout*(TAU) , R, Tout*(TAU) , RT  )

% plot (Tout*(LAMB0/V0) , (R-R(1) ) )

% plot (Tout*(LAMB0/V0) , (Qp*10*E0*( Qp*10*E0/Mp ) * (Tout*(LAMB0/V0) ).^2/2 /EVD - ((R)*V0^2*Mp/(2*EVD) ))/((R)*V0^2*Mp/(2*EVD) )   )