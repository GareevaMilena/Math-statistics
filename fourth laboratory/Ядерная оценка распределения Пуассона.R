selection = rpois(n = 100,  10)

x = runif(10000, 6, 14)
x = sort(x)
x = round(x, 0.1)
l = dpois(x, 10)

plot(density(selection, adjust=1/2), xlim = c(6, 14), col = "red", main = "Pois n = 100")
lines(x, l, col="black")
lines(density(selection, adjust=1), col="green")
lines(density(selection, adjust=2), col = "blue")
legend("topright", pch = 19, col= c("black", "red", "green", "blue"), legend = c("pdf", "1/2*h", "h", "2*h" ))