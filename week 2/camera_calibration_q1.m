% Transform 3D point (8,5,80) from camera coordinate frame to image coordinate frame
% (u,v) by writing a function.

%%the Coordinates given are at the end after Calibration is hit (Use the ones with uncertainties)

%Focal Lenght
fx = 693.15125;
fy = 690.66305;

%Pricical Point
px = 285.67948;
py = 244.42955;

%Homogenous Transform matrix
K = [fx,0,px;
    0,fy,py;
    0,0,1];
%Camera coordinate frame (3D Representation)
X_cam = [8;5;80;1];
IM = eye(3,4);

%get point x(will be 3D point)
x = K*IM*X_cam

%to make the point into 2D (u,v) (x,y). we Divide by the third one
u = x(1)/x(3)
v = x(2)/x(3)