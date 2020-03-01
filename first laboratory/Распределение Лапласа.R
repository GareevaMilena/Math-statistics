n = 10;
li;
LaplaceNumbers <-r(D)(n);
a = min(LaplaceNumbers);
b = max(LaplaceNumbers);
m = round(1 + 3.322 * log10(n), 0);
step = (b - a) / m;
count = (b - a) / step;
x = array(c(T,F),dim=c(count));
for(i in 0 : count){
  x[i] = a + i * step
}
hist(LaplaceNumbers, probability = TRUE, col = "blue");
curve(d(D)(x), col = "red", add = TRUE);
grid();