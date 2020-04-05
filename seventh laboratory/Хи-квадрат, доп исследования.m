n = 10;
k = 1 + 3.322 * log10(n);
k = 4;
x = [];
r = 0;
for m = 1:1000
    for i = 1:n
        x(i) = normrnd(0, 1);
    end
    x = sort(x);
    a = x(1);
    b = x(n);
    step = (b - a) / k;
    array = [];
    for i = 1:k+1
        array(i) = a + (i - 1) * step;
    end
    aa = array(1);
    bb = array(k+1);
    array(1) = -inf;
    array(k + 1) = inf;
    n_i = [];
    for i = 1:k
      n_i(i) = 0;
    end
    for i = 2:k-1
        for j = 1:n
            if ( array(i) < x(j) && x(j) < array(i + 1) )
                n_i(i) = n_i(i) + 1;
            end
        end
    end
    i = 2;
    for j = 1:n
            if ( array(i) > x(j) )
                n_i(i - 1) = n_i(i - 1) + 1;
            end
    end
    i = k;
    for j = 1:n
            if ( array(i) < x(j) )
                n_i(i) = n_i(i) + 1;
            end
    end
    sum(n_i)
    pi = [];
    for j = 1:k
        pi(j) = normcdf(array(j + 1), 0, 1)- normcdf(array(j), 0, 1);
    end
    sum(pi)
    np = [];
    np = n * pi;
    sum(np)
    np_1 = [];
    np_1 = n_i - np;
    sum(np_1)
    np_2 = [];
    np_2 = np_1.^2;
    xi = [];
    for i = 1:k
        xi(i) = np_2(i) / np(i);
    end
   count = sum(xi)
    r = r + count;
end
r = r / m;
r
h = [];
for i = 1:k
    h(i) = n_i(i)/(n * step);
end
array_for_figure = [];
array_for_figure(1) = a + step / 2;
for i = 2:k
    array_for_figure(i) = array_for_figure(i - 1) + step;
end
figure
bar(array_for_figure, h)
title('Гистограмма и функция плотности вероятности нормального распределения');
xlabel('Интервалы');
ylabel('Частота попадания')
hold on
grid on
array(1) = aa;
array(k) = bb;
y = normpdf(array, 0, 1);
plot(array, y, 'r');
print('r10', '-dpng')
    