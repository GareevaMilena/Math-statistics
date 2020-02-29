v = [10 50 1000];
for j = 1:3
    %Мощность выборки (10, 50 или 1000)
    n = v(j);
    %Генерируем выборку из диапозона чисел с определенным распределением
    selection = [];
    for i = 1:n
        selection(i) = normrnd(0, 1);
    end
    m = mod(n, 4);
    if (m == 0)
        i = n / 4;
    else
        i = floor(n / 4) + 1;
    end
    z1 = selection(i);
    z2 = selection(n - i + 1);
    Z = (z1 + z2)/2
end