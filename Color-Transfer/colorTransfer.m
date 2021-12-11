close all;
clear all;
clc;

img_source = imread('autumn.jpg');
img_target = imread('spring.jpg');
figure, imshow(img_source);
figure, imshow(img_target);

img_source_lab = rgb2lab(img_source);
img_target_lab = rgb2lab(img_target);

% figure, imshow(img_source_lab);
% figure, imshow(img_target_lab);

for c = 1:3
    temp = img_source_lab(:,:,c);
    mean_source = mean(temp(:));
    sd_source = std(temp(:));

    temp = img_target_lab(:,:,c);
    mean_target = mean(temp(:));
    sd_target = std(temp(:));
    
    img_source_lab(:,:,c) = (sd_target/sd_source)*(img_source_lab(:,:,c) - mean_source) + mean_target;

end

img_result = lab2rgb(img_source_lab);
figure, imshow(img_result,[]);


