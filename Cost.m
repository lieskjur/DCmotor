function [cost] = Cost(delta,meas,mer,in,U)
%delta: R_a,R_b,L_a,L_b,c_ss,M_z,J,U_a,U_b

SimOut = SimRun(meas,0,U.a,U.b,delta);
sim.V_w = [SimOut.om.Time,80/1000*30/pi*SimOut.om.Data];
sim.I_a = [SimOut.I_a.Time,SimOut.I_a.Data];


cost=(sum((sim.V_w(in.sim,2)-mer.V_w(in.mer,2)).^2))+(sum((sim.I_a(in.sim,2)-mer.I_a(in.mer,2)).^2));
end

