n = 100;
x = rnorm(n, mean = 0, sd = 1);
x_ = mean(x);
s = 0;
for (i in 1:n)
  s = s + (x[i] - x_)^2;
s = s/n;
s = sqrt(s);
#t1_20 = 32.852;
#t2_20 = 8.907;
t1_100 = 128.422;
t2_100 = 73.361;
#left = s*sqrt(n)/sqrt(t1_20);
#right = s*sqrt(n)/sqrt(t2_20);
left = s*sqrt(n)/sqrt(t1_100);
right = s*sqrt(n)/sqrt(t2_100);
print(left)
print(right)
