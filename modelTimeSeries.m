function ARIMA_Price1 = modelTimeSeries(Price)
%%Time Series Modeling Using the Econometric Modeler
% This code recreates the estimated model produced in the Econometric Modeler app. Use the code below to estimate the same model, or estimate a model with the same parameters on a new set of data.
%
%Input: A numeric matrix with the same number of columns as the data imported into the app (Price)
%
%Output: The model containing estimated parameters (ARIMA_Price1)
%
%Auto-generated by MATLAB Version 9.8 (R2020a) and Econometrics Toolbox Version 5.4 on 11-Aug-2021 16:33:05
Price1 = Price(:,1);

%% Autoregressive Integrated Moving Average Model
%Estimate an ARIMA Model of Price1
ARIMA_Price1 = arima('Constant',NaN,'ARLags',1:2,'D',1,'MALags',1,'Distribution','Gaussian');
ARIMA_Price1 = estimate(ARIMA_Price1,Price1,'Display','off');
end