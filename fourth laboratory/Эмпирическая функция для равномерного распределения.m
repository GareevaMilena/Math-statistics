v = [20 60 100];
for j = 1:3
    n = v(j);
    m = ceil (1 + 3.322 * log10(n));
    selection = [];
    for i = 1:n
        selection(i) = unifrnd(-sqrt(3), sqrt(3));
    end
    selection = sort(selection);
    a = -4;
    b = 4;
    step = (b - a) / m;
    array = [];
    for i = 1:(m + 1)
        array(i) = a + (i-1) * step;
    end
    n_i = [];
    for i = 1:m
        n_i(i) = 0;
    end
    for i = 1:m
        for j = 1:n
            if ( array(i) <= selection(j) && selection(j) <= array(i + 1) )
                n_i(i) = n_i(i) + 1;
            end
        end
    end
    count = 0;
    for i = 1:m
        count = count + n_i(i);
    end
    S = 0;
    for i = 1:m
        S = S + n_i(i)/n;
    end
    p = [];
    p(1) = 0;
    for i = 2:(m + 1)
        p(i) = (p(i - 1) + n_i(i - 1));
    end
    P = [];
    for i = 1:(m + 1)
        P(i) = p(i) / n;
    end
    figure
    stairs(array, P,'b-');
    title('Эмпирическая функция равномерного распределения');
    xlabel('Интералы');
    ylabel('F(x)')
    hold on
    grid on
    y = unifcdf(array, -sqrt(3), sqrt(3));
    plot(array, y, 'r');
end
