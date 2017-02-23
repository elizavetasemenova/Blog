code_R = ' myfunc <- function(x) x*2
           p = myfunc(3)
           print(p)'
eval(parse(text=code_R))
