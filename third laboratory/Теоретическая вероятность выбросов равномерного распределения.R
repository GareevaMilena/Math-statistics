x = qunif(c(0.25, 0.75), -sqrt(3), sqrt(3))
print(x)
left = x[1] - 1.5 * (x[2] - x[1])
right = x[2] + 1.5 * (x[2] - x[1])
print(punif(left, -sqrt(3), sqrt(3)) + (1 - punif(right, -sqrt(3), sqrt(3))))