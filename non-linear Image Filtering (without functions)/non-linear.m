close all;
clear all;
clc;

%read image
img=imread('singapore.jpg');
figure('Name','Original image'),imshow(img);

img_gray=rgb2gray(img);
figure('Name','gray image'),imshow(img_gray);

kernel_size = 5;
% determining how many pixels are to be padded along all dimendsions
add_row_cols = (kernel_size - 1) / 2;
indent = (kernel_size - 1)/2;

% adding/replicating the padding pixels in both dimensions
for row = 1 : add_row_cols
    img_gray = [img_gray(:, 1) img_gray img_gray(:, end)];%cols
    img_gray = [img_gray(1, :); img_gray; img_gray(end, :)];%rows
end
[height, width] = size(img_gray);


image_max_filter=uint8(zeros(size(img_gray)));%maximum 
image_min_filter=uint8(zeros(size(img_gray)));%minium 
image_med_filter=uint8(zeros(size(img_gray)));%medin 

for i = indent + 1:height-indent
    for j = indent + 1:width - indent
            window = img_gray(i-indent:i+indent,j-indent:j+indent);  
            image_max_filter(i,j)=max(window(:));  
            image_min_filter(i,j)=min(window(:)); 
            image_med_filter(i,j)=median(window(:));   
    end
end

% removing the previoiusly added borders 
image_max_filter = image_max_filter(add_row_cols + 1 : end - add_row_cols, add_row_cols + 1 : end - add_row_cols);
figure('Name','max filter'),
imshow(image_max_filter);

% removing the previoiusly added borders 
image_min_filter = image_min_filter(add_row_cols + 1 : end - add_row_cols, add_row_cols + 1 : end - add_row_cols);
figure('Name','min filter'),
imshow(image_min_filter);

% removing the previoiusly added borders 
image_med_filter = image_med_filter(add_row_cols + 1 : end - add_row_cols, add_row_cols + 1 : end - add_row_cols);
figure('Name','median filter'),
imshow(image_med_filter);
