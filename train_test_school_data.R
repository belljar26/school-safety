library(caTools)
set.seed(50)
school.split <- sample.split(rev.school$INVASIVE, SplitRatio = .7)
school.train <- subset(rev.school, school.split == TRUE)
school.test <- subset(rev.school, school.split == FALSE)

## training first model
Model.school1 <- glm(INVASIVE ~. -SCHID, data= rev.school,
                     family= "binomial")
summary(Model.school1)
## significant variables are: Parent Participation, teacher conferences
## parent community groups, school level, size and urban
## interesting crime in community is not significant

predict.school.test <- predict(Model.school1, type= "response",
                               newdata = school.test)
table(school.test$INVASIVE, predict.school.test >.5)
## accuracy
(268 + 298)/ (268 + 139 + 63 + 298)
## accuracy 74%


Mod2.school <- glm(INVASIVE ~ C0196 +C0198 + C0200 + C0204 +
                     FR_LVEL + FR_SIZE + FR_URBAN,
                   data= rev.school, family= "binomial")
summary(Mod2.school)
## AIC Mod 2 = 2807 vs 2814 Mod 1
predict.school.test2 <- predict(Mod2.school, type= "response",
                               newdata = school.test)
table(school.test$INVASIVE, predict.school.test2 >.5)
##  accuracy
(266 + 295)/ (266 + 141 + 66 + 295)
## no change in accuracy
library(ROCR)
ROCRpred.school <- prediction(predict.school.test2, school.test$INVASIVE)

as.numeric(performance(ROCRpred.school, "auc") @y.values)
## AUC = 82