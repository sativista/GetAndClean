library(data.table)

source("cleanSpaces.R")

setwd("OriginalDataset")

# Load activity descriptions; should be 6 by 2.
activities <- fread("activity_labels.txt", sep=" ", header=F)

# Load feature names; should be 561 by 2.
features <- fread("features.txt", sep=" ", header=F)

setwd("test")
cleanSpaces("X_test.txt", "X_test_cleaned.txt")
test.subjects <- fread("subject_test.txt", sep="\n", header=F,)
test.x <- fread("X_test_cleaned.txt", sep=" ", header=F)
test.y <- fread("y_test.txt", sep="\n", header=F)

setwd("../train")
cleanSpaces("X_train.txt", "X_train_cleaned.txt")
train.subjects <- fread("subject_train.txt", sep="\n", header=F,)
train.x <- fread("X_train_cleaned.txt", sep=" ", header=F)
train.y <- fread("y_train.txt", sep="\n", header=F)

setwd("../..")

# Add meaningful feature names.
setnames(activities, c("activity-id", "activity-name"))
setnames(features, c("id", "name"))
setnames(test.subjects, c("subject"))
setnames(train.subjects, c("subject"))
setnames(test.x, features$name)
setnames(train.x, features$name)
setnames(test.y, c("activity-id"))
setnames(train.y, c("activity-id"))


# Assemble the test and train data into a single data set.
tidy <- rbind(
  cbind(test.subjects, test.y, test.x),
  cbind(train.subjects, train.y, train.x))

rm(test.subjects, test.y, test.x, train.subjects, train.y, train.x)


# Select the mean and standard deviation features while preserving the subject and activity-id.
selectedFeatures <- features[grep("std\\(\\)|mean\\(\\)", features$name, ignore.case=T),]$name
tidy <- subset(tidy, T, c("subject", "activity-id", selectedFeatures))


# Define keys and merge in the activity names.
setkey(activities, "activity-id")
setkey(tidy, "subject", "activity-id")
tidy <- merge(tidy, activities)


# Reorder the features to be more pleasing and redefine the keys for the final tidy data set.
tidy <- subset(tidy, T, c("subject", "activity-name", selectedFeatures))
setkey(tidy, "subject", "activity-name")


# Save the tidy data set.
tidyFileName <- "tidy-Dataset.txt"
write.table(tidy, file=tidyFileName, sep=",", col.names=T, row.names=F, quote=F)


# Compute means grouped by subject and activity-name, then save this data too.
tidy.means <- tidy[, lapply(.SD, mean), by=key(tidy)]
tidyMeansFileName <- "tidy-means-Dataset.txt"
write.table(tidy.means, file=tidyMeansFileName, sep=",", col.names=T, row.names=F, quote=F)

rm(tidyFileName, tidyMeansFileName)
