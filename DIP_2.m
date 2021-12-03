clc; clear; clear all;

% Load
origA = imread('Group.jpg');
origA = imresize (origA, [10,10]); %resize to 100 x 100
subplot(3,4,1);
imshow(origA);
title('img A');

origB = imread('rice.jpg');
origB = imresize (origB, [10,10]); %resize to 100 x 100
subplot(3,4,2);
imshow(origB);
title('img B');

% Matrix Addition
imAdd = origA + origB;
subplot(3,4,3);
imshow(imAdd);
title('Addition');

% Matrix Subtraction
imSub = origA - origB;
subplot(3,4,4);
imshow(imSub);
title('Subtraction');

% Matrix Multiplication
imMult = immultiply(origA, origB);
subplot(3,4,5);
imshow(imMult);
title('Multiplication');

% Matrix Division
imDiv = imdivide(origA, origB);
subplot(3,4,6);
imshow(imDiv);
title('Division');

% Logical Operations
LogicalA = im2bw(origA);
LogicalB = im2bw(origB);

% AND
imAND = LogicalA & LogicalB;
subplot(3,4,7);
imshow(imAND);
title('Logical AND');

% OR
imOR = LogicalA | LogicalB;
subplot(3,4,8);
imshow(imOR);
title('Logical OR');

% XOR
imXOR = xor(LogicalA, LogicalB);
subplot(3,4,9);
imshow(imXOR);
title('Logical XOR');

% NOT
imNOTA = imcomplement(LogicalA);
subplot(3,4,10);
imshow(imNOTA);
title('Logical NOT A using function');

imNOTB = ~LogicalB;
subplot(3,4,11);
imshow(imNOTB);
title('Logical NOT B using complement');

%imcomplement = PixelValue.Max - PixelValue.Current
%PixelValue.Max = 255 when JPEG/uInt8 (generally value is greater than 255)