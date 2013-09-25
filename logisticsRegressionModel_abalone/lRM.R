

# set global chunk options
# for figures
opts_chunk$set(fig.path='figs/', fig.align='center', fig.show='hold',
               dev='CairoPDF', out.width='.4\\linewidth')
# replacing "=" into "->" to make it R thing
options(replace.assign=TRUE,width=90)
# caching chunks
opts_chunk$set(cache.extra = R.version,cache.path='cache/')
opts_chunk$set(cache.extra = rand_seed)



abalone <- read.csv("input/Abalone.data", header=F)
head(abalone)

# exclude infants
abamf <- abalone[abalone[,1] != "I",]



# fitting (logistic regression)
lftn <- function(clmn){
  glm(abamf[,1]~clmn, family=binomial)$coef
}

# fit each column (except the gender) with the fitting model
loall <- sapply(abamf[,-1], lftn)
loall



sessionInfo()



library(knitr)
knit("lRM.Rnw" ) # compile to tex
purl("lRM.Rnw", documentation = 0) # extract R code only
knit2pdf("lRM.Rnw")


