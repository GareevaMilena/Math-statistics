v = [20 100];
for j = 1:2
    n = v(j);
    selection = [];
    for i = 1:n
        selection(i) = unifrnd(-sqrt(3), sqrt(3));
    end
    figure
    boxplot(selection);
    grid on;
    title('Боксплот равномерного распределения');
    xlabel('Выборка');
    ylabel('Значения');
end