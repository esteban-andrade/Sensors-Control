%% LQR design example -- 1D motivation example, why LQR?

% state space model of the example

% model
A = [1];
B = [1];
C = [1];
D = 0;
ex_1 =ss(A,B,C,D);

% open loop simulation
t = 0:0.1:10;
u = 0*ones(size(t));

x0 = [10];

[Y,T,X]=lsim(ex_1,u,t,x0);

% drawing
% figure(1)
% plot(t,u)
% 
% xlabel('time')
% ylabel('input')

figure(1)
plot(t,X)

xlabel('time')
ylabel('states')

% figure(3)
% plot(t,Y)
% 
% xlabel('time')
% ylabel('output')


%% state feedback using pole placement
P_old = eig(A)

pause(1)

% new poles
p1 = -1;
p2 = -2;

P_sf = p1;

% use pole placement to get K
K_1 = place(A,B,P_sf);

%% second controller

P_sf = p2;

% use pole placement to get K
K_2 = place(A,B,P_sf);

% closed-loop system 1
sys_cl_1=ss(A-B*K_1,B,C,D);

% closed-loop system 2
sys_cl_2=ss(A-B*K_2,B,C,D);

%% simulation of closed-loop with state feedback
u = 0*ones(size(t));
[Y_1,T,X_1]=lsim(sys_cl_1,u,t,x0);
[Y_2,T,X_2]=lsim(sys_cl_2,u,t,x0);


figure(2)
plot(t,X_1,'k.',t,X_2,'r-')

xlabel('time')
ylabel('state')

title('State of the close-loop system: x(t)')

legend('K1=2','K2=3')

figure(3)
plot(t,-K_1*X_1,'k.',t,-K_2*X_2,'r-')

xlabel('time')
ylabel('control')

title('Control input: u(t)=-Kx(t)')
legend('K1=2','K2=3')

% LQR design

Q=1;
R=1;

% get the optimal K through LQR
[K_opt P_opt E_opt] =lqr(A,B,Q,R)
% solve Riccati equation to get P
P_test_opt=care(A,B,Q,R)
% compute K through P
K_test_opt = inv(R)*B'*P_opt
