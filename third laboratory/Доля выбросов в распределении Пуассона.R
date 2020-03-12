s = 0;
n = 100;
for(i in 1:1000)
{
  selection <- rpois(n, lambda = 10);
  boxplot(selection);
  ind <- which(selection %in% boxplot.stats(selection)$out);
  s = s + length(ind);
}
d = s / (1000 * n)