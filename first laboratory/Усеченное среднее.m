v = [10 50 1000];
for j = 1:3
    %�������� ������� (10, 50 ��� 1000)
    n = v(j);
    %���������� ������� �� ��������� ����� � ������������ ��������������
    selection = [];
    for i = 1:n
        selection(i) = cauchyrnd(0, 1);
    end
    %����������� � c���� ���� ��������� �������
    r = n / 4;
    koef = 1 / (n - 2 * r);
    s = 0;
    for i = floor(r+1):ceil(n-r)
        s = s + selection(i);
    end
    %��������� �������
    x = koef * s
end