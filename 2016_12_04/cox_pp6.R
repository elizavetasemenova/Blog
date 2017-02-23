## Initial values
inits <- function() list(beta0 = runif(1, -10, 10),
                         beta1 = runif(1, -10, 10),
                         sigma_r = runif(1, 0, 5))

## Parameters monitored
params <- c("beta0", "beta1","sigma_r")

## MCMC settings
n.inter <- 10000
n.thin <- 1
n.warm <- 3000
n.chains <- 3

fit.r <- stan("cox.stan", data = data.r,
              init = inits, pars = params,
              chains = n.chains, thin = n.thin, iter = n.inter, warmup = n.warm)

## Summarize posteriors
print(fit.r)
