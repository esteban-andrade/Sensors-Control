function [imgGS] = convertRGBtoGrayscale_student(imgRGB)

% Get the size of the input image
[rows, cols, channels] = size(imgRGB)

% Create an empty matrix for the new greyscale image
imgGS = zeros(rows,cols);

for i = 1:rows
    for j = 1:cols
        % Your logic goes in here
          % greyscale value = 0.2989 * R + 0.5870 * G + 0.1140 * B
          %imgGS(i,j)=(imgGS(i,j,1)+imgGS(i,j,2)+imgGS(i,j,3))/3;
          imgGS(i,j)= 0.2989 * imgRGB(i,j,1) + 0.5870 * imgRGB(i,j,2) + 0.1140 * imgRGB(i,j,3);
    end
end

imgGS = uint8(imgGS);
imshow(imgGS);

end