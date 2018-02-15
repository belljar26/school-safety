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
write_csv(new_school_data, "new_school-data.csv")
