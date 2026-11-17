function [cA, cD] = wavelet_h(x)
    % Ensure row vector
    x = x(:)';
    if mod(length(x), 2) ~= 0
        error('Signal length must be even for a simple 1-level Haar DWT.');
    end

    % Haar scaling (low-pass) and wavelet (high-pass) filters
    h0 = [1, 1] / sqrt(2);
    h1 = [1, -1] / sqrt(2);

    % Convolve and downsample by 2 (decimation)
    tempA = conv(x, h0, 'full');
    cA = tempA(2:2:end-1);

    tempD = conv(x, h1, 'full');
    cD = tempD(2:2:end-1);
endfunction
