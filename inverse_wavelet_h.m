function x_rec = inverse_wavelet_h(cA, cD)
    % Ensure row vectors
    cA = cA(:)';
    cD = cD(:)';

    if length(cA) ~= length(cD)
        error('Approximation and detail coefficient vectors must have equal length.');
    end

    N = length(cA);

    % 1. Upsample by inserting zeros between samples
    upA = zeros(1, 2 * N);
    upA(1:2:end) = cA;

    upD = zeros(1, 2 * N);
    upD(1:2:end) = cD;

    % 2. Haar reconstruction filters
    g0 = [1, 1] / sqrt(2);
    g1 = [-1, 1] / sqrt(2);

    % 3. Convolve and sum the two branches
    recA = conv(upA, g0, 'full');
    recD = conv(upD, g1, 'full');

    % Trim the trailing padding zero from 'full' convolution
    x_rec = recA(1:2*N) + recD(1:2*N);
endfunction
