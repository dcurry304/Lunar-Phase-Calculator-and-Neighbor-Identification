
%Problem 1 The Lunar Phase Calculator
%David Curry
%ID: 304755606
clear all;
clc;
%input value for the month and check the string length
month = input('Please enter the month as MMM: ','s');
if (length(month)~= 3)
    error('Error: Incorrect format for month input');
    return
end
% input day and check the string length
days = input('Please enter the day as DD: ','s');
if (length(days) ~= 2)
    error('Error: Incorrect format for day input')
    return
end
%input year and check the string length
year = input('Please enter the year as YYYY: ','s');
if (length(year)~= 4)
    error('Error: Incorrect format for year input')
    return
end
%convert day and year to integers
day = str2num(days);
yr = str2num(year);
%check that they are both positive integers
if (mod(day,1)~= 0 || day < 0)
    error('Error: Day must be a positive integer');
    return
end
if (mod(yr,1)~= 0 || yr < 0)
    error('Error: Year must be a positive integer');
    return
end
% convert month to an integer and set the max number of days for that month
mon = 0;
max_days = 0;
if (month == 'JAN')
    mon = 1;
    max_days = 31;
elseif (month == 'FEB')
    mon = 2;
    max_days = 28;
elseif (month == 'MAR')
    mon = 3;
    max_days = 31;
elseif (month == 'APR')
    mon = 4;
    max_days = 30;
elseif (month == 'MAY')
    mon = 5;
    max_days = 31;
elseif (month == 'JUN')
    mon = 6;
    max_days = 30;
elseif (month == 'JUL')
    mon = 7;
    max_days = 31;
elseif (month == 'AUG')
    mon = 8;
    max_days =31;
elseif (month == 'SEP')
    mon = 9;
    max_days = 30;
elseif (month == 'OCT')
    mon = 10;
    max_days = 31;
elseif (month == 'NOV')
    mon = 11;
    max_days = 30;
elseif (month == 'DEC')
    mon = 12;
    max_days = 31;
else
    error('Error: Incorrect input for month');
end
%if the year is a leap year then the maxdays becomes 29
leapyear = (mod(yr,4)==0 && mod(yr,100)~= 0) || mod(yr,400)==0 ;
if (leapyear == 1 && mon == 2)
    max_days = 29;
end
%if the day input is not a calendar day then an error is returned
if (day > max_days)
    error('Error: Too large of a value for the day');
end
%define a for all months
a = 0;
if (mon == 1 || mon == 2)
    a = 1;
end
%find the julian day
y = yr - a + 4800;
m = mon + 12*a - 3 ;
J = day + floor((153*m + 2)/5) + 365*y + floor(y/4)  - floor(y/100) + floor(y/400) - 32045 ;
%find the percent illuminated
DelJ = J - 2415021 ;
T = 29.530588853 ;
L = (sin((pi/T)*mod(DelJ,T)))^2;
percent = L*100;
%define if it is waxing or waning
third = 'waning';
if ((mod(DelJ,T)/T) < 0.5)
    third = 'waxing' ;
end
%print results
fprintf('%s %s %s\n',month, days, year);
fprintf('Illumination = %3.1f percent\n', percent);
fprintf('%s\n', third);

