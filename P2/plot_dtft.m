function [H,W] = plot_dtft( h, N, signal_name )
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
phase = rad2deg(angle(H));

figure();

subplot(2,1,1);
plot(W, module);
%stem(W, module);
set_plot(strcat('|', signal_name, '|'), 'Module');

subplot(2,1,2);
plot(W, phase);
%stem(W, phase);
set_plot(strcat('phase(', signal_name, ')'), 'Amplitude');
end

function set_plot(my_title, y_label)
    xticks([-pi -pi/2 0 pi/2 pi]);
    xticklabels({'-\pi', '-\pi/2', '0', '\pi/2','\pi',});
    grid on;

    title(my_title);
    xlabel('Frequency');
    ylabel(y_label);
end
