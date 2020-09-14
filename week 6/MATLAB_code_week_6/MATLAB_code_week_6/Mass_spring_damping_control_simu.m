%% state space model of mass-spring-damper control

clear all
close all
clc

% parameters for the model
m = 1000;
k = 50;
c = 20

% matrices for the state space model
A = [0  1; -k/m -c/m];
B = [0; 1/m];
C = [1 0];
D = 0;
% define the state space model by "ss"
spring_damper =ss(A,B,C,D);

%% start the simulation
% time period and time step
t = 0:0.1:300;
% control input signal
u = 50*ones(size(t));

% initial state
x0 = [0; 0];

% compute the state and output trajectories using "lsim"
[Y,T,X]=lsim(spring_damper,u,t,x0);

%% plot the figures
% plot the control input 
figure(1)
plot(t,u)

xlabel('time')
ylabel('input')

title('Input: force')

% plot the state trajectories
figure(2)
plot(t,X(:,1),'r.',t,X(:,2),'k-')

xlabel('time')
ylabel('states')

title('State: position and velocity')

% plot the output trajectory
figure(3)
plot(t,Y)

xlabel('time')
ylabel('output')

title('Output: position')

%% compute the transfer function from state space model by "ss2tf"
% 
 [NUM,DEN] = ss2tf(A,B,C,D,1)
