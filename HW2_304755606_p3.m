%Problem 2 Neighbor Identification
%David Curry
%ID: 304755606
clear all;
clc;
%input values for a, b, c, d
a = input('Please input value for a: ');
b = input('Please input value for b: ');
c = input('Please input value for c: ');
d = input('Please input value for d: ');
%print these values
fprintf('a = %10.6f\n',a);
fprintf('b = %10.6f\n',b);
fprintf('c = %10.6f\n',c);
fprintf('d = %10.6f\n',d);
%define the discriminant, r1, r2, and q(r1), q(r2)
disc = 4*(b^2) - 12*a*c;
r1 = (-2*b + sqrt(disc))/(6*a);
r2 = (-2*b - sqrt(disc))/(6*a);
q_r1 = a*(r1^3) + b*(r1^2) + c*r1 + d ;
q_r2 = a*(r2^3) + b*(r2^2) + c*r2 + d ;
%determine if monotone or simple or not simple
if (disc <= 0)
    fprintf('Monotone\n');
else
    fprintf('r1 = %10.6f\n',r1);
    fprintf('q(r1) = %10.6f\n',q_r1);
    fprintf('r2 = %10.6f\n',r2);
    fprintf('q(r2) = %10.6f\n',q_r2);
    if (q_r1*q_r2 < 0)
        fprintf('Function q is simple\n');
    else 
        fprintf('Function q is NOT simple\n');
    end
end

    