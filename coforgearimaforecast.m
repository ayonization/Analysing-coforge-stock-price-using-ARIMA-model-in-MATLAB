coforgeStock = Price(1:400);

coforgeModel = modelTimeSeries(Price);
coforgeFit = estimate(coforgeModel,coforgeStock);

[Y,YMSE] = forecast(coforgeFit,100,coforgeStock);

lower = Y - 1.96*sqrt(YMSE);
upper = Y + 1.96*sqrt(YMSE);

figure
plot(coforgeStock,'Color',[.7,.7,.7]);
hold on
h1 = plot(401:500,lower,'r:','LineWidth',2);
plot(401:500,upper,'r:','LineWidth',2)
h2 = plot(401:500,Y,'k','LineWidth',2);
legend([h1 h2],'95% Interval','Forecast',...
	     'Location','NorthWest')
title('Coforge Stock Price Forecast')
hold off