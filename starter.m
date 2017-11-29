clear all
global L ALF BET  TAU  RO  V0 B0 LAMB0 Tetta Mp Qp R_E Lx Ly Lz Bound_parm EVD kx ky kz w;
% light_spead=299792458;% АТАТА!!!! 
R_E=6378.1*10^3;% RE - м (метр)
EVD=1.602176565*10^-19; %эВ - дж
Qp=1.602176565*(10^-19); %Q - Кл
Mp=1.672621777*(10^-27) ; % M -Кг
Tetta=1 %Коэффициент массы, масса измеряется в массах протона.
B0=10*10^-9;%(Tl)


W_start=100000; %eV
% V0=1.3841*10^4*sqrt(W_start)*sqrt(1/Tetta)
V0=sqrt(2*EVD*W_start/(Mp*Tetta)) %sqrt(Дж / кг)=sqrt(кг*м^2 / c^2 кг)=v/c
RO=abs(Tetta*Mp*V0/(Qp*B0)) % кг*м / с*Кл*Тл = кг*м А с^2 / с*А с*кг = м
L=1.0*R_E; 
LAMB0=sqrt(L*RO);%LAMB0=(10*RO);
TAU=LAMB0/V0;
% RO/LAMB0
ALF=sign(Qp)*sqrt(L/RO);
BET=((Qp*LAMB0)/(Mp*Tetta*V0^2));% BET=(Qp*TAU)/(Mp*Tetta*V0);% BET=(Qp*TAU^2)/(Mp*LAMB0);


%Параметры границ плазмоида
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Lz=L/LAMB0;
Ly=5*R_E/LAMB0;
Lx=4*R_E/LAMB0;
Bound_parm = (0.2*16*Mp*V0/(Qp*B0))/LAMB0;


%Параметры флуктуаций
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
EPS_T=1; %Характерная энергия для частиц в резонансе

% V_phase = ( 2*W_start*EVD/Mp * EPS_T/Tetta )^0.5  ; 

% V_phase = ( 2*W_start*EVD/Mp * EPS_T/Tetta )^0.5  ; 
V_phase = ( W_start*EVD/Mp * EPS_T/Tetta /2 )^0.5  

% 
 w =  2*pi * 0.1;% *  TAU ; % безразмерная циклическая частота
% 
k= w/V_phase; % безразмерный волновой вектор
kx = k/(2)^0.5;
ky = k/(2)^0.5;
kz = 0;



