library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

## data
data <- list(n=n,x=x,y=y)
data.r <- list(n=n,x=x,y=y.r)

## Initial values
inits <- function() list(beta0 = runif(1, -5, 5),
                         beta1 = runif(1, -5, 5))

## Parameters monitored
params <- c("beta0", "beta1")

## MCMC settings
n.inter <- 200
n.thin <- 1
n.warm <- 100
n.chains <- 3

## Call Stan from R
fit <- stan("pois.stan", data = data,
            init = inits, pars = params,
            chains = n.chains, thin = n.thin, iter = n.inter, warmup = n.warm)

## Summarize posteriors
print(fit)

fit.r <- stan("pois.stan", data = data.r,
              init = inits, pars = params,
              chains = n.chains, thin = n.thin, iter = n.inter, warmup = n.warm)

## Summarize posteriors
print(fit.r)
