close all;
clear;
clc;

img = imread('singapore.jpg');
img_gray = rgb2gray(img);
figure, imshow(img);

kernel = [-1 0 1; -2 0 2; -1 0 1];
img_gray_sobel = imfilter(img, kernel, 'replicate');
figure, imshow(img_gray_sobel);

gaussian_kernal = fspecial('gaussian', [25 25],5);
img_gray_gaussian = imfilter(img_gray, gaussian_kernal, 'replicate');
figure, imshow(img_gray_gaussian);
figure, imshow(img_gray_gaussian, []);

img_shapened = img_gray * 2 - img_gray_gaussian;
figure, imshow(img_shapened);

img_shapened2 = double(img_gray) *2 - double(img_gray_gaussian);
figure, imshow(img_shapened2);

img_shapened3 = uint8(img_shapened2);
figure, imshow(img_shapened3);

img_noise = imread('salt_and_pepper.jpg');
figure, imshow(img_noise);

img_denoise = medfilt2(img_noise);
figure, imshow(img_denoise);

img_denoise = medfilt2(img_noise, [5 5]);
figure, imshow(img_denoise);
% 
% 
% img_denoise = medfilt2(img_noise, [10 10]);
% figure, imshow(img_denoise);
% 
% img_denoise = medfilt2(img_noise, [10 10]);
% figure, imshow(img_denoise);
