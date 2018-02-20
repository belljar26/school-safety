#survey package with school safety
View(school_data)
#survey package is loaded
#check for NA
summary(school_data$FINALWGT)
school_data[is.na(school_data$FINALWGT),]
school.data.nomis <- subset(school_data, FINALWGT >=0)
length(school.data.nomis$FINALWGT)
#create scaling variable
wgt_n <-length(school.data.nomis$SCHID)
wgt_n
school.rscales <- wgt_n/(wgt_n-1)
school.rscales
grep("REPWGT1", names(school.data.nomis))
grep("REPWGT50", names(school.data.nomis))
#replicate weights @ 21- 70
#implement survey design
??surveyoptions
jk.n.school.data <- svrepdesign(data = school.data.nomis,
                                repweights = school.data.nomis[,21:70],
                                type= "JK1",
                                weights= ~FINALWGT,
                                rscales = school.rscales)
#check design
jk.n.school.data

svytable(~INVASIVE, jk.n.school.data)
# 0= 59854 vs 1= 23144.90
Weighted.school.model1 <- svyglm(INVASIVE~ C0196 + C0198 + C0200 + C0202 + C0204 +
         C0194 + C0190 + C0560 + C0562 + FR_LVEL + FR_SIZE,
       design =jk.n.school.data, family= "binomial")
str(jk.n.school.data)

weighted.school.mod1 <-svyglm(INVASIVE~ C0196 + C0198 + C0200 + C0202 + C0204 +
                                C0194 + C0190 + C0560 + C0562 + FR_LVEL + FR_SIZE,
                              design=jk.n.school.data, family= "binomial")
summary(weighted.school.mod1)
