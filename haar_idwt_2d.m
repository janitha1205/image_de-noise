function img_rec = haar_idwt_2d(LL, LH, HL, HH)
    [half_r, half_c] = size(LL);
    rows = half_r * 2;
    cols = half_c * 2;

    % Step 1: Reconstruct columns first
    row_L = zeros(rows, half_c);
    row_H = zeros(rows, half_c);
    for c = 1:half_c
        row_L(:, c) = inverse_wavelet_h(LL(:, c)', LH(:, c)')';
        row_H(:, c) = inverse_wavelet_h(HL(:, c)', HH(:, c)')';
    end

    % Step 2: Reconstruct rows
    img_rec = zeros(rows, cols);
    for r = 1:rows
        img_rec(r, :) = inverse_wavelet_h(row_L(r, :), row_H(r, :));
    end
endfunction
