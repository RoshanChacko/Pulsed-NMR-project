close all
clear all
carbon = [1,3,3,4,5,10];
T1 = zeros(6,3);
n=1;
%% Fit: 'Methanol inversion'.
clearvars -except carbon T1 n;
load('methanol.mat');
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( '-a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 15;
opts.DiffMinChange = 10;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 700;
opts.StartPoint = [0.401808033751942 0.0759666916908419 0.239916153553658];
opts.Upper = [30 3000 30];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Methanol inversion' );
h = plot( fitresult, xData, yData, excludedPoints );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthWest', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inversion time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'methinversion.png')
t1 = coeffvalues(fitresult);
err = confint(fitresult);
T1(n,1) = t1(2);
T1(n,2:3) = err(3:4);
n=n+1;
%% Fit: 'Propanol inversion'.
clearvars -except carbon T1 n;
load('propanol.mat');
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( '-a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6 7 8 9 10 11 12 13 14] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 15;
opts.DiffMinChange = 7;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 700;
opts.StartPoint = [0.241691285913833 0.403912145588115 0.0964545251683886];
opts.Upper = [20 2000 20];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Propanol inversion' );
h = plot( fitresult, xData, yData, excludedPoints );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthWest', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inversion time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'propinversion.png')
t1 = coeffvalues(fitresult);
err = confint(fitresult);
T1(n,1) = t1(2);
T1(n,2:3) = err(3:4);
n=n+1;
%% Fit: 'Glycerol inversion'.
clearvars -except carbon T1 n;
load('glycerol.mat');
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( '-a*(exp(-x/b))+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 10;
opts.DiffMinChange = 1e-05;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 700;
opts.StartPoint = [0.506524360189713 0.434024127117976 0.402230963960111];
opts.Upper = [20 100 20];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Glycerol inversion' );
h = plot( fitresult, xData, yData );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthWest', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inversion time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'glyinversion.png')
t1 = coeffvalues(fitresult);
err = confint(fitresult);
T1(n,1) = t1(2);
T1(n,2:3) = err(3:4);
n=n+1;
%% Fit: 'Butanol inversion'.
clearvars -except carbon T1 n;
load('butanol.mat');
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( '-a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 5;
opts.DiffMinChange = 2;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 700;
opts.StartPoint = [0.575208595078466 0.0597795429471558 0.234779913372406];
opts.Upper = [5 2000 5];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Butanol inversion' );
h = plot( fitresult, xData, yData, excludedPoints );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthWest', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inversion time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'butinversion.png')
t1 = coeffvalues(fitresult);
err = confint(fitresult);
T1(n,1) = t1(2);
T1(n,2:3) = err(3:4);
n=n+1;
%% Fit: 'Pentanol inversion'.
clearvars -except carbon T1 n;
load('3-pentanol.mat');
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( '-a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 5;
opts.DiffMinChange = 2;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 700;
opts.StartPoint = [0.0430238016578078 0.168990029462704 0.649115474956452];
opts.Upper = [20 1000 20];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Pentanol inversion' );
h = plot( fitresult, xData, yData, excludedPoints );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthWest', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inversion time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'pentinversion.png')
t1 = coeffvalues(fitresult);
err = confint(fitresult);
T1(n,1) = t1(2);
T1(n,2:3) = err(3:4);
n=n+1;
%% Fit: 'Decanol inversion'.
clearvars -except carbon T1 n;
load('decanol.mat');
[xData, yData] = prepareCurveData( xdata, ydata );

% Set up fittype and options.
ft = fittype( '-a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.DiffMaxChange = 5;
opts.DiffMinChange = 1;
opts.Display = 'Off';
opts.Lower = [0 0 0];
opts.MaxIter = 700;
opts.StartPoint = [0.547008892286345 0.296320805607773 0.744692807074156];
opts.Upper = [20 1000 20];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Decanol inversion' );
h = plot( fitresult, xData, yData, excludedPoints );
hold on
errorbar(xData, yData,yerr);
legend('Data', 'Anomalous data', 'Fitted curve', 'Location', 'NorthWest', 'Interpreter', 'none' );
% Label axes
xlabel( 'Inversion time (ms)', 'Interpreter', 'none' );
ylabel( 'Area under FT peak', 'Interpreter', 'none' );
grid on
saveas(gcf,'decinversion.png')
t1 = coeffvalues(fitresult);
err = confint(fitresult);
T1(n,1) = t1(2);
T1(n,2:3) = err(3:4);
n=n+1;
%% No. of carbon atoms vs. T1
figure; errorbar(carbon,T1(:,1),T1(:,1)-T1(:,2),'x--')
xlabel('No. of carbon atoms')
ylabel('T1 (ms)')
text(carbon(1)+0.1,T1(1)+1,"Methanol")
text(carbon(2)+0.1,T1(2)+1,"Propanol")
text(carbon(3)+0.1,T1(3)+1,"Glycerol")
text(carbon(4)+0.1,T1(4)+1,"Butanol")
text(carbon(5)+0.1,T1(5)+1,"Pentanol")
text(carbon(6)+0.1,T1(6)+1,"Decanol")
grid on
xlim([0 11]);