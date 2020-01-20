clear all
close all


%% Load files 
file_name = 'Optical.png';

img = double(imread(strcat('EX_2_data\',file_name)));
img = img(:,:,1);
img2 = imread(strcat('EX_2_data\',file_name));
img2 = img2(:,:,1);
figure(1)
imagesc(img);
title('Source image');

if strcmp('Optical.png', file_name)
    local_maxima_threshold = 192;
elseif strcmp('CT_synchrotron.png', file_name)
    local_maxima_threshold = 130;
elseif strcmp('SEM.png', file_name)
    local_maxima_threshold = 90;
else
    local_maxima_threshold = 30000;
end

if strcmp('CT_synchrotron.png', file_name)
    img(img==0) = 22000;
end


%% Parameters

gauss_t_1 = 15;
gauss_t_2 = 11;
max_t = 60;
min_t = 40;
step_t=2;
save_file = 1;


%% Smooth image with Gaussian kernel

kernel_gauss = gaussian_kernel(gauss_t_1);
img_smooth = imfilter(img, kernel_gauss, 'symmetric');
img_smooth = imfilter(img_smooth, kernel_gauss', 'symmetric');

figure(2)
imagesc(img_smooth);

img_local_max = localMaxima(img_smooth, local_maxima_threshold);


[row_max, col_max] = find(img_local_max);

max_indicies = [col_max, row_max];
figure(3)
imshow(img2)
viscircles(max_indicies, 1*ones(size(max_indicies, 1),1),'Color','r');


% Set max and step of a parameter t in scale space
scale_space_size = 1+(max_t-min_t)/step_t;
% Init space for scale space
scale_space = zeros(size(img, 1), size(img, 2), scale_space_size);


%% Build scale space

i=1;
kernel_gauss2 = gaussian_kernel(gauss_t_2);
img_smooth_lap = imfilter(img, kernel_gauss, 'symmetric');
img_smooth_lap = imfilter(img_smooth_lap, kernel_gauss', 'symmetric');

for t = min_t:step_t:max_t
    scale_space(:,:, i) = laplacian_img(img_smooth_lap, t);
    i= i+1;
end
clear i


%% Find radius for every detected circle

% Values of laplacian across scale space for each center
v_max_indicies = zeros(size(max_indicies,1), scale_space_size);

for i = 1:size(max_indicies, 1)
    v_max_indicies(i, :) = scale_space(max_indicies(i, 2), max_indicies(i, 1), :);
end

[max_t_values, max_t_indicies] = max(v_max_indicies,[], 2);
max_t_indicies = min_t + step_t * (max_t_indicies-1);


%% Draw deteced circles

figure(6)
imshow(img2);
max_radius = sqrt(2*max_t_indicies);
viscircles(max_indicies, max_radius,'Color','r');


if save_file == 1
    save(strcat(strcat('Output_data\circles_',file_name(1:end-3)),'mat'), 'max_indicies', 'max_radius' ,'gauss_t_1','gauss_t_2','max_t','min_t','step_t');
end








