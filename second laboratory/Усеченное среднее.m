v = [10 50 1000];
%количество, которое необходимо сгенерировать
m = 1000;
for j = 1:3
    %Мощность выборки (10, 50 или 1000)
    n = v(j);
    array = [];
    for k = 1:m
        %Генерируем выборку из диапозона чисел с определенным распределением
        selection = [];
        for i = 1:n
            selection(i) = normrnd(0, 1);
        end
        selection = sort(selection);
        %коэффициент и cумма всех элементов выборки
        r = 0;
        r = n / 4;
        koef = 1 / (n - 2 * r);
        s = 0;
        for i = floor(r+1):ceil(n-r)
            s = s + selection(i);
        end
        %усеченное среднее
        x = koef * s;
        array(k) = x;
    end
    %Сумма всех усеченных средних
    z = 0;
    for k = 1:m
        z = z + array(k);
    end
    Ez = 0;
    Ez = z / m
    %Сумма в дисперсии
    s1 = 0;
    for k = 1:m
        s1 = s1 + (array(k) - Ez).^2;
    end
    Dz = 0;
    Dz = s1 / m
end
