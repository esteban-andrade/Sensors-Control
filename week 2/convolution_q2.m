%% Sharpen the Sydney_Harbour_Bridge_from_Circular_Quay.jpg image
Sydney_Harbour_Bridge= imread('Sydney_Harbour_Bridge_from_Circular_Quay.jpg');
%Convert to grey scale
grey_scale_Sydney_Harbour_Bridge =rgb2gray(Sydney_Harbour_Bridge);

% Kernel
%Shaper example
kernel_sharpen = [0,-1,0;
        -1,5,-1;
         0,-1,0];
% Process image
%Sharpen the Sydney_Harbour_Bridge_from_Circular_Quay.jpg image
img_processed_Sydney_Harbour_Bridge = convolution_kernel(grey_scale_Sydney_Harbour_Bridge,kernel_sharpen);

figure(1);
imshow(Sydney_Harbour_Bridge);
title('Original Sydney Harbour Bridge');

figure (2);
imshow(grey_scale_Sydney_Harbour_Bridge);
title('Grey Scale Sydney Harbour Bridge');

figure(3)
imshow(img_processed_Sydney_Harbour_Bridge);
title('Image Sharpened Sydney Harbour Bridge');



%%
%Detect edges on the SydneyOperaHouse.jpg image
SydneyOpera= imread('SydneyOperaHouse.jpg');
%Convert to grey scale
grey_scale_SydneyOpera =rgb2gray(SydneyOpera);

% Kernel
%Shaper example
kernel_edges = [1,0,-1;
                0,0,0;
                -1,0,1];
% Process image
%Sharpen the Sydney_Harbour_Bridge_from_Circular_Quay.jpg image
img_processed_SydneyOpera = convolution_kernel(grey_scale_SydneyOpera,kernel_edges);

figure(4);
imshow(SydneyOpera);
title('Original SydneyOpera');

figure (5);
imshow(grey_scale_SydneyOpera);
title('Grey Scale SydneyOpera');

figure(6)
imshow(img_processed_SydneyOpera);
title('Image Edges detected SydneyOpera');
%%
%%Apply a Gaussian blur to the Ultrasound.png image
Ultrasound= imread('Ultrasound.jpg');
%Convert to grey scale


% Kernel
%Shaper example
kernel_blur = (1/16)*[1,2,1;
                      2,4,2;
                      1,2,1];
% Process image
%Sharpen the Sydney_Harbour_Bridge_from_Circular_Quay.jpg image
img_processed_Ultrasound = convolution_kernel(Ultrasound,kernel_blur);

figure(7);
imshow(Ultrasound);
title('Original Ultrasound');


figure(8)
imshow(img_processed_Ultrasound);
title('Image Blur Ultrasound');