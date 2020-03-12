v = [20 100];
for j = 1:2
    n = v(j);
    selection = [];
    for i = 1:n
        selection(i) = normrnd(0, 1);
    end
    figure
    boxplot(selection);
    grid on;
    title('Боксплот нормального распределения');
    xlabel('Выборка');
    ylabel('Значения');
end