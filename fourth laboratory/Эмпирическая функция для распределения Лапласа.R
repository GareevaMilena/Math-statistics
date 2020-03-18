n = 100;
m = round((1 + 3.322 * log10(n)), 0.1);
selection = rlaplace(100, 0, 1/sqrt(2));

selection = sort(selection);

a = -4;
b = 4;
step = (b - a) / m;
array = 0;
for(i in 1:(m + 1)) 
  array[i] = a + (i-1) * step;

ni = 0;
i = 1;
for (i in 1:m)
  ni[i] = 0;

j = 1;
for (i in 1:m)
  for (j in 1:n)
    if ( array[i] <= selection[j] & selection[j] <= array[i + 1] )
      ni[i] = ni[i] + 1;

p = 0;
p[1] = 0;

i = 2;
for (i in 2:(m + 1))
  p[i] = p[i - 1] + ni[i - 1];

P = 0;

for (i in 1:(m + 1))
  P[i] = p[i] / n;


x = runif(1000, -4, 4)
x = sort(x)
l = plaplace(x, 0, 1/sqrt(2))

plot(array, P, type = "s", main = "Эмпирическая функция распределения Лапласа", xlab = "Интервалы", ylab = "F(x)")
lines(x, l, col="black")
