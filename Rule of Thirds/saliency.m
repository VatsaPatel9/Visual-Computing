function [sm] = saliency(img)

gaussian_kernal = fspecial('gaussian', [10 10], 5);
img_gaussian = imfilter(img, gaussian_kernal, 'replicate');

%Perfom RGB to LAB color space conversion
lab = rgb2lab(img_gaussian);

%computer Lab avergae values
l = double(lab(:,:,1)); lm = mean(mean(l));
a = double(lab(:,:,2)); am = mean(mean(a));
b = double(lab(:,:,3)); bm = mean(mean(b));

%compute the saliency map
sm = (l-lm).^2 +(a-am).^2+(b-bm).^2;

end