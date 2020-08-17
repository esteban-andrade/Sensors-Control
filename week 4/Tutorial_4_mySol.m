%% Q1
clc
clear all;
close all;

bag1 = rosbag('tutorial4.bag');
laserScans = select(bag1,'Topic','/scan');
firstLaserScan = readMessages(laserScans,1);

cartesian_coordinates = firstLaserScan{1}.readCartesian; % Convertes the ranges and bearings data into cartesian values.
scatter(cartesian_coordinates(:,1),cartesian_coordinates(:,2)) % plot x and y values

%% q2 Interpreting Laser data
close all
clear all

% 2D lidar FoV 90  degree [-45 45].
data = [1.4142 1.1547 1.0353 1.0000 1.0353 1.1547 1.4142];
angles_scan = linspace(-45,45,7);

[X_vals,Y_vals]= pol2cart(angles_scan,data);
scatter(X_vals,Y_vals,'r*');

%% Q3 laser Scans and Robot Motion
clc;
close all;
clear all;

scan = load('intel_LASER_.txt');
% FoV =180.
FoV = linspace(-90,90,180);

scan1=scan(1,:);
scan2=scan(32,:);

%Convert to cartesian
[X_scan1,Y_scan1]=pol2cart(FoV,scan1);
[X_scan32,Y_scan32]=pol2cart(FoV,scan2);

% For Point clouds
% https://au.mathworks.com/help/vision/ref/pointcloud-class.html
% for Pcregistration for ICP
% https://au.mathworks.com/help/vision/ref/pcregistericp.html

scan1_cart = [X_scan1',Y_scan1',zeros(180,1)]; % the zeros is to asume that zeros is for the z coordinate and it has to be zero
scan32_cart = [X_scan32',Y_scan32',zeros(180,1)]

scan_1_PointCloud = pointCloud(scan1_cart,'Color',[ones(180,1),zeros(180,1),zeros(180,1)]) % this is to give the values in RGB were all will be red
scan_32_PointCloud=pointCloud(scan32_cart,'Color',[zeros(180,1),ones(180,1),zeros(180,1)]);

figure
hold on
pcshow(scan_1_PointCloud)
pcshow(scan_32_PointCloud)
hold off

% to get the transform use pc register  for the 2 point clouds
% pcregistericp Register two point clouds using ICP algorithm.
    %tform = pcregistericp(moving, fixed) returns the rigid transformation
transform = pcregistericp(scan_1_PointCloud,scan_32_PointCloud)