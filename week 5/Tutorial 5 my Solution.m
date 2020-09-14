% question 1
%q1.1 detect harris corner 
I =imread('checkerboard.jpg');
I = rgb2gray(I);
cornerPoints = detectHarrisFeatures(I)
imshow(I);
hold on 
plot(cornerPoints)

%% q1.2 Detect corner from harris corner example
I =imread('harris_corners_example.jpg');
I = rgb2gray(I);
cornerPoints = detectHarrisFeatures(I,'MinQuality', 0.2) % this is kinda to set the intensity of edges detection
imshow(I);
hold on 
plot(cornerPoints)
%% Surf Feature Extration and Matching
clc 
clear all
clf
l1gs =imread('roofs1.jpg');
l1gs = rgb2gray(l1gs);
l2gs =imread('roofs2.jpg');
l2gs = rgb2gray(l2gs);
point1=detectSURFFeatures(l1gs);
point2=detectSURFFeatures(l2gs);
[features1,validPoint1]=extractFeatures(l1gs,point1);
[features2,validPoint2]=extractFeatures(l2gs,point2);


% match features between 2 images
indexPair = matchFeatures(features1,features2);
matchedPoint1 = validPoint1(indexPair(:,1));
matchedPoint2 = validPoint2(indexPair(:,2));

showMatchedFeatures(l1gs,l2gs,matchedPoint1,matchedPoint2,'montage')

%% 2. repeat process with detectORB features
clc 
clear all
clf
l1gs =imread('roofs1.jpg');
l1gs = rgb2gray(l1gs);
l2gs =imread('roofs2.jpg');
l2gs = rgb2gray(l2gs);
point1=detectORBFeatures(l1gs);
point2=detectORBFeatures(l2gs);
[features1,validPoint1]=extractFeatures(l1gs,point1);
[features2,validPoint2]=extractFeatures(l2gs,point2);


% match features between 2 images
indexPair = matchFeatures(features1,features2);
matchedPoint1 = validPoint1(indexPair(:,1));
matchedPoint2 = validPoint2(indexPair(:,2));

showMatchedFeatures(l1gs,l2gs,matchedPoint1,matchedPoint2,'montage')

%% Q3 RANSAC OUTLIER REJECTION
clear all
clc
original =rgb2gray(imread('kfc1.jpg'));
distorted = rgb2gray(imread('kfc2.jpg'));
set(0,'DefaultFigureWindowStyle','docked')
pointOriginal=detectSURFFeatures(original);
pointdistorted=detectSURFFeatures(distorted);
[featuresoriginal,validPointoriginal]=extractFeatures(original,pointOriginal);
[featuresdistorted,validPointdistorted]=extractFeatures(distorted,pointdistorted);

indexPair = matchFeatures(featuresoriginal,featuresdistorted);
matchedPointoriginal = validPointoriginal(indexPair(:,1));
matchedPointdistorted = validPointdistorted(indexPair(:,2));
figure
showMatchedFeatures(original,distorted,matchedPointoriginal,matchedPointdistorted,'montage')

% estimate transform

[tform,inlierDistorted,inlierOriginal]=estimateGeometricTransform(matchedPointdistorted,matchedPointoriginal,'similarity')
%%
figure;
showMatchedFeatures(original,distorted,inlierOriginal,inlierDistorted,'montage');
title('Matching Points(inliers only)');
legend('pts Original','pts Distorted')

%% Recover scale and rotation from second image
Tinv=tform.invert.T;
ss=Tinv(2,1)
sc=Tinv(1,1)
scaleRecovered = sqrt(ss*ss+sc*sc)
thetaRecovered = atan2(ss,sc)*180/pi

outputView = imref2d(size(original));
recovered = imwarp(distorted,tform,'OutputView',outputView);
figure
imshowpair(original,recovered,'montage')

