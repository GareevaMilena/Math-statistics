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
            selection(i) = normrnd(0, 1);
        end
        selection = sort(selection);
        %����������� � c���� ���� ��������� �������
        r = 0;
        r = n / 4;
        koef = 1 / (n - 2 * r);
        s = 0;
        for i = floor(r+1):ceil(n-r)
            s = s + selection(i);
        end
        %��������� �������
        x = koef * s;
        array(k) = x;
    end
    %����� ���� ��������� �������
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
