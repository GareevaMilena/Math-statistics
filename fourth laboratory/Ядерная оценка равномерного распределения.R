selection = runif(n = 100,-sqrt(3),sqrt(3))

x = runif(10000, -4, 4)
x = sort(x)
y = dunif(x, -sqrt(3), sqrt(3))

plot(density(selection, adjust=1/2), xlim = c(-4, 4), col = "red", main = "Unif n = 100")
lines(x, y, col="black")
lines(density(selection, adjust=1), col="green")
lines(density(selection, adjust=2), col = "blue")
legend("topright", pch = 19, col= c("black", "red", "green", "blue"), legend = c("pdf", "1/2*h", "h", "2*h" ))


