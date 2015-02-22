setwd("~/Data/R/Coursera/03_GetCleanData_Project")

### Required packages
require(data.table)
require(reshape2)
require(lubridate)
require(plyr)

### Read "Test" dataset (X_test.txt) and save onto workspace as a data.table
### First two lines of code determine column classes from an initial reading of first 50 rows
### This procedure is aimed to (marginally) improve read.table times for this large dataset
initial <- read.table("./Dataset/test/X_test.txt")
classes <- sapply(initial, class)
testset <- data.table(read.table("./Dataset/test/X_test.txt", 
                                 colClasses = classes, comment.char = ""))
rm("initial")
rm("classes")

### Read "Test" activity labels (y_test.txt) and subject labels (subject_test.txt)
### Column classes procedure not carried out here since both tables are relatively small
testactlabs <- data.table(read.table("./Dataset/test/y_test.txt", comment.char = ""))
testsublabs <- data.table(read.table("./Dataset/test/subject_test.txt", comment.char = ""))

### Read variable names (features.txt)
varnames <- data.table(read.table("./Dataset/features.txt", comment.char = ""))

### Set column names for testset
setnames(testset, as.character(varnames[,V2]))

### Append the activity and subject label columns into testset
### Create new label, set = "test", to denote this data as Test data
testset <- mutate(testset, subject = testsublabs$V1, 
                  activity = testactlabs$V1,
                  set = "test")

### Read "Training" dataset (X_train.txt) and save onto workspace as a data.table
### First two lines of code determine column classes from an initial reading of first 50 rows
### This procedure is aimed to (marginally) improve read.table times for this large dataset
initial <- read.table("./Dataset/train/X_train.txt", nrows = 50)
classes <- sapply(initial, class)
trainset <- data.table(read.table("./Dataset/train/X_train.txt", 
                                  colClasses = classes, nrows = 7400, comment.char = ""))
rm("initial")
rm("classes")

### Read "Training" activity labels (y_train.txt) and subject labels (subject_train.txt)
### Column classes procedure not carried out here since both tables are relatively small
trainactlabs <- data.table(read.table("./Dataset/train/y_train.txt"))
trainsublabs <- data.table(read.table("./Dataset/train/subject_train.txt"))

### Set column names for trainset
setnames(trainset, as.character(varnames[,V2]))

### Append the activity and subject label columns into trainset
### Create new label, set = "train", to denote this as Training data
trainset <- mutate(trainset, subject = trainsublabs$V1, 
                   activity = trainactlabs$V1,
                   set = "train")
rm("testsublabs")
rm("testactlabs")
rm("trainsublabs")
rm("trainactlabs")
rm("varnames")

### Sort each set by subject and activity
testset <- arrange(testset, subject, activity)
trainset <- arrange(trainset, subject, activity)

### Merge testset and trainset using join with type = "full"
mergeset <- join(testset, trainset, by = "subject", type = "full")

rm("testset")
rm("trainset")

### Create a vector of variables which are "mean()" and "std()" type measurements
meanstd <- colnames(mergeset)[grep("(.*)(mean|std)[(](.*)", colnames(mergeset))]

### Add subject and activity to above variable list
meanstd <- c("subject", "activity", meanstd)

### Create truncated dataset with only mean() and std() variables
shortmerge <- mergeset[meanstd]

rm("mergeset")
rm("meanstd")

### Edit variable names to meet requirements of tidy data
### Lines 1 and 2 removes "()" from variable names and replaces 
### with Mean and Stddev which are more descriptive
### Line 3 removes "-" from variable names
colnames(shortmerge) <- gsub("mean[(][)]", "Mean", colnames(shortmerge))
colnames(shortmerge) <- gsub("std[(][)]", "Stddev", colnames(shortmerge))
colnames(shortmerge) <- gsub("-", "", colnames(shortmerge))

### Sort shortmerge data by activity and subject
shortmerge <- arrange(shortmerge, activity, subject)

### Read activity names from "activity_lables.txt"
activitynames <- read.table("./Dataset/activity_labels.txt", stringsAsFactors = FALSE)

### Edits activity names to meet tidy data requirements
### by removing "-" and changing to lower-case
activitynames <- tolower(gsub("_", "", activitynames$V2))

### Loop replaces activity labels in the shortmerge data
### with corresponding string values
for(i in 1:nrow(shortmerge)) {
      for(j in 1:length(activitynames)) {
            if(shortmerge$activity[i] == j) {
                  shortmerge$activity[i] <- activitynames[j]
            }
      }
}

rm("activitynames")

### Create vector of variables for which we will compute the means of
### Basically, a vector of all measure variables which 
### excludes the subject and activity columns
measures <- names(shortmerge)[3:68]

### Melt shortmerge data and declares subject and activity as id variables
### and all other variables as measure variables
melted <- melt(shortmerge, id.vars = c("subject", "activity"), 
               measure.vars = measures)

### Create tidy dataset of means of measure variables using dcast on melted data
tidy <- dcast(melted, subject + activity ~ variable, mean)

rm("measures")
rm("melted")
rm("shortmerge")

### Write tidy dataset as a .txt file as required for submission
write.table(tidy, file = "./tidydata.txt",  row.names = FALSE)