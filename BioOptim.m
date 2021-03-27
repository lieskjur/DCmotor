clear all
[meas,mer,in,U]=Optim(zeros(9,1));

%delta: R_a,R_b,L_a,L_b,c_ss,M_z,J,U_a,U_b

% ValMin = [0.2,5,0.01,5,0.3,0.2,0.06,90,90];
% ValMax = [3,60,0.9,57,0.8,50,0.09,130,130];
% deltaMin=ValMin-[meas.R_a,meas.R_b,meas.L_a,meas.L_b,meas.c_ss,meas.M_z,meas.J,U_a,U_b];
% deltaMax=ValMax-[meas.R_a,meas.R_b,meas.L_a,meas.L_b,meas.c_ss,meas.M_z,meas.J,U_a,U_b];

deltaMin=[meas.R_a,meas.R_b,meas.L_a,meas.L_b,meas.c_ss,meas.M_z,meas.J,U.a,U.b].*(-0.6);
deltaMax=[meas.R_a,meas.R_b,meas.L_a,meas.L_b,meas.c_ss,meas.M_z,meas.J,U.a,U.b].*0.6;


disp('zacina ga optimalizace, cas:')
starttime=clock;
disp([num2str(starttime(4)),':',num2str(starttime(5))]);

C=@(delta) Cost(delta,meas,mer,in,U);
% C=@(delta) test(delta,meas);
options = optimoptions('ga','MaxTime',3600*5);
[OptimDelta,OptimCost] = ga(C,length(deltaMin),[],[],[],[],deltaMin,deltaMax,[],options);

save results

disp('konec ga optimalizace, cas:')
stoptime=clock;
disp([num2str(stoptime(4)),':',num2str(stoptime(5))]);

[measnew,~,~,Unew]=Optim(OptimDelta);