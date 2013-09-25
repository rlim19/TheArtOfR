###################################
# count the number of odd numbers #
###################################

oddcount <- function(x){
  k <- 0
  for (n in x){
    if (n %% 2 == 1) k <- k + 1
  }
  return (k)
}

countOnlyOdd <- function(x){
  k <- 0
  for (n in x){
    if (n %% 2 == 1) k <- k + n
    else next
  }
  return (k)
}

countOnlyEven <- function(x){
  k <- 0
  for (n in x){
    if (n %% 2 == 0) k <- k + n
    else next
  }
  return (k)
}


oddcount(c(1,3,4,5))
countOnlyOdd(c(1,3,4,5))
countOnlyEven(c(2,3,4,5))

