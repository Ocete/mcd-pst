L = 32;
N = 1024;
w_0 = 2*pi/sqrt(31);

% APARTADO A
%plot_exp_shifted(w_0, N, 32);
%plot_exp_shifted(w_0, N, 1024);

% APARTADO B
%plot_rectangular(N, 32);
%plot_rectangular(N, 64);
%plot_rectangular(N, 128);
%plot_rectangular(N, 256);

% APARTADO C
% Este último apartado hace falta ejecutarlo
% en Matlab online. 
plot_hanning(N, 32);
plot_rectangular(N, 32);
plot_windows_comparative(w_0, N, 32);

function plot_windows_comparative(w, N, L)
    j = sqrt(-1);
    index = [0:L-1];
    x = exp(j*w*index);
    x_hanning = hann(L, 'periodic')' .* x;

    %hanning_window = hanning(2*L+1, 'periodic');
    %x_hanning = hanning_window(L+1:2*L+1) .* x;

    plot_dtft_amp(x, N, ...
        strcat('rectangular\_window[n]*exp(j w_0 n), L=', int2str(L)));
    plot_dtft_amp(x_hanning, N, ...
        strcat('hanning[n]*exp(j w_0 n), L=', int2str(L)));
end

function plot_hanning(N, L)
    x = hann(L, 'periodic')';
    plot_dtft_amp(x, N, ...
        strcat('hanning[n], L=', int2str(L)));
end

function plot_rectangular(N, L)
    x = [ones(1, L)];
    plot_dtft_amp(x, N, ...
        strcat('rectangular\_window[n], L=', int2str(L)));
end

function plot_exp_shifted(w, N, L)
    j = sqrt(-1);
    index = [0:L-1];
    x = exp(j*w*index);
    plot_dtft_amp(x, N, ...
        strcat('x[n] = exp(j w_0 n), L=', int2str(L)));
end
