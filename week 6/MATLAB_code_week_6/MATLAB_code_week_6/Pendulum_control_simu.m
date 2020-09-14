%% state space model of pendulum system

% parameters for the model

m = 0.2;
k = 0; % air friction 
g = 9.8;
l = 0.3;

% matrices for the state space model
A = [0      1;     
     -g/l  -k/m];
B = [     0; 
            1];
C = [1 0];
D = [0];

%% define the state space model
pend=ss(A,B,C,D);

%% stability test by computing the eigenvalue of A
stability_test = eig(A)

pause

% simulation
t=0:0.05:10;
u=0*ones(size(t)); % zero input

x0 = [0.2; 0];

% compute the state and output trajectories of the system using "lsim"
[Y,T,X]=lsim(pend,u,t,x0);

% plot the state trajectory
figure(2)
plot(t,X)

% add labels to the plot
xlabel('time')
ylabel('state')
title('State: angle and angular velocity')

% plot the output trajectory
figure(3)
plot(t,Y)

% add labels to the plot
xlabel('time')
ylabel('output')
title('Output: angle')

%% choose whether to proceed or not: if(0) no proceed, if(1)  proceed

if(1)
%% state feedback using pole placement

% desired poles
p1 = -5;
p2 = -2;

% use pole placement to design the state feedback controller
K = place(A,B,[p1 p2]);

% state space model of the closed-loop system
sys_cl=ss(A-B*K,B,C,D);

% test the stability of the closed-loop system
stability_test_cl = eig(A-B*K)

% simulation
t=0:0.05:10;
u=0*ones(size(t)); % zero input

% compute the state and output trajectories of the closed-loop system
[Y,T,X]=lsim(sys_cl,u,t,x0);

%% draw figures
% draw state trajectory
figure(5)
plot(t,X)

xlabel('time')
ylabel('state')
title('State of the feedback system')

% draw output trajectory
figure(6)
plot(t,Y)

xlabel('time')
ylabel('output')

title('Output of the feedback system')
end