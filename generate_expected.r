df <- 5
sigma <- c(1, 6, 3)
mu <- c(45, 35, 40)
lower <- 20
upper <- 50

e <- c(0,0,0)
for(i in 1:3)
{
  a <- (lower - mu[i])/sigma[i]
  b <- (upper - mu[i])/sigma[i]
  e[i] <- mu[i] + sigma[i]*gamma((df-1)/2)*
    (((df + a^2)^(-(df-1)/2)-(df + b^2)^(-(df-1)/2))*df^(df/2))/
    (2*(pt(b,df)-pt(a,df))*gamma(df/2)*gamma(0.5))
}

write(e, file='expected.txt', ncolumns = 3, sep = " ")
