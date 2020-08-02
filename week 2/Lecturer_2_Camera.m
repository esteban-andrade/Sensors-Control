clc;
clear;

%%
x = 15;
y = 10;
z = 80;

px = 520;
py = 389;

f = 935;

u = f*x/z+px
v = f*y/z+py

%%
K = [935,0,520;
     0,935,389;
     0,0,1];
X = [15;10;80;1];
%% Eye n by n identity matrix
P = eye(3,4);

x = K*P*X;

u = x(1)/x(3)
v = x(2)/x(3)
