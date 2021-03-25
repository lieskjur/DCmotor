clc; clear all; close all;

% Nacteni vyhodnoceni mereni
meas = Mereni(false);

% Namerena prechodova char.
addpath('Mereni')
mer.V_w = table2array(readtable('Mereni/RozbehCH1.CSV','range',[19,4]));
mer.I_a = table2array(readtable('Mereni/RozbehCH2.CSV','range',[19,4]));

% Simulace
SimOut = SimRun(meas,0,120,zeros(9,1));
sim.V_w = [SimOut.om.Time,80/1000*SimOut.om.Data];
sim.I_a = [SimOut.I_a.Time,SimOut.I_a.Data];

% Vizualizace
figure; hold on; c = 0;%>>
for i = ["mer","sim"]
	for j = ["V_w","I_a"]
		fld = eval(i+"."+j);
		plot(fld(:,1),fld(:,2))
		c = c+1;
		lgd(c) = j+" - "+i;
	end
end
legend(lgd) %<<