function kernel_size = createRangeKernel(img_gray, i, j, kernel_size,sigma_range)
%CREATERANGEKERNEL Summary of this function goes here
%   Detailed explanation goes here
indent = (kernel_size - 1)/2;
kernel_size = exp(-abs(img_gray(i - indent:i + indent,j - indent:j + indent )- img_gray(i,j)).^2/(sigma_range * sigma_range));
end


