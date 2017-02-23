////// "cox.stan" //////

data {
  int<lower=0> n;       // Number of obs
  int<lower=0> y[n];    // dep var
  vector[n] x;       // indep var
}

parameters {
  real<lower=-10,upper=10> beta0;
  real<lower=-10,upper=10> beta1;
  real<lower=0,upper=5> sigma_r;
  vector[n] r;      // noise
}

transformed parameters {
  vector[n] log_lambda;
  
  log_lambda = beta0 + beta1 * x + r;
}

model {
  // Priors
  beta0 ~ uniform(-10, 10);
  beta1 ~ uniform(-10, 10);
  sigma_r ~ uniform(0, 5);
  
  // noise
  r ~ normal(0, sigma_r);

  // Likelihood
  y ~ poisson_log(log_lambda);
}

generated quantities {
  vector[n] lambda;
  lambda = exp(log_lambda);
}
