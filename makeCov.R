makeCov <- function(rho, n){
  m <- matrix(nrow=n, ncol=n)
  m <- ifelse(row(m)==col(m),1,rho)
  return(m)
}
makeCov(0.2,3)
