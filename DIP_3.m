clc; clear; close all;

original = imread('face.jpg');
[height, width, colors] = size(original);
S = zeros(height, width, colors);
original = im2double(original);

% Original
subplot(2, 3, 1);
imshow(original);
title('Original');

% Optimal gray
subplot(2, 3, 2);
midLevel = graythresh(original);
bw = im2bw(original, midLevel);
imshow(bw);
title('Optimal BW')


% Gamma
gamma = 1.4;
C = 1;
for i = 1:height
    for j = 1:width
        for k = 1:colors
        S(i, j, k) = C * original(i, j, k) ^ gamma;
        end
    end
end
subplot(2, 3, 3);
imshow(S);
title(gamma);

% Gamma
gamma = 0.80;
C = 1;
for i = 1:height
    for j = 1:width
        for k = 1:colors
        S(i, j, k) = C * original(i, j, k) ^ gamma;
        end
    end
end
subplot(2, 3, 4);
imshow(S);
title(gamma);

% Gamma (log)
gamma = 0.95;
C = 1;
for i = 1:height
    for j = 1:width
        for k = 1:colors
        S(i, j, k) = C * log(original(i, j, k) + 1);
        end
    end
end
subplot(2, 3, 5);
imshow(S);
title('Log');

% Histogram shift
original = imread('face.jpg');
subplot(2, 3, 6);
H = original + 50;
imshow(H);
title('Histogram shift');