for (t in 1:5){    
  n <- 100    
  y <- sample(1:5, n, replace = T)    
  y <- tabulate(y)      
  col.seq <- seq(0.3,1,1/length(unique(y)))    
  col.seq <- col.seq[match(y, sort(y))]      
  cols <- alpha('coral3', col.seq)       
  pl <- barplot(y,                           
                col=cols,                          
                border=alpha('coral3', 0.3) ,                          
                yaxt='n')      
  text(pl, min(y)/2, y,cex=1.2, pos=3, col='coral4')    
  Sys.sleep(1)
}
