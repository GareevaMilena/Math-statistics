s = 0;
n = 100;
for(i in 1:1000)
{
  selection <- rcauchy(n, location = 0, scale = 1);
  boxplot(selection);
  ind <- which(selection %in% boxplot.stats(selection)$out);
  s = s + length(ind);
}
d = s / (1000 * n)

