##README for run_analysis.R
Prepared by J.X. Hansel Teo

---------------------------------------------------------------------
---------------------------------------------------------------------

###Overview

run_analysis.R is a script to be applied to the Human Activity Recognition Using Smartphones Dataset
The raw data is presumed to be saved in the working directory under the subdirectory "~/UCI HAR Dataset", with "Test" and "Training" datasets found in the subdirectories "~/UCI HAR Dataset/test" and "~/UCI HAR Dataset/train" respectively.
This corresponds to copying the contents of the "UCI HAR Dataset" into your working directory.

In accordance with the project brief, run_analysis.R performs the following in order:

1.	Merge the "Training" and "Test" dataset

2.	Extracts only the variables reporting the mean and standard deviation of for each measurement

3.	Edits variable and activity names to meet tidy-data principles

4.	Computes the average of each variable in the shortlist for each activity and each subject and writes this into a tidy dataset "tidydata.txt"

Details regarding each step, as performed by the script, are found in the next section.

---------------------------------------------------------------------
---------------------------------------------------------------------

###Details on procedures in script

Packages required: data.table; reshape2; lubridate; plyr

####1.	Reading and Merging
The two datasets of interest for the project are the "Training" and "Test" data

For each dataset, measurement variables, activity labels and subject labels are found in separate .txt files.
Example:
For the "Training" data, measurement variables can be found in "~/Dataset/test/X_test.txt", activity labels in "~/Dataset/test/y_test.txt", and subject labels in "~/Dataset/test/subject_test.txt"

Variable names are found in a .txt file ("~/Dataset/features.txt") common to both datasets.

Data is read using read.table() and saved as data.tables as data tables.

For reading "X_test.txt" and "X_train.txt", an initial read procedure of the first 50 rows is carried out to determine the column classes so as to enable quicker read.table() when applied to the entire data file. (Procedure found in R Programming: Reading and Writing Data course slides)

Subject and activity labels are appended to the measurement variables using mutate() and variable names inputed using setnames().
A dataset identifier is created in each dataset such that set = "train" for all entries in the "Training" data and set = "test" for the "Test" data.

The resulting "Training" data is saved as trainset and "Test" data as testset.
Both datasets are sorted by 'subject' and 'activity' using arrange().

The two datasets are merged using join(, by = "subject", type = FULL), and the result is saved as mergeset
This merge procedure retains the columns (variables) from trainset/testset datasets and creates a separate row for each observation from trainset and testset. The resulting merged data is tall and slim and meets the tidy-data principles of having each variable in one column and each different observation in one row (where an observation refers to a measurement of one subject performing an activity in one dataset type).


####2.	Extract mean and standard deviation variables
We interpret the "mean and standard deviation for each measurement" as referring to feature variables from the data labeled with mean() and std(). This interpretation excludes variables such as 'fBodyAcc-meanFreq()-X', as based on our interpretation, this is a base measurement (mean frequency of linear body acceleration is measured) and not a mean of a measurement, which based on our definition should be something like 'fBodyAcc-meanFreq-mean()-X.

To obtain a vector of variables of interest, we apply grep() to the column names of mergeset and select variable names with mean() or std().
These variable names are saved in the vector meanstd.

The selected data is created by subsetting mergeset and the result saved as shortmerge.


####3.	Edits variable and activity names to meet tidy-data principles
The variable names in the shortmerge dataset are edited to meet the tidy-data principle of not having symbols "()" and dashes "-"
We have chosen to retain upper-case letters (as opposed to shifting entirely to lower-case) to improve (human) readability of variable names, as otherwise we will obtain long, unreadable strings like 'fbodybodygyrojerkmagmean' as variable names.
Editing of variable names is done using gsub() on the column names.

The activity labels, which were previously numeric (1-6) are replaced by descriptive character variables using a nested for-loop which matches the 'activity' variable values in shortmerge with the descriptive activity labels (walking, walkingupstairs, walkingdownstairs, sitting, standing, laying) found in "./Dataset/activity_labels.txt". These labels are similarly edited to meet tidy-data principles (no underscores, all lower-case).


####4.	Computes the average of each variable in the shortlist for each activity and each subject.
The tidy dataset of computed averages is created using a two-step melt and cast procedure.

shortmerge is melted with 'subject' and 'activity' declared as identifier variables and the rest as measurement variables.
The final dataset, tidy, is then created by applying dcast on the melted data and returning the mean of the measurement variables.
The final dataset, tidy, is tall and slim (180 rows, 68 columns), has each column corresponding to a separate variable and each row corresponding to a separate observation (where an observation is the average computed for each subject and activity) and hence satisfies the tidy-data principles.

This dataset is saved as a .txt via write.table(, rownames = FALSE) as tidydata.txt for submission.

---------------------------------------------------------------------
---------------------------------------------------------------------


