# school safety
# metal detectors = C0116
school$C0116 <- as.factor(school$C0116)

str(school)
# model with metal detectors alone
school_mod1 <- glm(C0116 ~ C0196 + C0198 + C0200 + C0202 +
                     C0202 + C0204 + C0194 + C0560 +
                     C0562 , data = school, family = "binomial")
summary(school_mod1)
# school model with covariates and outcome of metal detectors

school_mod2  <- glm(C0116 ~ C0196 + C0198 + C0200 + C0202 +
                                   C0202 + C0204 + C0194 + C0560 +
                                   C0562 +
                                   FR_LVEL +
                                   FR_SIZE +
                                   FR_URBAN,
                                  data = school, family = "binomial")
summary(school_mod2)

## collapse metal detectors, canines, contraband sweeps-- 0= No, Y= 1
school$INVASIVE <- ifelse(school$C0116 == 1 | school$C0120 == 1 |
                        school$C0124 == 1 | school$C0126==1,
                     1,0)

## Model 3 uses combined INVASIVE variable

mod_school3 <- glm(INVASIVE ~ C0196 + C0198 + C0200 + C0202 +
                                     C0202 + C0204 + C0194 + C0560 +
                                     C0562 +
                                     FR_LVEL +
                                     FR_SIZE +
                                     FR_URBAN,
                                   data = school, family = "binomial")
summary(mod_school3)
