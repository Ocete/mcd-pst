num = 15
n = [-3:11];
x = [zeros(1,4) 2 1 -1 3 zeros(1,7)];
x_ticks = linspace(-4,12,9);
y_ticks = linspace(-1,3,9);

hold on
stem(n,x)
xticks(x_ticks)
yticks(y_ticks)
xlabel('Tiempo(Discreto)');
ylabel('Valor');
title('Señal discreta x[n]');
hold off

ny1 = [n(3:num) n(1:2)]
ny2 = [n(num) n(2:num-1)];
ny3 = flip(n);
ny4 = flip([n(2:num) n(1)]);

stem(ny1,x)
