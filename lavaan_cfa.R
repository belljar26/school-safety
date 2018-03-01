#confirmatory factor analysis
data.cov <- cov(school_factor)
data.cov
library(foreign)
library(sem)
library(lavaan)
#lavaan survey is also available
# each component is based on the earlier EFA 
write_csv(school_factor, "school_factor.csv")
school_factor <- read_csv("school_factor.csv")
View(school_factor)
fact.model1 <-'parent =~ C0196 + C0198 + C0200 + C0202 + FR_LVEL
crime =~ C0562 +C0560 + FR_CATMN + C0308
limited =~ C0284 + C0288
schooldem =~ FR_SIZE + FR_URBAN'

#fit model
fit.school.factor <- cfa(fact.model1, data= school_factor)
  
summary(fit.school.factor)
