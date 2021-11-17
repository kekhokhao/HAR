# read file txt in R done
# Merges the training and the test sets to create one data set
# Merges X_train, y_train, X_test, y_test:
merge_X <- rbind(X_train, X_test)
merge_y <- rbind(y_train, y_test)
merge_subject <- rbind(subject_train, subject_test)
names(merge_y) <- "activity"
names(merge_subject) <- "subject"
data <- cbind(merge_X, merge_y, merge_subject)


# Extracts only the measurements on the mean and standard deviation for each measurement.
library(dplyr)
pos <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,
         424:429,503,504,516,517,529,530,542,543)
data1 <- select(data,pos)


# Uses descriptive activity names to name the activities in the data set
data1[,67][data1[,67] == 1] = "walking"
data1[,67][data1[,67] == 2] = "walking_upstairs"
data1[,67][data1[,67] == 3] = "walking_downstairs"
data1[,67][data1[,67] == 4] = "sitting"
data1[,67][data1[,67] == 5] = "landing"
data1[,67][data1[,67] == 6] = "laying"
# Appropriately labels the data set with descriptive variable names.
names(data1) <- c("tBAmeanX", "tBAmeanY", "tBAmeanZ", "tBAstdX", "tBAstdY", "tBAstdZ",
                 "tGAmeanX", "tGAmeanY", "tGAmeanZ", "tGAstdX", "tGAstdY", "tGAstdZ",
                 "tBAJmeanX", "tBAJmeanY", "tBAJmeanZ", "tBAJstdX", "tBAJstdY", "tBAJstdZ",
                 "tBGmeanX", "tBGmeanY", "tBGmeanZ", "tBGstdX", "tBGstdY", "tBGstdZ",
                 "tBGJmeanX", "tBGJmeanY", "tBGJmeanZ", "tBGJstdX", "tBGJstdY", "tBGJstdZ",
                 "tBAMmean", "tBAMstd", "tGAMmean", "tGAMstd","tBAJMmean", "tBAJMstd","tBGMmean","tBGMstd","tBGJMmean", "tBGJMstd", 
                 "fBAmeanX", "fBAmeanY", "fBAmeanZ", "fBAstdX", "fBAstdY", "fBAstdZ",
                 "fBAJmeanX", "fBAJmeanY", "fBAJmeanZ", "fBAJstdX", "fBAJstdY", "fBAJstdZ",
                 "fBGmeanX", "fBGmeanY", "fBGmeanZ", "fBGstdX", "fBGstdY", "fBGstdZ",
                 "fBAMmean", "fBAMstd", "fBAJMmean", "fBAJMstd",
                 "fBGMmean", "fBGMstd", "fBGJMmean", "fBGJMstd", "activity", "subject")
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
second_data <- data1 %>%
  group_by(activity, subject) %>%
  summarise_all("mean")