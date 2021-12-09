L = 21;
N=128;
j = sqrt(-1);
w_0 = 2*pi/sqrt(31);

R = [ones(1, L)];
plot_dtft(R, N, 'R[n]');

% APARTADO A
w_0 = 2*pi/sqrt(31);
plot_R_shifted(R, w_0, N, L);

% APARTADO B
w_1 = 5*pi/2;
plot_R_shifted(R, w_1, N, L);

% APARTADO C
apartado_c(R, w_0, N, L);

function plot_R_shifted(R, w, N, L)
    j = sqrt(-1);
    R_shifted = R .* exp(j*w*[0:L-1]);
    plot_dtft(R_shifted, N, 'R_{shifted}[n]');
end

function apartado_c(R, w_0, N, L)
    R_shifted = R .* cos(w_0*[0:L-1]);
    plot_dtft(R_shifted, N, 'R_{shifted}[n]');
end