close all;
clear all;
clc;

img = imread("deer.jpg");
figure, imshow(img);

gaussian_kernel = fspecial ('gaussian', [25 25], 5);
img_gaussian = imfilter (img, gaussian_kernel, 'replicate');
figure, imshow(img_gaussian);

lab = rgb2lab(img_gaussian);
l = double(lab(:,:,1));
lm = mean(mean(l));

a = double(lab(:,:,2));
am = mean(mean(a));

b = double(lab(:,:,3));
bm = mean(mean(b));

sm = (l-lm).^2 + (a-am).^2 +(b-bm).^2; 
figure, imshow(sm,[]);

mean_value = 1.4 * mean(sm(:));
sm(sm < mean_value) = 0;
sm(sm >= mean_value) = 1;
figure,imshow(sm,[]);

for c = 1:3
    img(:,:,c) = img(:,:,c).*uint8(sm);
end

figure,imshow(img);
