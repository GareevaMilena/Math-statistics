v = [20 100];
for j = 1:2
    n = v(j);
    selection = [];
    for i = 1:n
        selection(i) = poissrnd(10);
    end
    figure
    boxplot(selection);
    grid on;
    title('Боксплот распределения Пуассона');
    xlabel('Выборка');
    ylabel('Значения');
end