C = 0.3;
D=0.5;
E = 0.8;
F= 0.1;

%initial states
x1_0 = 20000;
x2_0 = 8000;
x3_0 = 22000;

A = [   1-C-D E   0;
    0 1-E-F 0;
    D F 1;
    ];

B = [0;
    1;
    -1;
    ];

%%
eigenValues = eig(A)
%% Test for system controllability

Co = [B A*B A^2*B]
rank_ = rank(Co)

%%
clear all
clc
%%
f = 800;
Res = [1280 1024];
p = [618 537];

Z = 1.5;
l = 0.15;
%%
Target = [  50,50;
            800,50;
            50,600;
            800,600;
                ];

Obs = [20,    50;
      528,    50;
       20,   583;
       528 ,   583;];

%%
xy = (Target-p)/f
Obsxy = (Obs-p)/f

%%
%for i =1:4
%    z(i)= (Obs(i,1)-p(1))/f;
%end
%%
n = length(Target(:,1));

Lx = [];
for i=1:n;
    Lxi = FuncLx(xy(i,1),xy(i,2),Z);
    Lx = [Lx;Lxi];
end

%%
e2 = Obsxy-xy
e = reshape(e2',[],1)
de = -e*l;

%%
Lx2 = inv(Lx'*Lx)*Lx';
Vc = -l*Lx2*e

%%
clear
clc

fprintf('Problem i');
% u1 = 0, u2 = 1
% x1(k+1) - x1(k) = 0 ==> x1(k)^3 - x1(k) = 0
% x2(k+1) - x2(k) = 0 ==> 2x1(k) + 2x2(k) - 1 = 0

% Solve for x1
x1_ = roots([1 0 -1 0])

% solve for x2
x2_ = zeros(size(x1_));


for i=1:length(x1_)
    x2_(i) = (1 - 2*x1_(i))/2;
end

x1_
x2_
%%
x3 = roots([0 0 2 -1])
%%
% Linearization
% A =   3x^2    0
%       2       3

% B =   -1       0
%        0      -1

% Calculate A for each equilibrium point (B doesn't change) and check the
% eigen values
for i=1:length(x1_)
    A = [3*x1_(i)^2     0;
        
         2              3;   
        ]
    
    eigenV = eig(A);
    
    fprintf('Eigen values of A for x1 = %d x2 = %d are\n', x1_(i), x2_(i));
    disp(eigenV);
end

%%

fprintf('Problem ii');
% u1 = 3, u2 = 1
% x1(k+1) - x1(k) = 0 ==> 2x1(k)^2 - x1(k) - 3 = 0
% x2(k+1) - x2(k) = 0 ==> 0.5x2(k)^2 - 1.5x2(k) + 1 = 0

% Solve for x1
x1_ = roots([2 -1 -3]);

% solve for x2
x2_ = roots([0.5 -1.5 +1]);

x1_
x2_

% Linerarization
% A =   4x1        0
%         0     -0.5

% Calculate A for each equilibrium point (B doesn't change) and check the
% eigen values
for i=1:length(x1_)
    for j=1:length(x2_)
        A = [4*x1_(i)       0;
             0              x2_(j) - 0.5;            
            ]
        
        eigenV = eig(A);
        fprintf('Eigen values of A for x1 = %d x2 = %d are\n', x1_(i), x2_(j));
        disp(eigenV);
    end
end

%%

fprintf('Problem iii')
% u1 = 0 and u2 = 2
% x1(k+1) - x1(k) = 0 ==> x1(k)^2 = 0
% x2(k+1) - x2(k) = 0 ==> sin(x1(k)) + x2(k)^2 - x2(k) - 2 = 0
%%
% Solve for x1
x1_ = roots([1/16 -3/4 -1/2 -2]);

% Solve for x2
x2_ = zeros(length(x1_),2);

for i=1:length(x1_)
    x2_(i,:) = roots([1 -1 (sin(x1_(i))-2)]);
end

x1_
x2_
%%
% Linerarization
% A =   2x1+1      0
%       cos(x1)  2x2

% Calculate A for each equilibrium point (B doesn't change) and check the
% eigen values
for i=1:length(x1_)
    for j=1:length(x2_)
        A = [(2*x1_(i)+1)       0;
             cos(x1_(i))        2*x2_(j,1);            
            ]
        
        eigenV = eig(A);
        fprintf('Eigen values of A for x1 = %d x2 = %d are\n', x1_(i), x2_(j,1));
        disp(eigenV);
        
        A = [(2*x1_(i)+1)       0;
             cos(x1_(i))        2*x2_(j,2);            
            ]
        
        eigenV = eig(A);
        fprintf('Eigen values of A for x1 = %d x2 = %d are\n', x1_(i), x2_(j,2));
        disp(eigenV);
    end
end





%%

syms x1 x2
eqns = [((1/16)*x1^2) - (3/4*x1) - (1/2*x2) - 2 == 0, - (1/2*x2) - (3/4*x1) + 2 == 0];
S = solve(eqns,[x1 x2]) ;

X1_=S.x1
X2_=S.x2


%%

syms  x1 x2
eqns = [((1/16)*x1^2) - (3/4*x1) - (1/2*x2) - 2 == 0, - (1/2*x2) - (3/4*x1) + 2 == 0];
vars = [x1 x2];
[solx1, solx2] = solve(eqns,vars);

solutions = [solx1 solx2]



%%


syms x1 x2 u1 u2
eq1 = ((1/16)*x1^2) +(1/4*x1) -(1/2*x2) -2*u1;
eq2 = (1/2*x2) -(3/4*x1) +2*u2 ;


df1_dx1 = diff(eq1,x1)

df1_dx2 = diff(eq1,x2)

df2_dx1 = diff(eq2,x1)

df2_dx2 = diff(eq2,x2)


A= [df1_dx1 df1_dx2;
    df2_dx1 df2_dx2]


df1_du1 = diff(eq1,u1)

df1_du2 = diff(eq1,u2)

df2_du1 = diff(eq2,u1)

df2_du2 = diff(eq2,u2)


B = [df1_du1 df1_du2;
    df2_du1 df2_du2]


%%
syms x1
sol1=  subs(df1_dx1, x1, 0);
Aprime = [sol1 df1_dx2;
    df2_dx1 df2_dx2]

%%
eigenV = eig(Aprime);
  disp(eigenV);
  %%
  
 Co = [B Aprime*B]
rank_ = rank(Co) 
%%
p = []
K = place(Aprime,B,p)
[K,prec,message] = place(A,B,p)

%%
syms u v
eqns = [2*u + v == 0, u - v == 1];
S = solve(eqns,[u v])