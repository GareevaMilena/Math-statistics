x = qcauchy(c(0.25, 0.75), location = 0, scale = 1)
print(x)
left = x[1] - 1.5 * (x[2] - x[1])
right = x[2] + 1.5 * (x[2] - x[1])
print(pcauchy(left, 0, 1) + (1 - pcauchy(right, 0, 1)))