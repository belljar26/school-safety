school_factor <- school_data2[, c(2:12,14:19)]
str(school_factor)
View(school_factor)
school_factor[,1:17] <- lapply(school_factor[, 1:17], as.integer)
parallel.school <-fa.parallel(school_factor, fm= "minres",
                              fa= "fa")
# suggests number of factors = 6--but let's start with 4
four.factor.school <- fa(school_factor, nfactors=4,
                         rotate = "oblimin", fm= "minres")
four.factor.school
print(four.factor.school$loadings, cutoff= .3)
# no double loadings but let's try 3 as some are not significant
three.factor.school <- fa(school_factor, nfactors=3,
                         rotate = "oblimin", fm= "minres")
three.factor.school
print(three.factor.school$loadings, cutoff=.3)
#double loadings here with 3-
fa.diagram(four.factor.school)
