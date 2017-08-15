
##############################
## Exponential from Uniform ##
##############################
rm(list=ls())
n = 10^5
u = runif(n)
Finv_rexp <- function(u, lambda){-1/lambda*log(u)}

lambda = 2
x = Finv_rexp(u, lambda)
y=rexp(n, rate = lambda)
par(mfrow=c(2,2))
hist(x,freq=F,main="Exp: inv CDF simulated in R")
hist(y,freq=F,main="Exp: built-in R")

# read the output of the C++ simulation
d = read.table("/Users/semenova/Dropbox/Cpp/ICDFcpp/ICDFout.txt", 
               sep="\t",
               col.names=c("u", "e"))
head(d); tail(d)
d <- d[-c(1),]
nrow(d)
hist(d$u,freq=F, main="U[0,1] from C++")
hist(d$e,freq=F, main="Exp: inv CDF simulated in C++")

library(ggplot2)
x <- data.frame(x)
y <- data.frame(y)
d <- data.frame(d)

par(mfrow=c(2,2))
ggplot(x, aes(x, fill = cut(x, 100))) +
  geom_histogram(binwidth=0.2, show.legend = FALSE) +
  theme_minimal() +
  labs(x = "~ Exp(lambda)", y = "n") +
  ggtitle("Exponential distribution simulated through ICDF method in R")

ggplot(y, aes(y, fill = cut(y, 100))) +
  geom_histogram(binwidth=0.2, show.legend = FALSE) +
  theme_minimal() +
  labs(x = "~ Exp(lambda)", y = "n") +
  ggtitle("Exponential distribution, built-in R function")

ggplot(d, aes(u, fill = cut(u, 1000))) +
  geom_histogram(binwidth=0.2) 

ggplot(d, aes(e, fill = cut(e, 1000))) +
  geom_histogram(binwidth=0.2, show.legend = FALSE) +
  theme_minimal() +
  labs(x = "~ Exp(lambda)", y = "n") +
  ggtitle("Exponential distribution simulated through ICDF method in C++")
