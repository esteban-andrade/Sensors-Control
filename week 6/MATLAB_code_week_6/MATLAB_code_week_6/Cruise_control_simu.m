%% state space model of cruise control

clear all
close all
clc

% parameters for the model
m = 100;
b = 80;

% define the matrices for the state space model
A = [-b/m];
B = [1/m];
C = [1];
D = 0;

% define the state space model, type "help ss" in Command Window to find
% out more details
cruise=ss(A,B,C,D);

% compute the transfer function from the state space model
[NUM,DEN] = ss2tf(A,B,C,D,1)

%% start the simulation
% time period and time step
t = 0:0.1:300;
% control input signal
u = 1000*ones(size(t));

% initial state
x0 = [0];

% compute the state and output trajectories using "lsim"
[Y,T,X]=lsim(cruise,u,t,x0);

% plot the figure of input trajectory
figure(1)
plot(t,u)

% define the axis of the plot
axis([0 300 0 2000])

% add labels to the plot
xlabel('time')
ylabel('input')

% add title to the plot
title('Input: force')

% plot the figure of the state trajectory
figure(2)
plot(t,X)

% define the axis
axis([0 300 0 100])

% add labels to the plot
xlabel('time')
ylabel('state')

% add title to the plot
title('State: speed')

% plot the output trajectory
figure(3)
plot(t,Y)

% define the axis
axis([0 300 0 100])

% add label to the plot
xlabel('time')
ylabel('output')

% add title to the plot
title('Output: speed')
