m_x = 0;
m_y = 0;

c_x = 1;
c_y = 1;
mu <- c(m_x,m_y)  

#p = 0, 0.5, 0.9
p = 0.9;

#n = 20, 60, 100
n = 100;

# > sigma
# c_x^2      c_x*c_y*r
# c_x*c_y*r  c_y^2
Sigma <- matrix(c(c_x^2, c_x * c_y * p, c_x * c_y * p, c_y^2), 2)

j = 1000;
R = 0;
D <-c();
while (j > 0)
{
  j = j - 1;
  normir <- mvrnorm(n, mu = mu, Sigma = Sigma )
  s_x = sum((normir[, 1] - m_x)^2)
  s_y = sum((normir[, 2] - m_y)^2)
  K = sum((normir[, 1] - m_x)*(normir[, 2]-m_y))
  S = sqrt(s_x *s_y)
  r = K/S
  D = append(D, r);
  R = R + r^2;
}
R = R/1000
print(R)
t = 0;
for (i in 1:1000)
  t = t + (D[i] - R)^2;
t = t/1000;
print(t)
