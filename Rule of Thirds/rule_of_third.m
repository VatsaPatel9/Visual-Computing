function [ res ] = rule_of_third( img )

sm = saliency(img);

%% Identifying four power points

[height, width] = size(sm);
x_points = width./[3 3/2];
y_points = height./[3 3/2];


%% Compute the summation of normalized saliency values with coordinates
sm_normalized = sm/(max(sm(:)));
x_roi_sum = 0;
y_roi_sum = 0;
for i = 1:height
    for j = 1:width
        x_roi_sum = x_roi_sum + sm_normalized(i,j) * j;
        y_roi_sum = y_roi_sum + sm_normalized(i,j) * i;
    end
end

%% Compute the ROI center
x_roi = x_roi_sum/sum(sm_normalized(:));
y_roi = y_roi_sum/sum(sm_normalized(:));

%% The threshold from the ROI center to four power points
threshold = sqrt(height ^2 + width^2)/10;

%% Checking whether ROI center is close to one of four power points
res = false;
for i = 1:2
    for j = 1:2
            distance = sqrt((x_roi - x_points(j))^2 + (y_roi - y_points(i))^2);
            if (distance < threshold)
                res = true;
            break;
        end
    end
end


end

