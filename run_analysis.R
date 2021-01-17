library(dplyr)
library(tidyr)


## STEP 1

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",sep="")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",sep="")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt",sep="")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",sep="")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt",sep="")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",sep="")

features <- read.table("UCI HAR Dataset/features.txt",sep="")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",sep="")

names(subject_test)[1] <- "Subject"
names(subject_train)[1] <- "Subject"
names(y_test)[1] <- "Activity"
names(y_train)[1] <- "Activity"
names(features)[1] <- "F1"
names(features)[2] <- "F2"

test_dataframe <- data.frame(subject_test, y_test, X_test)
train_dataframe <- data.frame(subject_train, y_train, X_train)

merged_dataset <- rbind(test_dataframe, train_dataframe)

## STEP 2
feature <- grepl(c("mean|std"), features[,2])
s <- sum(feature)
count <- 3
d <- dim(merged_dataset)
## ext_data is extracted data
ext_data <- matrix(,d[1],s+2)
ext_data[,1] <- merged_dataset[,1]
ext_data[,2] <- merged_dataset[,2]
for (i in 3:d[2]){
        if (feature[i-2] == TRUE){
                ext_data[,count] <- merged_dataset[,i]
                count <- count + 1
        }
}
ext_data <- as.data.frame(ext_data)

## STEP 3
for (i in 1:d[1]){
        if (merged_dataset[i,2] == 1){merged_dataset[i,2] = activity_labels[1,2]}
        else if (merged_dataset[i,2] == 2){merged_dataset[i,2] = activity_labels[2,2]}
        else if (merged_dataset[i,2] == 3){merged_dataset[i,2] = activity_labels[3,2]}
        else if (merged_dataset[i,2] == 4){merged_dataset[i,2] = activity_labels[4,2]}
        else if (merged_dataset[i,2] == 5){merged_dataset[i,2] = activity_labels[5,2]}
        else {merged_dataset[i,2] = activity_labels[6,2]}
}

## STEP 4
for (i in 3:d[2]){
        colnames(merged_dataset)[i] <- features[i-2,2]
}
names(merged_dataset) <- make.names(names=names(merged_dataset), unique=TRUE, allow_ = TRUE)

## STEP 5
result <-
        merged_dataset %>%
        arrange(Subject, Activity) %>%
        group_by(Subject, Activity) %>%
        summarise(across(.fns=mean))

write.table(result, file = "result.txt", sep = ",", row.names = FALSE)

        