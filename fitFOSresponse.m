function tau = fitFOSresponse(t_0,time,I_meas,plotORnot)
	if nargin < 3; plotORnot = false; end;
	
	in = find(time>=t_0)
	I_0 = I_meas(in(1));

	%I = @(tau,t) I_0*(1-exp(-(t-t_0)/tau));
	I = @(tau,t) I_0*exp(-(t-t_0)/tau);
	FitOptions = fitoptions('Method','NonlinearLeastSquares','StartPoint',1);
	FitFun = fittype(I,'independent','t','coefficients','tau');
	FitObj = fit(time(in),I_meas(in),FitFun,FitOptions);
	tau = FitObj.tau

	if plotORnot == true
		figure
		hold on
		plot(time,I_meas);
		plot(time(in),I(tau,time(in)));
		scatter(t_0,I_0);
	end
end