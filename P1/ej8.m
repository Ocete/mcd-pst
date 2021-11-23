nx = [0:9];
nh1 = [0:4];
nh2 = [0:4];
x = [ones(1,5) zeros(1,5)];
h1 = [1 -1 3 0 0];
h2 = [0 2 5 4 -1];

%apartado_a(nx, x, nh1, h1, nh2, h2);
%apartado_b(x, h1);
%apartado_c(x, h1, h2);
%apartado_d(x, h1, h2);
apartado_e(x, h1, 2);

function apartado_a(nx, x, nh1, h1, nh2, h2)
    x_ticks = linspace(-50,50,101);
    y_ticks = linspace(-20,20,41);
    figure();

    subplot(3,1,1);
    stem(nx, x);
    set_ticks_and_title(x_ticks, y_ticks, 'x[n]');
    
    subplot(3,1,2);
    stem(nh1, h1);
    set_ticks_and_title(x_ticks, y_ticks, 'h1[n]');

    subplot(3,1,3);
    stem(nh2, h2);
    set_ticks_and_title(x_ticks, y_ticks, 'h2[n]');
end

function apartado_b(x, h1)
    x_ticks = linspace(-50,50,101);
    y_ticks = linspace(-20,20,41);
    figure();
    
    c1 = conv(x, h1)
    c2 = conv(h1, x)
    nc = [0:13]

    subplot(2,1,1);
    stem(nc, c1);
    set_ticks_and_title(x_ticks, y_ticks, 'x[n] * h1[n]');
    
    subplot(2,1,2);
    stem(nc, c2);
    set_ticks_and_title(x_ticks, y_ticks, 'h1[n] * x[n]');
end

function apartado_c(x, h1, h2)
    x_ticks = linspace(-50,50,101);
    y_ticks = linspace(-20,20,41);
    figure();
    
    c1 = conv(x, h1);
    c2 = conv(x, h2);
    c12 = conv(x, h1+h2)
    nc = [0:length(c1)-1]

    subplot(2,1,1);
    stem(nc, c1+c2);
    set_ticks_and_title(x_ticks, y_ticks, 'x[n]*h1[n] + x[n]*h2[n]');
    
    subplot(2,1,2);
    stem(nc, c12);
    set_ticks_and_title(x_ticks, y_ticks, 'x[n]*(h1[n] + h2[n])');
end

function apartado_d(x, h1, h2)
    x_ticks = linspace(-50,50,101);
    y_ticks = linspace(-20,20,41);
    y_big_ticks = linspace(-100,100,21);
    figure();
    
    w = conv(x, h1);
    y1 = conv(w, h2);
    hseries = conv(h1, h2);
    y2 = conv(x, hseries);

    subplot(4,1,1);
    stem(get_ns(w), w);
    set_ticks_and_title(x_ticks, y_ticks, 'w[n] = x[n]*h1[n]');
    
    subplot(4,1,2);
    stem(get_ns(y1), y1);
    set_ticks_and_title(x_ticks, y_big_ticks, 'y1[n] = (x[n]*h1[n])*h2[n]');

    subplot(4,1,3);
    stem(get_ns(hseries), hseries);
    set_ticks_and_title(x_ticks, y_big_ticks, 'h_{series} = (h1[n]*h2[n])');

    subplot(4,1,4);
    stem(get_ns(y2), y2);
    set_ticks_and_title(x_ticks, y_big_ticks, 'y2[n] = x[n]*(h1[n]*h2[n])');
end

function apartado_e(x, h1, n0)
    x_ticks = linspace(-50,50,101);
    y_ticks = linspace(-20,20,41);
    y_big_ticks = linspace(-100,100,21);
    figure();
    
    y1 = conv(x, h1)
    y1_desplazada = [zeros(1,n0) y1]
    h1_desplazada = [zeros(1,n0) h1]
    y2 = conv(x, h1_desplazada)

    subplot(2,1,1);
    stem(get_ns(y1_desplazada), y1_desplazada);
    set_ticks_and_title(x_ticks, y_ticks, 'y1[n - n0]');

    subplot(2,1,2);
    stem(get_ns(y2), y2);
    set_ticks_and_title(x_ticks, y_ticks, 'y2[n]');
end

function ns = get_ns(x)
    ns = [0:length(x)-1]
end

function set_ticks_and_title(x_ticks, y_ticks, my_title)
    xticks(x_ticks);
    yticks(y_ticks);
    title(my_title);
    xlabel('Tiempo (Discreto)');
    ylabel('Valor');
end
