function img_denoised = haar_denoise_2d(noisy_img)
    noisy_img = double(noisy_img);
    [rows, cols] = size(noisy_img);
    N = rows * cols;

    % 1. Forward 2D Haar Transform
    [LL, LH, HL, HH] = haar_dwt_2d(noisy_img);

    % 2. Estimate noise standard deviation (sigma) via Median Absolute Deviation (MAD)
    % The HH sub-band contains mostly high-frequency noise
    sigma = median(abs(HH(:))) / 0.6745;

    % Calculate Donoho's Universal Threshold
    T = sigma * sqrt(2 * log(N));

    % 3. Apply soft thresholding only to the detail sub-bands
    LH_clean = soft_thresh(LH, T);
    HL_clean = soft_thresh(HL, T);
    HH_clean = soft_thresh(HH, T);

    % 4. Reconstruct the denoised image
    img_denoised = haar_idwt_2d(LL, LH_clean, HL_clean, HH_clean);
endfunction
