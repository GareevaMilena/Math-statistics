a = -1.8;
b = 2;
h = 0.2;
n = 20;
x <-c();
for (i in 1:n)
{
  r = -1.8 + (i - 1) * 0.2;
  x = append(x, r);
}
e = rnorm(n, mean = 0, sd = 1);
y <-c()
for (i in 1:n)
{
  r = 2 + 2 * x[i] + e[i];
  y = append(y, r);
}
#for (i in 1:n)
#{
# r = 2 + 2 * x[i];
#  y = append(y, r);
#}
#y[1] = y[1] + 10;
#y[n] = y[n] - 10;
#МНК

xbar = mean(x)
ybar = mean(y)

x_2 <- c()
for (i in 1:n) 
{
  r = x[i]^2;
  x_2 = append(x_2, r);
}
x_2bar = mean(x_2)

y_2 <- c()
for (i in 1:n) 
{
  r = y[i]^2;
  y_2 = append(y_2, r);
}
y_2bar = mean(y_2)

xy <- c()
for (i in 1:n) 
{
  r = x[i] * y[i];
  xy = append(xy, r);
}
xybar = mean(xy)

b1 = (xybar - xbar * ybar) / (x_2bar - xbar^2)
b0 = ybar - xbar * b1
print(b1)
print(b0)

#МНМ
rQ <-c()
for (i in 1:n)
{
  r = sign(x[i] - median(x)) * sign(y[i] - median(y))
  rQ = append(rQ, r);
}
rQbar = mean(rQ)

l = n / 4;
j = n - l + 1;


x1 = x[l];
x2 = x[j];

y1 = y[l];
y2 = y[j];

q_x = (x2 - x1) / 2;

q_y = (y2 - y1) / 2;

b1r = rQbar * q_y / q_x;
b0r = median(y) - median(x) * b1r;


print(b1r)
print(b0r)

plot(x, y, pch = 16, col = "yellow")
abline(a = 2, b = 2, col = "blue")
abline(a = b0, b = b1, col = "green")
abline(a = b0r, b = b1r, col = "black")
legend("topleft", pch = 19,col= c("yellow", "blue", "green", "black"), legend = c("Выборка", "Модель", "МНК", "МНМ" ))

