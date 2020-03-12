n = 20;
D <- DExp(rate = 1/sqrt(2))
selection <-r(D)(n)
boxplot(selection, horizontal = FALSE)
grid()