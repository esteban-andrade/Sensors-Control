function [img_output] = convolution_kernel(input_image,kernel)

%The same is used to process the same image wih the kernel
img_output = conv2(input_image,kernel,'same');
img_output = uint8(img_output);
imshow(img_output);
end


