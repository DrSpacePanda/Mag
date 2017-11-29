global BET ALF LAMB0 L TAU

EVD=1.602176565*(10^-19); %эВ - дж

R_E=6378.1*10^3;% RE - м (метр)

Qp=1.602176565*(10^-19); %Q - Кл
Mp=1.672621777*(10^-27) ; % M -Кг
Tetta=1 %Коэффициент массы, масса измеряется в массах протона.

B0=10*(10^-9);%(Tl)
E0=0.1*(10^-3); % 1e-3

W_start=20;

V0=(2*EVD*W_start/(Mp*Tetta)) ^ 0.5; %sqrt(Дж / кг)=sqrt(кг*м^2 / c^2 кг)=м/c
RO=abs(Tetta*Mp*V0/(Qp*B0)); % кг*м / с*Кл*Тл = кг*м А с^2 / с*А с*кг = м
L=1.0*R_E; 
LAMB0=sqrt(L*RO);%LAMB0=(10*RO);
TAU=LAMB0/V0;
% RO/LAMB0

% ALF=sign(Qp)*(L/RO)^0.5 * ( E0 / (V0*B0) ) ;
ALF= Qp*E0*LAMB0/(Mp*Tetta*V0^2) ;

BET=((Qp*B0*LAMB0)/(Mp*Tetta*V0));% BET=(Qp*TAU)/(Mp*Tetta*V0);% BET=(Qp*TAU^2)/(Mp*LAMB0);




