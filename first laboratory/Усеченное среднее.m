v = [10 50 1000];
for j = 1:3
    %Мощность выборки (10, 50 или 1000)
    n = v(j);
    %Генерируем выборку из диапозона чисел с определенным распределением
    selection = [];
    for i = 1:n
        selection(i) = cauchyrnd(0, 1);
    end
    %коэффициент и cумма всех элементов выборки
    r = n / 4;
    koef = 1 / (n - 2 * r);
    s = 0;
    for i = floor(r+1):ceil(n-r)
        s = s + selection(i);
    end
    %усеченное среднее
    x = koef * s
end