n = 100;
x = rnorm(n, mean = 0, sd = 1);
x_ = mean(x);
s = 0;
for (i in 1:n)
  s = s + (x[i] - x_)^2;
s = s/n;
s = sqrt(s);
u = 1.96 ;
left = x_ - s*u/sqrt(n);
right = x_ + s*u/sqrt(n);
print(left)
print(right)
