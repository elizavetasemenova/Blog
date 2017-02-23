## loop
func_for <- function(n=1000){ y = c(); for (t in 1:n) y[t]=exp(t)}

## sapply
func_sapply <- function(n=1000){y = c(); y=sapply(1:n,exp)}

## vectorized
func_vect <- function(n=1000){y = c(); y=exp(1:n)} 

## functions to benchmark
my_functions <- c(func_for, func_sapply, func_vect)

## outside function
measure_time <- function(n, FUN){system.time(FUN(n))}

n=10^5
res <- data.frame(FunctionName=c('func_for','func_sapply','func_vect'),
                  ElapsedTime=mapply(measure_time, 
                                     rep(n, length(my_functions)),
                                     my_functions)['elapsed',])

res
##   FunctionName ElapsedTime
##1     func_for       27.669
##2  func_sapply        0.094
##3    func_vect        0.001
