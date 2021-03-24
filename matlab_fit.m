I_0 = 0.2;

%%% Verification
Time = (1:15)';
I_e = @(t) I(2,t);
MeasData = I_e(Time)+rand(size(Time))*1e-3;
%%%

function tau = fitFOSresponse(I_0,time,x)
	I = @(tau,t) I_0*(1-exp(tau./t));
	FitOptions = fitoptions('Method','NonlinearLeastSquares','StartPoint',1);
	FitFun = fittype(I,'independent','t','coefficients','tau');
	FitObj = fit(Time,MeasData,FitFun,FitOptions);
	tau = FitObj.tau;
end