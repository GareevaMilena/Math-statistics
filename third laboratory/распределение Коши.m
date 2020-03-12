v = [20 100];
for j = 1:2
    n = v(j);
    selection = [];
    for i = 1:n
        selection(i) = cauchyrnd(0, 1);
    end
    figure
    boxplot(selection);
    grid on;
    title('Боксплот распределения Коши');
    xlabel('Выборка');
    ylabel('Значения');
end