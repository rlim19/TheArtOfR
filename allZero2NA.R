m <- matrix(c(0,0,2,0,0,0), nrow=3, byrow=F)
m[which(rowSums(m)==0),] <- NA
m