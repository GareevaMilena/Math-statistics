n = 100;
x = rnorm(n, mean = 0, sd = 1);
x_ = mean(x);
s = 0;
for (i in 1:n)
  s = s + (x[i] - x_)^2;
s = s/n;
s = sqrt(s);
#t_20 = 2.093;
t_100 = 1.984;
left = x_ - s*t_20/sqrt(n-1);
right = x_ + s*t_20/sqrt(n-1);
left = x_ - s*t_100/sqrt(n-1);
right = x_ + s*t_100/sqrt(n-1);
print(left)
print(right)
