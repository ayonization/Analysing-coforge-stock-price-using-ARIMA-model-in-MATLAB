warning('OFF', 'MATLAB:table:ModifiedAndSavedVarnames');
% read data from excel 
StockData = readtable('coforgedatamodified.csv','ReadVariableNames',true);

%Ensure the data is in correct data type
if isnumeric(StockData.Price) == false
    Price =cellfun(@str2double,StockData.Price);
else
    Price = StockData.Price;
end
Date = StockData.Date;

%Tranform the data to timetable
StockData_TimeTable = timetable(Date,Price);

%Check for missing Data
%Fill the missing data with previous value
if any(any(ismissing(StockData_TimeTable)))==true
    StockData_TimeTable = fillmissing(StockData_TimeTable,'previous');
end

%View the data
plot(StockData_TimeTable.Date,StockData_TimeTable.Price);
title('Coforge stock for the past two years');
ylabel('SGD');
xlabel('Timeline');
   grid on