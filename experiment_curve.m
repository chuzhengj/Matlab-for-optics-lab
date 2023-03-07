% Load the grayscale 
% images into a cell array
images = cell(1, 65);
file_path = 'C:\Users\17726\OneDrive\桌面\1\opticsimg\';
for i = 1:65
    opticsimg = sprintf('image_%d.pgm', i);
    images{i} = im2double(imread([file_path,opticsimg]));
end

% Concatenate the images into a 3-dimensional matrix
im_stack = cat(1, images{:});
n_images = 65;

% Calculate the correlation coefficients between the first image and each of the remaining images
rho_1 = zeros(1, n_images);
I_0 = squeeze(im_stack(1, :, :));
I_0_std = std(I_0(:));
for j = 1:n_images
    % extract 2d gray scale image from 3d matrix
    I_j = squeeze(im_stack(j, :, :));
    % calculate covarience, output is 2x2 matrix containing covarience between two images
    C = cov(I_0, I_j);
    % extract covarience from 2x2 matrix c, covarience is located in the (1,2) position of c
    C = C(1, 2);
    I_j_std = std(I_j(:));
    rho_1(j) = C/(I_0_std * I_j_std);
    display(['Correlated images 1 and ', num2str(j)])
end

imshow(images{8})

% generate vector of angles, 40 mdeg spacing, start at 0, there are 
% length(rho_1) members
angle_vec = linspace(0,2.56,65);
