library("pixmap")
mtrush1 <- read.pnm("mtrush1.pgm")
mtrush1
str(mtrush1)
plot(mtrush1)
locator()

mtrush2 <- mtrush1
mtrush2@grey[84:137,84:119] <- 1
plot(mtrush2)

#function to blur image
source("blurImage.R")
#blur image
mtrush3 <- blurpart(mtrush1,rows=84:163,cols=135:177,q=0.3)
plot(mtrush3)