v = [10 50 1000];
%����������, ������� ���������� �������������
m = 1000;
for j = 1:3
    %�������� ������� (10, 50 ��� 1000)
    n = v(j);
    array = [];
    for k = 1:m
        %���������� ������� �� ��������� ����� � ������������ ��������������
        selection = [];
        for i = 1:n
            selection(i) = unifrnd(-sqrt(3), sqrt(3));
        end
        %c���� ���� ��������� �������
        s = 0;
        for i = 1:n
            s = s + selection(i);
        end
        %���������� �������
        x = s/n;
        array(k) = x;
    end
    %����� ���� ���������� �������
    z = 0;
    for k = 1:m
        z = z + array(k);
    end
    Ez = 0;
    Ez = z / m
    %����� � ���������
    s1 = 0;
    for k = 1:m
        s1 = s1 + (array(k) - Ez).^2;
    end
    Dz = 0;
    Dz = s1 / m
end
