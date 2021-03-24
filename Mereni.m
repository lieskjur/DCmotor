addpath('Mereni')

% Kotva
I_a = 10; %A
U_a = 6; %V
R_a = U_a/I_a;

PK = table2array(readtable('Mereni/PrechodKotva.CSV','range',[19,4]));
tau_K = fitFOSresponse(0,PK(:,1),PK(:,2),true);

% Buzeni
I_b = 0.5; %A
U_b = 27.6; %V
R_b = U_b/I_b;

PK = table2array(readtable('Mereni/PrechodKotva.CSV','range',[19,4]));
tau_K = fitFOSresponse(0,PK(:,1),PK(:,2),true);

% Konst. stroje
U_a = 60.8; %V
n = 875; %min^-1
I_a = 2.6; %A
I_b = 1.5; %A

% Zatez. momenty
r = 1019
G_rot = 2055; %g
G_klid = 2010; %g

%



