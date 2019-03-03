%Problem 2 Neighbor Identification
%David Curry
%ID: 304755606
clear all;
clc;
%input values for M,N,P and check that they are integers and > 2
M = input('Please enter value for M:');
if( M < 2)
    error('Error: M must be greater than 2');
end
N = input('Please enter a value for N:');
if( N < 2)
    error('Error: N must be greater than 2');
end
%check that P is still in the 2D array
P = input('Please enter a value for P:');
if ( P > N*M)
    error('Error: P is too large');
end
%check that they are actually integers
if (mod(M,1)~= 0 || mod(N,1)~= 0 || mod(P,1)~= 0)
    error('Error: inputs must be integers');
end
%define neighbors
N1 = P - M - 1;
N2 = P - M;
N3 = P - M + 1;
N4 = P - 1;
N5 = P + 1;
N6 = P + M -1;
N7 = P + M;
N8 = P + M + 1;
%determine how many neighbors 
if (P <= M)  % for the left wall
    if (P == 1)
        fprintf('Cell ID: %.0f\n', P);
        fprintf('Neighbors: %.0f %.0f %.0f\n', N5, N7, N8);
    elseif (P == M)
        fprintf('Cell ID: %.0f\n', P);
        fprintf('Neighbors: %.0f %.0f %.0f\n', N4, N6, N7);
    else 
        fprintf('Cell ID: %.0f\n', P);
        fprintf('Neighbors: %.0f %.0f %.0f %.0f %.0f\n',N4, N5, N6, N7, N8);
    end
elseif (P >= (N-1)*M) % for the right wall
    if (mod(P,M) == 1)
        fprintf('Cell ID: %.0f\n', P);
        fprintf('Neighbors: %.0f %.0f %.0f\n', N2, N3, N5);
    elseif (P == M*N)
        fprintf('Cell ID: %.0f\n', P);
        fprintf('Neighbors: %.0f %.0f %.0f\n', N1, N2, N4);
    else 
        fprintf('Cell ID: %.0f\n', P);
        fprintf('Neighbors: %.0f %.0f %.0f %.0f %.0f\n',N1, N2, N3, N4, N5);
    end
elseif (mod(P,M) == 1) %for the top wall
    fprintf('Cell ID: %.0f\n', P);
    fprintf('Neighbors: %.0f %.0f %.0f %.0f %.0f\n',N2, N3, N5, N7, N8);
elseif (mod(P,M) == 0) %for the bottom wall
    fprintf('Cell ID: %.0f\n', P);
    fprintf('Neighbors: %.0f %.0f %.0f %.0f %.0f\n',N1, N2, N4, N6, N7);
else %for all interior cells
    fprintf('Cell ID: %.0f\n', P);
    fprintf('Neighbors: %.0f %.0f %.0f %.0f %.0f %.0f %.0f %.0f\n',N1, N2, N3, N4, N5, N6, N7, N8);
end

    