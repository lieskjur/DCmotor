addpath('Mereni')
addpath('fittingTools')
plotORnot = true;

% Kotva
I_a = 10; %A
U_a = 6; %V
out.R_a = U_a/I_a;

PK = table2array(readtable('Mereni/PrechodKotva.CSV','range',[19,4]));
tau_K = fitFOSresponse(0,[],PK(:,1),PK(:,2),plotORnot);
out.L_a = tau_K*out.R_a;

% Buzeni
I_b = 0.5; %A
U_b = 27.6; %V
out.R_b = U_b/I_b;

PB = table2array(readtable('Mereni/PrechodBuzeni.CSV','range',[19,4]));
tau_B = fitFOSresponse(0,[],PB(:,1),PB(:,2),plotORnot);
out.L_b = tau_B*out.R_b;

% Konst. stroje
U_a = 60.8; %V
n = 875; %min^-1
I_a = 2.6; %A
I_b = 1.5; %A

U_i = U_a - out.R_a*I_a;
om = n*pi/30;
out.C_ss = U_i / (om*I_b);

% Zatez. momenty
r = 1019;
G_rot = 2055; %g
G_klid = 2010; %g
out.Mz = (G_rot-G_klid)*r*9.81*1e-3;

% Moment setrvacnosi
DB = table2array(readtable('Mereni/DobehCH2.CSV','range',[19,4]));
[~,dwdt] = fitLin(0.484,6.23,DB(:,1),DB(:,2),plotORnot);
out.J = -1/dwdt;

out