function [LL, LH, HL, HH] = haar_dwt_2d(img)
    img = double(img);
    [rows, cols] = size(img);

    if mod(rows, 2) ~= 0 || mod(cols, 2) ~= 0
        error('Image dimensions must be even.');
    end

    % Step 1: Transform every row
    row_L = zeros(rows, cols / 2);
    row_H = zeros(rows, cols / 2);
    for r = 1:rows
        [row_L(r, :), row_H(r, :)] = wavelet_h(img(r, :));
    end

    % Step 2: Transform every column of the resulting matrices
    LL = zeros(rows / 2, cols / 2);
    LH = zeros(rows / 2, cols / 2);
    HL = zeros(rows / 2, cols / 2);
    HH = zeros(rows / 2, cols / 2);

    for c = 1:(cols / 2)
        [LL(:, c), LH(:, c)] = wavelet_h(row_L(:, c)');
        [HL(:, c), HH(:, c)] = wavelet_h(row_H(:, c)');
    end
endfunction
