#find outliers from each row, a value that deviates the most

findols <- function(x){
  findol <- function(xrow){
    mdn <- median(xrow)
    devs <- abs(xrow-mdn)
    #return the index (in this case is the column's index of each row)
    return(which.max(devs))
  }
  return(apply(x,1,findol))
}

m <- matrix(c(1,1,4,5,4,3,0,3,1), nrow=3, byrow=T)
m
findols(m)
