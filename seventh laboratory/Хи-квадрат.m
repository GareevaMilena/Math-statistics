n = 100;
k = 1 + 3.322 * log10(n);
k = 7;
x = [];
for i = 1:n
    x(i) = normrnd(0, 1);
end
x = sort(x);
a = x(1);
b = x(n);
h = (b - a) / k;
array = [];
for i = 1:k
    array(i) = a + (i - 1) * h;
end
array(1) = -inf;
array(8) = inf;
n_i = [];
for i = 1:k
  n_i(i) = 0;
end
for i = 2:k-1
    for j = 1:n
        if ( array(i) < x(j) && x(j) < array(i + 1) )
            n_i(i) = n_i(i) + 1;
        end
    end
end
i = 2;
for j = 1:n
        if ( array(i) > x(j) )
            n_i(i - 1) = n_i(i - 1) + 1;
        end
end
i = k;
for j = 1:n
        if ( array(i) < x(j) )
            n_i(i) = n_i(i) + 1;
        end
end
count = 0;
for i = 1:k
    count = count + n_i(i);
end
count
pi = [];
for j = 1:k
    pi(j) = normcdf(array(j + 1), 0, 1)- normcdf(array(j), 0, 1);
end
count = 0;
for i = 1:k
    count = count + pi(i);
end
count
np = [];
for i = 1:k
    np(i) = n * pi(i);
end
count = 0;
for i = 1:k
    count = count + np(i);
end
count
count = 0;
np_1 = [];
for i = 1:k
    np_1(i) = n_i(i) - np(i);
end
for i = 1:k
    count = count + np_1(i);
end
count
np_2 = [];
for i = 1:k
    np_2(i) = np_1(i).^2;
end
xi = [];
for i = 1:k
    xi(i) = np_2(i)/np(i);
end
count = 0;
for i = 1:k
    count = count + xi(i);
end
count
    