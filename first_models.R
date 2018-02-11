# school safety
school$C0116 <- as.factor(school$C0116)

str(school)

school_mod1 <- glm(C0116 ~ C0196 + C0198 + C0200 + C0202 +
                     C0202 + C0204 + C0194 + C0560 +
                     C0562 , data = school, family = "binomial")
summary(school_mod1)
# school model with covariates

school_mod2  <- glm(C0116 ~ C0196 + C0198 + C0200 + C0202 +
                                   C0202 + C0204 + C0194 + C0560 +
                                   C0562 +
                                   FR_LVEL +
                                   FR_SIZE +
                                   FR_URBAN,
                                  data = school, family = "binomial")
summary(school_mod2)
