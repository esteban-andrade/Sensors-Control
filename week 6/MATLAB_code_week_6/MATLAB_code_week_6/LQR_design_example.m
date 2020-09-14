%% LQR design example -- as in slides

% state space model of the example

% model
A = [0  1; 0 -1];
B = [0; 1];
C = [0 1];
D = 0;
ex_1 =ss(A,B,C,D);

% open loop simulation
t = 0:0.1:50;
u = 0*ones(size(t));

x0 = [10; -3];

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
p2 = -0.2;

P_sf = [p1 p2];

% use pole placement to get K
K = place(A,B,P_sf);

%% optimal control

Q=[1 0;0 1];
R =1;
[K_opt P_opt E_opt] =lqr(A,B,Q,R)
P_test_opt=care(A,B,Q,R)
K_test_opt = inv(R)*B'*P_opt
test_eig = eig(A-B*K_opt)
pause(1)
% optimal closed-loop system
sys_cl_opt=ss(A-B*K_opt,B,C,D);

% closed-loop system
sys_cl=ss(A-B*K,B,C,D);

%% simulation of closed-loop with state feedback
u = 0*ones(size(t));
[Y,T,X]=lsim(sys_cl,u,t,x0);
[Y,T,X_opt]=lsim(sys_cl_opt,u,t,x0);


% figure(4)
% plot(t,u)

% 
% xlabel('time')
% ylabel('input')

figure(4)
plot(t,X)

xlabel('time')
ylabel('state')


xlabel('time')
ylabel('control')


figure(6)
plot(t,X,'k--',t,X_opt,'r-')

xlabel('time')
ylabel('state')

figure(7)
plot(t,-K(1)*X(:,1)-K(2)*X(:,2),'k--',t,-K_opt(1)*X_opt(:,1)-K_opt(2)*X_opt(:,2),'r-')

xlabel('time')
ylabel('control')
