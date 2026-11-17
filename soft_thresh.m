function y = soft_thresh(x, T)
    % Shrinks coefficients toward zero by threshold T
    y = sign(x) .* max(abs(x) - T, 0);
endfunction
