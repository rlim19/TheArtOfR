

# set global chunk options
# for figures
opts_chunk$set(fig.path='figs/', fig.align='center', fig.show='hold',
               dev='CairoPDF', out.width='.4\\linewidth')
# replacing "=" into "->" to make it R thing
options(replace.assign=TRUE,width=90)
# caching chunks
opts_chunk$set(cache.extra = R.version,cache.path='cache/')
opts_chunk$set(cache.extra = rand_seed)




# download source:
# - http://www.flcdatacenter.com/download/Perm_FY2006_TEXT.zip
# zip file stored in input/

rawData <- unzip('input/Perm_FY2006_TEXT.zip')
all2006 <- read.csv(rawData, as.is=TRUE, header=TRUE)
head(all2006)



# cleaning
all2006 <- within(all2006, {
  Wage_Offered_From <- as.numeric(gsub("\\$", "", Wage_Offered_From))
  Prevailing_Wage_Amount <- as.numeric(gsub("\\$", "", Prevailing_Wage_Amount))
  rat <- Wage_Offered_From/Prevailing_Wage_Amount
  })

head(all2006)

# filtering
all2006 <- subset(all2006,
                  Wage_Per=="Year" &  
                  Wage_Offered_From > 20000 &
                  Prevailing_Wage_Amount > 200
                  )



# selection based on professions
se2006 <- subset(all2006, grepl("Software Engineer", Prevailing_Wage_Job_Title))
prg2006 <- subset(all2006, grepl("Programmer", Prevailing_Wage_Job_Title))
ee2006 <- subset(all2006, grepl("Electronics Engineer", 
                                 Prevailing_Wage_Job_Title))



medRat <- function(dataFrame){
  return (median(dataFrame$rat, na.rm=TRUE))
}

makeCorp <- function(corpName){
  return (subset(all2006, Employer_Name == corpName))
}

# selection based on corporates iteratively
# make an object iterativey
# e.g employer microsoft corporation as ms2006
corpList <- c("MICROSOFT CORPORATION", "ms", 
              "INTEL CORPORATION", "intel",
              "SUN MICROSYSTEMS, INC.", "sun",
              "GOOGLE INC.", "google")

for (i in 1:(length(corpList)/2)) {
  corp <- corpList[2*i-1]
  newdtf <- paste(corpList[2*i], "2006", sep="")
  assign(newdtf, makeCorp(corp), pos=.GlobalEnv)
}

head(google2006)[5:10]
head(sun2006)[5:10]
head(intel2006)[5:10]

# for professional list iteratively
prof_list <- c('Software Engineer', 'se',
               'Programmer', 'prg',
               'Electronics Engineer', 'ee')

makeProf <- function(Prof){
  return (subset(all2006, Prevailing_Wage_Job_Title == Prof))
}

for (i in 1: (length(prof_list)/2)) {
  prof <- prof_list[2*i - 1]
  newdtf <- paste(prof_list[2*i], '2007', sep="")
  assign(newdtf, makeProf(prof), pos=.GlobalEnv)
}
head(2007)




sessionInfo()



library(knitr)
knit("salaryStudy.Rnw" ) # compile to tex
purl("salaryStudy.Rnw", documentation = 0) # extract R code only
knit2pdf("salaryStudy.Rnw")


