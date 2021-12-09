L = 1024;
N = 1024;
w_0 = 2*pi/sqrt(31);

% APARTADO A
%plot_exp_shifted(w_0, N, 32);
%plot_exp_shifted(w_0, N, 1024);

% APARTADO B
%plot_step_shifted(N, 32);
%plot_step_shifted(N, 64);
%plot_step_shifted(N, 128);
%plot_step_shifted(N, 256);

% APARTADO C
plot_hanning(N, 32);

function plot_hanning(N, L)
    x = hanning(L, 'periodic')
    plot_dtft_amp(x, N, ...
        strcat('u[n], L=', int2str(L)));
end

function plot_step_shifted(N, L)
    x = [ones(1, L)];
    plot_dtft_amp(x, N, ...
        strcat('u[n], L=', int2str(L)));
end

function plot_exp_shifted(w, N, L)
    j = sqrt(-1);
    index = [0:L-1];
    x = exp(j*w*index);
    plot_dtft_amp(x, N, ...
        strcat('x[n] = exp(j w_0 n), L=', int2str(L)));
end
