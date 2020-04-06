n = 20;
x = rnorm(n, mean = 0, sd = 1);
x_ = mean(x);
m4 = 0;
for (i in 1:n)
  m4 = m4 + (x[i] - x_)^4;
m4 = m4 / n;
E = m4/s^4 - 3;
s = 0;
for (i in 1:n)
  s = s + (x[i] - x_)^2;
s = s/n;
s = sqrt(s);
u = 1.96 ;
left = s* ( 1 - (1/(2 * sqrt(n)) * u * sqrt(E + 2)) );
right = s * (1 + (1/(2 * sqrt(n)) * u * sqrt(E + 2)) );
print(left)
print(right)
