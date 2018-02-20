# bind a few additional columns from original data set

new_school <- cbind(rev_school, school_safety[,c("C0190","C0284",
                                                 "C0288","C0308",
                                                 "SVINC08", "FR_CATMN")])
View(new_school)
## drop first column x1

new_school_data <- new_school[, -1]
View(new_school_data)
str(new_school_data)
new_school_data[,2:17] <- lapply(new_school_data[,2:17], as.factor)
write_csv(new_school_data, "new_school_data.csv")
str(school_safety)
#subset jacknife replicates from original set
school_weights <- school_safety[,201:414]
View(school_weights)
#bind weights to reduced data set
school_data <-cbind(new_school_data, school_weights)
View(school_data)
str(school_data)
write_csv(school_data, "school_data.csv")
