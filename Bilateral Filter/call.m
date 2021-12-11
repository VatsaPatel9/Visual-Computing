close all;
clear;
clc;

img = imread("bolt.jpg");
img_results = bilateralFilter(img);
figure, imshow(img_results, []);
