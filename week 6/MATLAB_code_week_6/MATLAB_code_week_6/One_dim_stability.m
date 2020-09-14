%% simple example of stable and unstable 1D systems

% parameters for the model
A = -0.1; % stable
%A = 0.1; % unstable
B = 1;
C = 1;
D = 0;

%% define the state space model, type "help ss" in Command Window to find out more
sys_1D=ss(A,B,C,D);

%% simulation
% define the time period and time step 
t = 0:0.1:30; % 30 seconds, 0.1 second per step
% define the input signal
u = 0*ones(size(t)); % zero input

% initial state
x0 = 20;

% compute the state and output trajectories by "lsim"
[Y,T,X]=lsim(sys_1D,u,t,x0);


% plot the state trajectory
figure(1)
plot(t,X,'r.')

% add label to the plot
xlabel('time')
ylabel('state')
title('State of the system')

