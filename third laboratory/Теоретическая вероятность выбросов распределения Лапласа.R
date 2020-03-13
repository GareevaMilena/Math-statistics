D <- DExp(rate = 1/sqrt(2))
x = q(D)(c(0.25, 0.75)) / 2

print(x)
left = x[1] - 1.5 * (x[2] - x[1])
right = x[2] + 1.5 * (x[2] - x[1])
