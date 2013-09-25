###############################################  
# A measure of association ~ Kendall's tau    #
# defined as                                  #
# - fraction of the time x and y              #
#   increase or decrease together             #
#   the proportion of i for which y[i+1]-y[i] #
#   has the same sign as x[i+1]-x[i]          #
###############################################


findTrendCor <- function(v){
  # function to find the trend in the vector
  # 1 as increasing and -1 as decreasing
  
  # vector difference of [i+1]-x[i]  
  v_diff <- v[-1] -v[-length(v)]
  return (ifelse(v_diff > 0 , 1, -1))
}

ratioCorr <- function(x,y){
  diff_v <- lapply(list(x,y), findTrendDifference)
  # fraction of matchesß
  return (mean(diff_v[[1]] == diff_v[[2]]))
}

# in one liner
ratioCorr2 <- function(x,y)mean(sign(diff(x)) == sign(diff(y)))

# test e.g
x <- c(5,12,13,3,6,0,1,15,16,8,88)
y <- c(4,2,3,23,6,10,11,12,6,3,2)
ratioCorr(x,y)
ratioCorr2(x,y)

