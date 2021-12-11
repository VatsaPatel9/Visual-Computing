clear all;
close all;
clc;

img = imread('butterfly.jpg');
figure, imshow(img);

res = rule_of_third(img);

if (res == true)
    disp('The imput image satisfied the rule of thirds');
else
    disp('The input image does not satisfy the rule of thirds');
end
