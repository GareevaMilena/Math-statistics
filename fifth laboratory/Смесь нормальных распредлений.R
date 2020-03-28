m_x = 0;
m_y = 0;

m_x1 = 0;
m_y1 = 0;

c_x = 1;
c_y = 1;

c_x1 = 10;
c_y1 = 10;

mu <- c(m_x,m_y)  

mu1 <- c(m_x1,m_y1)  

p = 0.9;
p1 = -0.9;

#n = 20, 60, 100
n = 60;

Sigma <- matrix(c(c_x^2, c_x * c_y * p, c_x * c_y * p, c_y^2), 2)
Sigma1 <- matrix(c(c_x1^2, c_x1 * c_y1 * p1, c_x1 * c_y1 * p1, c_y1^2), 2)

j = 1000;
R = 0;
D <-c();

while (j > 0)
{
  j = j - 1;
  normir <-  0.9 * mvrnorm(n, mu = mu, Sigma = Sigma ) + 0.1 * mvrnorm(n, mu = mu1, Sigma = Sigma1 )
  z = cor.test(normir[, 1], normir[, 2], method = "spearman")
  r = z$estimate
  D = append(D, r);
  R = R + r;
}
R = R/1000
print(R)
t = 0;
for (i in 1:1000)
  t = t + (D[i] - R)^2;
t = t/1000;
print(t)

j = 1000;
R = 0;
D <-c();
while (j > 0)
{
  j = j - 1;
  normir <- 0.9 * mvrnorm(n, mu = mu, Sigma = Sigma ) + 0.1 * mvrnorm(n, mu = mu1, Sigma = Sigma1 )
  s_x = sum((normir[, 1] - m_x)^2)
  s_y = sum((normir[, 2] - m_y)^2)
  K = sum((normir[, 1] - m_x)*(normir[, 2]-m_y))
  S = sqrt(s_x *s_y)
  r = K/S
  D = append(D, r);
  R = R + r;
}
R = R/1000
print(R)
t = 0;
for (i in 1:1000)
  t = t + (D[i] - R)^2;
t = t/1000;
print(t)


j = 1000;
D <-c();
R = 0;
while (j > 0)
{
  j = j - 1;
  n1= n2 = n3 = n4 = 0;
  normir <- 0.9 * mvrnorm(n, mu = mu, Sigma = Sigma ) + 0.1 * mvrnorm(n, mu = mu1, Sigma = Sigma1 )
  med_x = median(normir[, 1])
  med_y = median(normir[, 2])
  for (i in 1:n)
  {
    if (normir[i, 1] > med_x)
    {
      if (normir[i, 2] > med_y)
      {
        n1 = n1 + 1;
      }
      else
      {
        n4 = n4 + 1;
      }
    }
    else
    {
      if (normir[i, 2] > med_y)
      {
        n2 = n2 + 1;
      }
      else
      {
        n3 = n3 + 1;
      }
    }
  }
  rQ = ((n1 + n3)-(n2 + n4)) / n;
  D = append(D, rQ);
  R = R + rQ;
}
R = R/1000
print(R)
t = 0;
for (i in 1:1000)
  t = t + (D[i] - R)^2;
t = t/1000;
print(t)