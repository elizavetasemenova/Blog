set.seed(1234)

# number of observations     
n <- 1000 

# independent variable
x <- rnorm(n=n, mean=1, sd=3) 

## regression coefficients
beta0 <- 2 
beta1 <- 0.2

## Pisson distributed outcome
y <- rpois(n, lambda = exp(beta0 + beta1*x))
mean(y)
## [1] 10.712

## Log-linear model
fit  <- glm(y ~ x, family = poisson)

fit$coefficients
## (Intercept)           x 
##   1.9789049   0.2060415

print(ci <- confint(fit))
##                 2.5 %    97.5 %
## (Intercept) 1.9527395 2.0048361
## x           0.1996732 0.2124106
