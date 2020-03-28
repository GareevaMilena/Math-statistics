m_x = 0;
m_y = 0;

c_x = 1;
c_y = 1;
mu <- c(m_x,m_y)  

#p = 0, 0.5, 0.9
p = 0.9;

#n = 20, 60, 100
n = 20;

# > sigma
# c_x^2      c_x*c_y*r
# c_x*c_y*r  c_y^2
Sigma <- matrix(c(c_x^2, c_x * c_y * p, c_x * c_y * p, c_y^2), 2)

j = 1000;
D <-c();
R = 0;
while (j > 0)
{
  j = j - 1;
  n1= n2 = n3 = n4 = 0;
  normir <- mvrnorm(n, mu = mu, Sigma = Sigma )
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