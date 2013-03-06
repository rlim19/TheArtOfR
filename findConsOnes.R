#########################
# find consecutive ones #
#########################

findConsOnes <- function(x,k){
  n <- length(x)
  consIndex <- NULL
  for (i in 1:(n-k+1)){
    if (all(x[i:(i+k-1)] == 1)) 
      consIndex <- c(consIndex,i)
  }
  return (consIndex)
}

# avoid creating new vector during looping
findConsOnes_1 <- function(x,k){
  n <- length(x)
  consIndex <- vector(length=n)
  count <- 0
  for (i in 1:(n-k+1)){
    if(all(x[i:(i+k-1)]==1)){
      count <- count + 1
      consIndex[count] <- i
    }
  }
  if (count > 0) {
    consIndex <- consIndex[1:count]
  }
  else consIndex <- NULL
  return (consIndex)
}
####################################
# e.g
findConsOnes(c(0,1,1,1,0,0,0), 2)