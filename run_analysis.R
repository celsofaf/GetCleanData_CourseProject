# Basic loading of data

dataFolder <- "./data/UCI HAR Dataset/"
activityLabels <- read.table(paste0(dataFolder, "activity_labels.txt"), sep=" ",
                             stringsAsFactors=FALSE)
colnames(activityLabels) <- c("ActivityID", "ActivityName")
activityLabels$ActivityName <- gsub("_", " ", activityLabels$ActivityName)
data <- list()
for ( dir in c("test", "train") ) {
    folder <- paste0(dataFolder, dir)
    data$subject <- rbind(data$subject, read.table(paste0(folder, "/subject_",
                                                          dir, ".txt")))
    data$activity <- rbind(data$activity, read.table(paste0(folder, "/y_", dir,
                                                            ".txt")))
    data$X <- rbind(data$X, read.table(paste0(folder, "/X_", dir, ".txt")))
}
data$feature <- read.table(paste0(dataFolder, "features.txt"),
                            stringsAsFactors=FALSE)
names(data$X) <- data$feature[, 2]
names(data$subject) <- "SubjectID"
names(data$feature) <- c("FeatureID", "Feature")
activityNames <- c()  # initializing
for ( i in 1:nrow(data$activity))
    activityNames <- c(activityNames, activityLabels[data$activity[i, ], 2])
data$activity <- data.frame(data$activity, activityNames, stringsAsFactors=F)
names(data$activity) <- c("ActivityID", "ActivityName")
names(data)
str(data)


# Prepare the tidy dataset - we are nearly there!
# I just want the time features containing "mean()" or "std()"...

library(plyr)
features <- data$feature$Feature
featuresToGo <- grep("^t.+mean\\(\\)|^t.+std\\(\\)", features)
data <- data.frame(data$subject, data$activity$ActivityName,
                   data$X[, featuresToGo], stringsAsFactors=FALSE)
names(data)[c(1,2)] <- c("subject", "activity")
features <- features[featuresToGo]
features <- gsub("\\(|\\)|-", "", features)
features <- gsub("mean", "Mean", features)
features <- gsub("std", "Std", features)
names(data)[3:ncol(data)] <- features
averages <- ddply(data, .(subject, activity), numcolwise(mean))
write.csv(averages, "averages.txt", row.names=FALSE)
