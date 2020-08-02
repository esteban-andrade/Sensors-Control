clc;
clear;

%Get the following parameters from your calibration
px=285.68687;%Principal point X
py=244.43693; %Principal point Y

fx=693.14908; %Focal length
fy=690.66062; 


%Homogenous transformation matrix
K = [fx,0,px;
     0,fy,py;
     0,0,1];
 
X_cam = [8;5;80;1]; %3D location
IM = eye(3,4);

x = K*IM*X_cam;

u = x(1)/x(3)
v = x(2)/x(3)


