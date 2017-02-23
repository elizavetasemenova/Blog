## parameters of the normal noise
mu.r <- 0.5
sigma.r <- 1.3
y.r <- rpois(n, lambda = exp(beta0 + beta1*x + rnorm(n, mean=mu.r, sd=sigma.r)))
mean(y.r) #mean(y)*exp(mu.r+ (sigma.r)^2/2)
## [1] 39.073

## Log-linear model
fit.r  <- glm(y.r ~ x, family = poisson)

fit.r$coefficients
## (Intercept)           x 
##   3.3077246   0.1949446 
  
print(ci <- confint(fit.r))
##                   2.5 %    97.5 %
##   (Intercept) 3.2943078 3.3210787
##   x           0.1916182 0.1982712
