N=128;
j = sqrt(-1);
nn = 0:40; 
a = 0.88 * exp(j*2*pi/5);
xn = a.^nn;

plot_dtft(xn, N, 'x[n]');