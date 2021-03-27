function [meas,mer,in,U] = Optim(delta)
%casy mereni a simulace
t.sim_0=0;
t.mer_0=-0.016;
t.max=0.4;
%krok simulace 0.0002 sec
U_a=120;
U_b=120;
U.a=U_a;
U.b=U_b;
% Nacteni vyhodnoceni mereni
meas = Mereni(false);

% Namerena prechodova char.
addpath('Mereni')
mer.I_a = table2array(readtable('Mereni/RozbehCH1.CSV','range',[19,4]));
mer.V_w = table2array(readtable('Mereni/RozbehCH2.CSV','range',[19,4]));

% Simulace
SimOut = SimRun(meas,0,U_a,U_b,delta);
sim.V_w = [SimOut.om.Time,80/1000*30/pi*SimOut.om.Data];
sim.I_a = [SimOut.I_a.Time,SimOut.I_a.Data];

in.sim = find((sim.V_w(:,1)>=t.sim_0) & (sim.V_w(:,1)<=(t.max+t.sim_0)));
in.mer = find((mer.V_w(:,1)>=t.mer_0) & (mer.V_w(:,1)<=(t.max+t.mer_0)));


% Vizualizace
figure; hold on; c = 0; %>>
for i = ["mer"]
	for j = ["V_w","I_a"]
		fld = eval(i+"."+j);
		plot(fld(in.mer,1)-t.mer_0,fld(in.mer,2))
		c = c+1;
		lgd(c) = j+" - "+i;
	end
end
for i = ["sim"]
	for j = ["V_w","I_a"]
		fld = eval(i+"."+j);
		plot(fld(in.sim,1),fld(in.sim,2))
		c = c+1;
		lgd(c) = j+" - "+i;
	end
end
legend(lgd) %<<

% Vysledky
SimWS = load('SimWorkspace.mat')
end

