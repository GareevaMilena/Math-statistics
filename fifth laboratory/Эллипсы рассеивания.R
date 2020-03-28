
m_x = 0;
m_y = 0;

c_x = 1;
c_y = 1;

mu <- c(m_x,m_y) 
p = 0.9;

Sigma <- matrix(c(c_x^2, c_x * c_y * p, c_x * c_y * p, c_y^2), 2)


set.seed(100)
data <- mvrnorm(n = 100, mu = mu, Sigma = Sigma ) 
require(ellipse)
confidence.ellipse <- ellipse(Sigma,centre=mu,level=0.99,npoints=100)


plot(confidence.ellipse,type="l",
     xlim=c(-3, 3),ylim=c(-3, 3), main = "Эллипс рассеивания")
par(new=TRUE)
plot(data,  xlab="x", ylab="y",  axes = FALSE, ann = FALSE, col=rgb(0, 0, 1, 0.9), pch=19)