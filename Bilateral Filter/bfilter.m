close all;
clear;
clc;

img = imread('bolt.jpg');
img_results = zeros(size(img));
figure, imshow(img);

img_gray = rgb2gray(img);
kernel = [-1 0 1; -2 0 2; -1 0 1];
img_gray_sobel = imfilter(img_gray, kernel, 'replicate');
figure, imshow(img_gray_sobel,[]);

img_gray_sobel = double(1 - img_gray_sobel/max(img_gray_sobel(:)));
figure, imshow(img_gray_sobel);

for c = 1:3
   % img_results(:,:,c) = bilateralFilter(img(:,:,c));
    img_results(:,:,c) = bilateralFilter(img(:,:,c)).*img_gray_sobel;
end

figure, imshow(uint8(img_results));
