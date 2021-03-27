function SimOut = SimRun(meas,t_0,U_a,U_b,delta)
	%meas = load('MereneHodnoty.mat');

	R_a = meas.R_a + delta(1);
	R_b = meas.R_b + delta(2);
	L_a = meas.L_a + delta(3);
	L_b = meas.L_b + delta(4);
	c_ss = meas.c_ss + delta(5);
	M_z = meas.M_z + delta(6);
	J = meas.J + delta(7);
	U_a = U_a + delta(8);
	U_b = U_b + delta(9);

	options = simset('SrcWorkspace','current');
	SimOut = sim('DCmotor',[],options);

	save('SimWorkspace.mat')
end