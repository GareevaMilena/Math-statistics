selection = rlaplace(100, 0, 1/sqrt(2))

x = runif(1000, -4, 4)
x = sort(x)
l = dlaplace(x, 0, 1/sqrt(2))

plot(density(selection, adjust=1/2), xlim = c(-4, 4), col = "red", main = "Laplace n = 100")
lines(x, l, col="black")
lines(density(selection, adjust=1), col="green")
lines(density(selection, adjust=2), col = "blue")
legend("topright", pch = 19, col= c("black", "red", "green", "blue"), legend = c("pdf", "1/2*h", "h", "2*h" ))