rev.school <- school[, c("SCHID", "C0196","C0198", "C0200",
                         "C0202", "C0204", "C0194", "C0560",
                         "C0562", "FR_LVEL", "FR_SIZE", "FR_URBAN",
                         "INVASIVE")]
View(rev.school)
write.csv(rev.school, "rev.school.csv")
str(rev.school)
rev.school$INVASIVE <- as.factor(rev.school$INVASIVE)
rev.school$C0204 <- as.factor(rev.school$C0204)
rev.school$C0194 <- as.factor(rev.school$C0194)
rev.school$FR_URBAN <- as.factor(rev.school$FR_URBAN)
rev.school$C0562 <- as.factor(rev.school$C0562)
rev.school$C0560 <- as.factor(rev.school$C0560)
rev.school$FR_LVEL <- as.factor(rev.school$FR_LVEL)
rev.school$C0196 <- as.factor(rev.school$C0196)
rev.school$C0198 <- as.factor(rev.school$C0198)
rev.school$C0200 <- as.factor(rev.school$C0200)
rev.school$C0202 <- as.factor(rev.school$C0202)
rev.school$FR_SIZE <- as.factor(rev.school$FR_SIZE)
str(rev.school)
rev.mod_school3 <- glm(INVASIVE ~ C0196 + C0198 + C0200 + C0202 +
                     C0202 + C0204 + C0194 + C0560 +
                     C0562 +
                     FR_LVEL +
                     FR_SIZE +
                     FR_URBAN,
                   data = rev.school, family = "binomial")
summary(rev.mod_school3)
table(rev.school$INVASIVE)
## 1202 schools using some form of invasive methods of security vs 1358 not using these methods
