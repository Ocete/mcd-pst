n = [-3:11];
x = [zeros(1,3) 2 0 1 -1 3 zeros(1,7)];
x_ticks = linspace(-4,12,9);
y_ticks = linspace(-1,3,9);

figure(); stem(n, x); 
set_ticks_and_title(x_ticks, y_ticks, 'Señal x[n] discreta');

nx1 = n + 2;
nx2 = n - 1;
nx3 = -n;
nx4 = - n + 1;

figure();
subplot(2,2,1);
stem(nx1, x);
set_ticks_and_title(x_ticks, y_ticks, 'x[n-2]');

subplot(2,2,2);
stem(nx2, x);
set_ticks_and_title(x_ticks, y_ticks, 'x[n+1]');

subplot(2,2,3);
stem(nx3, x);
set_ticks_and_title(x_ticks, y_ticks, 'x[-n]');

subplot(2,2,4);
stem(nx4, x);
set_ticks_and_title(x_ticks, y_ticks, 'x[-n+1]');

function set_ticks_and_title(x_ticks, y_ticks, my_title)
    xticks(x_ticks);
    yticks(y_ticks);
    title(my_title);
    xlabel('Tiempo (Discreto)');
    ylabel('Valor');
end
