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
        ost = mod(n, 4);
        if (ost == 0)
            i = n / 4;
        else
            i = floor(n / 4) + 1;
        end
        z1 = selection(i);
        z2 = selection(n - i + 1);
        x = (z1 + z2)/2;
        array(k) = x;
    end
    %����� ���� �������� ������������� ���������� ���������
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
