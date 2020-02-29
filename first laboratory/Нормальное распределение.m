v = [10 50 1000];
for j = 1:3
    %Мощность выборки (10, 50 или 1000)
    n = v(j);
    %Вычисляем количество интервалов с помощью формулы Стерджесса(1)
    m = ceil (1 + 3.322 * log10(n));
    %Генерируем выборку из диапозона чисел с нормальным распределением
    selection = [];
    for i = 1:n
        selection(i) = normrnd(0, 1);
    end
    %Находим границы интервала с помощью нашей выборки
    a = min(selection);
    b = max(selection);
    step = (b - a) / m;
    %Разбиваем [a, b] на m интервалов
    array = [];
    for i = 1:(m + 1)
        array(i) = a + (i-1) * step;
    end
    %Создадим маассив для подсчета частот
    n_i = [];
    for i = 1:m
        n_i(i) = 0;
    end
    %И заполним его
    for i = 1:m
        for j = 1:n
            if ( array(i) <= selection(j) && selection(j) <= array(i + 1) )
                n_i(i) = n_i(i) + 1;
            end
        end
    end
    %Проверка: сумма всех частот == мощности
    count = 0;
    for i = 1:m
        count = count + n_i(i);
    end
    %Подсчитываем высоту стобцов
    h = [];
    for i = 1:m
        h(i) = n_i(i)/(n * step);
    end
    %Проверка: сумма всех площадей == 1
    S = 0;
    for i = 1:m
        S = S + n_i(i)/n;
    end
    %найдем середину каждого интервала и построим гистограмму
    array_for_figure = [];
    array_for_figure(1) = a + step / 2;
    for i = 2:m
        array_for_figure(i) = array_for_figure(i - 1) + step;
    end
    %Строим график
    figure
    bar(array_for_figure, h)
    title('Гистограмма и функция плотности вероятности нормального распределения');
    xlabel('Интервалы');
    ylabel('Частота попадания')
    hold on
    grid on
    %рассчитаем плотность вероятности и построим на том же графике
    y = normpdf(array, 0, 1);
    plot(array, y, 'r');
end
