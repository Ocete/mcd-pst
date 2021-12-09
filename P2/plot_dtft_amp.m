function [H,W] = plot_dtft_amp( h, N, signal_name )
%DTFT calculate DTFT at N equally spaced frecuencies
%   usage: H = dtft( h, N )
%       h: finite-length input vector, whose length is L
%       N: number of frequencies for evaluation over [-pi, pi)
%         ==> constraint: N>=L
% 
%       H: DTFT values (complex)
%       W: (2nd output) vector of freqs where DTFT is computed
%
[H, W] = dtft(h, N);
module = abs(H);

figure();

plot(W, module);
%stem(W, module);
set_plot(signal_name, 'Module');
end

function set_plot(my_title, y_label)
    xticks([-pi -pi/2 0 pi/2 pi]);
    xticklabels({'-\pi', '-\pi/2', '0', '\pi/2','\pi',});
    grid on;

    title(my_title);
    xlabel('Frequency');
    ylabel(y_label);
end
