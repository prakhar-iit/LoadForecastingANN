
data = zeros(0,1) %training load data for 60 day

%Acquiring data from sheets
for i = 1:7
    file = strcat('C:\Users\windows8\Desktop\load data\May\1 (',num2str(i),').xls')
    temp = xlsread(file, 'loadcurve', 'C7:C54')
    data = [data; temp]
    
end

for i=1:30
    file = strcat('C:\Users\windows8\Desktop\load data\June\1 (',num2str(i),').xls')
    temp = xlsread(file, 'loadcurve', 'C7:C54')
    data = [data; temp]
end

for i=1:23
    file = strcat('C:\Users\windows8\Desktop\load data\July\1 (',num2str(i),').xls')
    temp = xlsread(file, 'loadcurve', 'C7:C54')
    data = [data; temp]
end

time = zeros(0,1) %time column matrix (0,1)
day  = zeros(0,1) %day column matrix (0,1)
temp1 = zeros(0,1) %building block of time column matrix

for i=1:48
    temp1 = [temp1; ones(1,1)*(i-1)/48]
end

%constructing time and day matrix
for i=4:63
    time = [time; temp1]
    day = [day; ones(48,1) * mod(i,7)/7]  
end



y = data %target data
a = [time day] % input

%md_linear = LinearModel.fit(a,y) %linear regression model

y_test = zeros(0,1) %test data for 23 days
time_test = zeros(0,1) %test time matrix
day_test = zeros(0,1) %test day matrix

%loading test data and constructing date_test and time_test
for i=1:15
    file = strcat('C:\Users\windows8\Desktop\load data\August\1 (',num2str(i),').xls')
    temp = xlsread(file, 'loadcurve', 'C7:C54')
    y_test = [y_test; temp]
    time_test = [time_test; temp1]
    day_test = [day_test; ones(48,1)*mod(i+1,7)/7]
end

a_test = [time_test day_test] %test input matrix

%y_pred = predict(md_linear, a_test) %predicted values for test data using linear regression matrix

save 'C:\Users\windows8\Desktop\load data\variables.mat' data time day y a y_test time_test day_test a_test

