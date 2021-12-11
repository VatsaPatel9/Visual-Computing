close all;
clear;
clc;

img = imread("zbuilding.jpg");
img_gray =rgb2gray(img);
kernal_size = 25;
gaussian_kernal = fspecial('gaussian', [kernal_size kernal_size], 5);
img_gray_gaussian = imfilter(img_gray, gaussian_kernal, 'replicate');
figure, imshow (img_gray_gaussian);

indent = (kernal_size -1)/2;
[height, width] = size(img_gray);
img_results = zeros(height, width);
img_gray = double (img_gray);
sigma_range = 0.1;

%run nested for loop 
for i = indent + 1: height - indent 
    for j = indent + 1: width - height
       range_kernel = exp(-abs(img_gray(i - indent:i + indent,j - indent:j + indent) -img_gray(i,j)).^2/(sigma_range * sigma_range)); 
       kernel = range_kernal .* gaussian_kernal;
       normalization = 1/sum(kernal(:));
       temp = (kernel.*double(img_gray(i-indent:i + indent,j - indent:j + indent)))* normalization;
       img_results(i,j) = sum(temp(:));
    end    
end

figure, imshow (img_results,[]);
