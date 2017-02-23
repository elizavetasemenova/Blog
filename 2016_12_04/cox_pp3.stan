//////// "pois.stan" ////////

data {
  int<lower=0> n;       // Number of obs
  int<lower=0> y[n];    // dep var
  vector[n] x;       // indep var
}

parameters {
  real<lower=-10,upper=10> beta0;
  real<lower=-10,upper=10> beta1;
}

transformed parameters {
  vector[n] log_lambda;
  
  log_lambda = beta0 + beta1 * x;
}

model {
  // Priors
  beta0 ~ uniform(-10, 10);
  beta1 ~ uniform(-10, 10);
  
  // Likelihood
  y ~ poisson_log(log_lambda);
}

generated quantities {
  vector[n] lambda;
  lambda = exp(log_lambda);
}
