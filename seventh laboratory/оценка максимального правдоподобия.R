n = 100;
x = rnorm(n, mean = 0, sd = 1);
m_p = mean(x);
#есть функция var, но она для n-1 элементов почему-то 
s = 0;
for (i in 1:n)
  s = s + (x[i] - m_p)^2;
d_p = s/n;
print(m_p);
print(d_p)