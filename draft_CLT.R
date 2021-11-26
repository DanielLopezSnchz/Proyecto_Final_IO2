
#### TEOREMA DE LIMITE CENTRAL ####

# Normal

dist_norm <- rnorm(n = 1000, mean = 56, sd = 12)
hist(dist_norm)

means_samples <- NULL
for (i in 1:1000) {
  samples <- sample(x = dist_norm, size = 30)
  means_samples <- c(means_samples, mean(samples))
}
hist(samples)
hist(means_samples)

# Uniform
dist_unif <- runif(n = 1000, min = 20, max = 60)
hist(dist_unif)

means_samples <- NULL
for (i in 1:1000) {
  samples <- sample(x = dist_unif, size = 30)
  means_samples <- c(means_samples, mean(samples))
}
hist(samples)
hist(means_samples)

# Exponential
dist_exp <- rexp(n = 1000, rate = 1/4)
hist(dist_exp)

means_samples <- NULL
for (i in 1:1000) {
  samples <- sample(x = dist_exp, size = 30)
  means_samples <- c(means_samples, mean(samples))
}
hist(samples)
hist(means_samples)

# Poisson
dist_poisson <- rpois(n = 1000, lambda = 3)
hist(dist_poisson)

means_samples <- NULL
for (i in 1:1000) {
  samples <- sample(x = dist_poisson, size = 30)
  means_samples <- c(means_samples, mean(samples))
}
hist(samples)
hist(means_samples)

# Chi-squared
dist_chisq <- rchisq(n = 1000, df = 5)
hist(dist_chisq)

means_samples <- NULL
for (i in 1:1000) {
  samples <- sample(x = dist_chisq, size = 30)
  means_samples <- c(means_samples, mean(samples))
}
hist(samples)
hist(means_samples)

# Beta
dist_beta <- rbeta(n = 1000, shape1 = 4, shape2 = 2)
hist(dist_beta)

means_samples <- NULL
for (i in 1:1000) {
  samples <- sample(x = dist_beta, size = 30)
  means_samples <- c(means_samples, mean(samples))
}
hist(samples)
hist(means_samples)




