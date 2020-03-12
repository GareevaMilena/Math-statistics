s = 0;
n = 100;
for(i in 1:1000)
{
  D <- DExp(rate = 1/sqrt(2));
  selection <-r(D)(n);
  boxplot(selection);
  ind <- which(selection %in% boxplot.stats(selection)$out);
  s = s + length(ind);
}
d = s / (1000 * n)
