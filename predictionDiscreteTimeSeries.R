##########################################
# Predicting discrete-valued time series #
##########################################

# data consists of 0 (no rain) and 1 (rain)
# predict whether it will rain or not tomorrow 
# based on it rained or not in recent days
# for some number k, predict tomorrow's weather based on
# the weather record of the lask k days
# majority rule applied, i.e,
# given the number of 1s in the previous k time periods is at least (>) k/2
# the prediction is given as 1, otherwise is 0.
# e.g for k = 3, the data for the last three periods 1,0,1 and k/2 = 1.5 as
# the last three weather's records are 2 (>1.5) then the prediction is 1

prediction <- function(x,k){
  n <- length(x)
  threshold <- k/2
  predicted <- vector(length=n-k)
  # predicting day i+k from k previous days
  # k previous days i,....,i+k-1
  for (i in 1:(n-k)){
    if (sum(x[i:(i+(k-1))]) >= threshold)
      predicted[i] <- 1 else predicted[i] <- 0
  }
  return (mean(abs(predicted-x[(k+1):n])))
}

prediction2 <- function(x,k){
  n <- length(x)
  threshold <- k/2
  pred <- vector(length=n-k)
  csx <- c(0,cumsum(x))
  for (i in 1:(n-k)){
    if (csx[i+k] - csx[i] >= threshold) 
      pred[i] <- 1 else pred[i] <- 0
  }
  return (mean(abs(pred-x[(k+1):n])))
}
# test run
prediction(c(0,1,1,1,1,0,0,1,1), k=4)
prediction2(c(0,1,1,1,1,0,0,1,1), k=4)