v = [10 50 1000];
for j = 1:3
    %�������� ������� (10, 50 ��� 1000)
    n = v(j);
    %��������� ���������� ���������� � ������� ������� ����������(1)
    m = ceil (1 + 3.322 * log10(n));
    %���������� ������� �� ��������� ����� � ���������� ��������������
    selection = [];
    for i = 1:n
        selection(i) = poissrnd(10);
    end
    %������� ������� ��������� � ������� ����� �������
    a = min(selection);
    b = max(selection);
    step = (b - a) / m;
    %��������� [a, b] �� m ����������
    array = [];
    for i = 1:(m + 1)
        array(i) = a + (i-1) * step;
    end
    %�������� ������� ��� �������� ������
    n_i = [];
    for i = 1:m
        n_i(i) = 0;
    end
    %� �������� ���
    for i = 1:m
        for j = 1:n
            if ( array(i) <= selection(j) && selection(j) <= array(i + 1) )
                n_i(i) = n_i(i) + 1;
            end
        end
    end
    %��������: ����� ���� ������ == ��������
    count = 0;
    for i = 1:m
        count = count + n_i(i);
    end
    %������������ ������ �������
    h = [];
    for i = 1:m
        h(i) = n_i(i)/(n * step);
    end
    %��������: ����� ���� �������� == 1
    S = 0;
    for i = 1:m
        S = S + n_i(i)/n;
    end
    %������ �������� ������� ��������� � �������� �����������
    array_for_figure = [];
    array_for_figure(1) = a + step / 2;
    for i = 2:m
        array_for_figure(i) = array_for_figure(i - 1) + step;
    end
    %������ ������
    figure
    bar(array_for_figure, h)
    title('����������� � ������� ��������� ����������� ������������ ��������');
    xlabel('���������');
    ylabel('������� ���������');
    hold on
    grid on
    %���������� ��������� ����������� � �������� �� ��� �� �������
    new_array = [];
    for i = 1:m+1
        new_array(i) = ceil(array(i));
    end
        y = poisspdf(new_array, 10);
    plot(array, y, 'r');
end

