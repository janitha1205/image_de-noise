pkg load image
img = zeros(64, 64);
img(16:48, 16:48) = 255;

% Forward 2D DWT
[LL, LH, HL, HH] = haar_dwt_2d(img);

% Combine sub-bands into a single tiled matrix for visualization
% Use mat2gray to normalize detail coefficients for display
tiled_dwt = [mat2gray(LL), mat2gray(HL);
             mat2gray(LH), mat2gray(HH)];

figure;
subplot(1, 2, 1); imshow(uint8(img)); title('Original Image');
subplot(1, 2, 2); imshow(tiled_dwt); title('2D Haar DWT Sub-bands');

% Inverse 2D DWT
img_rec = haar_idwt_2d(LL, LH, HL, HH);
max_error = max(abs(img(:) - img_rec(:)));
disp(['2D Reconstruction Error: ', num2str(max_error)]);
