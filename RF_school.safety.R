## Random Forest
## use split in last GLM

school.random.forest <- randomForest(INVASIVE ~. - SCHID,
                                     data= school.train, ntree= 200)
                                     
school.test.pred.rf <- predict(school.random.forest, newdata= school.test,
                               type= "response") 
table(school.test.pred.rf, school.test$INVASIVE)

#confusion matrix
(265 + 278)/ (265 + 83 + 142 + 278)
## accuracy 72 %
importance(school.random.forest)
varImpPlot(school.random.forest)
## Important Variables in Order of Importance
## Level, Parent-Teacher Conference, Open House, Urban, School Size
## Crime where student lives, Parent Volunteering
                                     