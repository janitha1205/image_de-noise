% 1. Create a clean 128x128 test image
clean_img = zeros(128, 128);
clean_img(32:96, 32:96) = 200;
clean_img(48:80, 48:80) = 80;

% 2. Add Gaussian white noise (sigma = 25)
noise_sigma = 10;
noisy_img = clean_img + noise_sigma * randn(size(clean_img));

% 3. Denoise the image using 1-level 2D Haar DWT
denoised_img = haar_denoise_2d(noisy_img);

% 4. Calculate PSNR (higher is better)
mse_noisy = mean((clean_img(:) - noisy_img(:)).^2);
mse_denoised = mean((clean_img(:) - denoised_img(:)).^2);

psnr_noisy = 10 * log10(255^2 / mse_noisy);
psnr_denoised = 10 * log10(255^2 / mse_denoised);

disp(['Noisy PSNR:    ', num2str(psnr_noisy), ' dB']);
disp(['Denoised PSNR: ', num2str(psnr_denoised), ' dB']);

% 5. Display results side-by-side
figure;
subplot(1, 3, 1); imshow(uint8(clean_img)); title('Clean Image');
subplot(1, 3, 2); imshow(uint8(noisy_img)); title(['Noisy (', num2str(psnr_noisy, '%.1f'), ' dB)']);
subplot(1, 3, 3); imshow(uint8(denoised_img)); title(['Denoised (', num2str(psnr_denoised, '%.1f'), ' dB)']);

