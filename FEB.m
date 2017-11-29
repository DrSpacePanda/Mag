function [ X_out ] = FEB( X, T )

global BET ALF LAMB0 L TAU

r=[X(1) X(2) X(3)];
v=[X(4) X(5) X(6)];

% E=[ 0 0.1 0];
% B=[ tanh( r(3)*LAMB0/L ) 0 0.1]; % B0

E=[0 1 0];
B=[0 0 0];

A1=v;
A2=ALF*E + BET * cross(v,B);

X_out=[A1 A2];

end

