v = [10 50 1000];
for j = 1:3
    %Мощность выборки (10, 50 или 1000)
    n = v(j);
    %Генерируем выборку из диапозона чисел с определенным распределением
    selection = [];
    for i = 1:n
        selection(i) = cauchyrnd(0, 1);
    end
    %cумма всех элементов выборки
    s = 0;
    for i = 1:n
        s = s + selection(i);
    end
    %выборочное среднее
    x = s/n;
    s1 = 0;
    for i = 1:n
        s1 = s1 + (selection(i) - x).^2;
    end
    s1
    d = 0;
    d = s1 / n
end
