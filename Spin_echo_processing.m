carbon = [1,3,3,4,5,10];
T2 = zeros(6,3);
n=1;
%% Fit: 'Methanol echo'.
clearvars -except carbon T2 n;
load('methanol.mat');
ydata = ydata./10;
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( 'a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6 7 8 9 10 11 12 13] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 5;
opts.DiffMinChange = 2;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 600;
opts.StartPoint = [0.340385726666133 0.585267750979777 0.223811939491137];
opts.Upper = [25 65 10];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Methanol echo' );
h = plot( fitresult, xData, yData, excludedPoints );
hold on
%errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Echo time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'methecho.png')
grid on
t2 = coeffvalues(fitresult);
err = confint(fitresult);
T2(n,1) = t2(2);
T2(n,2:3) = err(3:4);
n=n+1;

%% Fit: 'Propanol echo'.
clearvars -except carbon T2 n;
load('propanol.mat');
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( 'a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [41 42 43 44 45 46 47 48] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 10;
opts.DiffMinChange = 1;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 600;
opts.StartPoint = [0.0758542895630636 0.0539501186666071 0.530797553008973];
opts.Upper = [10 100 10];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Propanol echo' );
h = plot( fitresult, xData, yData, excludedPoints );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Echo time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'propecho.png')
t2 = coeffvalues(fitresult);
err = confint(fitresult);
T2(n,1) = t2(2);
T2(n,2:3) = err(3:4);
n=n+1;

%% Fit: 'Glycerol echo'.
clearvars -except carbon T2 n;
load('glycerol.mat');
ydata = ydata./10;
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( 'a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 5;
opts.DiffMinChange = 2;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 600;
opts.StartPoint = [0.699076722656686 0.890903252535798 0.959291425205444];
opts.Upper = [10 50 10];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Glycerol echo' );
h = plot( fitresult, xData, yData );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Echo time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'glyecho.png')
t2 = coeffvalues(fitresult);
err = confint(fitresult);
T2(n,1) = t2(2);
T2(n,2:3) = err(3:4);
n=n+1;
%% Fit: 'Butanol echo'.
clearvars -except carbon T2 n;
load('butanol.mat');
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( 'a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6 7 8 9] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 5;
opts.DiffMinChange = 2;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 600;
opts.StartPoint = [0.257508254123736 0.840717255983663 0.254282178971531];
opts.Upper = [10 30 10];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Butanol echo' );
h = plot( fitresult, xData, yData, excludedPoints );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Echo time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'butecho.png')
t2 = coeffvalues(fitresult);
err = confint(fitresult);
T2(n,1) = t2(2);
T2(n,2:3) = err(3:4);
n=n+1;
%% Fit: 'Pentanol echo'.
clearvars -except carbon T2 n;
load('pentanol.mat');
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( 'a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [31 32 33 34 35 36 37 38 39] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 5;
opts.DiffMinChange = 0.5;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 600;
opts.StartPoint = [0.349983765984809 0.196595250431208 0.251083857976031];
opts.Upper = [10 30 10];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Pentanol echo' );
h = plot( fitresult, xData, yData, excludedPoints );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Echo time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'pentecho.png')
t2 = coeffvalues(fitresult);
err = confint(fitresult);
T2(n,1) = t2(2);
T2(n,2:3) = err(3:4);
n=n+1;
%% Fit: 'Decanol echo'.
clearvars -except carbon T2 n;
load('decanol.mat');
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( 'a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [31 32 33 34 35 36 37 38] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 5;
opts.DiffMinChange = 0.5;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 600;
opts.StartPoint = [0.91719366382981 0.285839018820374 0.757200229110721];
opts.Upper = [30 30 10];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Decanol echo' );
h = plot( fitresult, xData, yData, excludedPoints );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Echo time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'dececho.png')
t2 = coeffvalues(fitresult);
err = confint(fitresult);
T2(n,1) = t2(2);
T2(n,2:3) = err(3:4);
n=n+1;
%% No. of carbon atoms vs. T2
figure; errorbar(carbon,T2(:,1),T2(:,1)-T2(:,2),'x--')
xlabel('No. of carbon atoms')
ylabel('T2 (ms)')
text(carbon(1)+0.1,T2(1)+1,"Methanol")
text(carbon(2)+0.1,T2(2)+1,"Propanol")
text(carbon(3)+0.1,T2(3)+1,"Glycerol")
text(carbon(4)+0.1,T2(4)+1,"Butanol")
text(carbon(5)+0.1,T2(5)+1,"Pentanol")
text(carbon(6)+0.1,T2(6)+1,"Decanol")
grid on
xlim([0 11]);