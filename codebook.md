##Codebook for tidydata.txt dataset
Codebook prepared by J.X. Hansel Teo

Original data from Human Activity Recognition Using Smartphones Dataset (Version 1.0)
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

---------------------------------------------------------------------
---------------------------------------------------------------------

###Overview
The tidydata.txt dataset consists of 180 observations of 68 variables (180 rows 68 columns).

The variables 'subject' and 'activity' are identifying labels, where 'subject' is the unique identifier for each of the 30 experiment subjects,
and 'activity' is the identifier for the type of activity performed by subjects.

All other variables are the averages of the underlying "feature" measurement variables computed for each activity and each subject.
All underlying "feature" variables are normalized and bounded within [-1,1], hence all averages reported in the present data are bounded as well.

Details of the underlying measurements can be found at the end of this codebook

---------------------------------------------------------------------
---------------------------------------------------------------------

The codebook entries are formatted as follows:
#	variable					(Variable class)
	description

---------------------------------------------------------------------
---------------------------------------------------------------------

###Variables

1	subject					(Integer)
	Subject label. Possible values 1-30
	
2	activity					(Character)
	Activity type Possible values: walking; walkingupstairs; walkingdownstairs; sitting; standing; laying
		
3	tBodyAccMeanX			(Numeric)
	Average of time-domain mean linear body acceleration in x-axis
		
4	tBodyAccMeanY			(Numeric)
	Average of time-domain mean linear body acceleration in y-axis
		
5 	tBodyAccMeanZ			(Numeric)
	Average of time-domain mean linear body acceleration in z-axis
	
6 	tBodyAccStddevX			(Numeric)
	Average time-domain standard deviation of linear body acceleration in x-axis 
	
7 	tBodyAccStddevY			(Numeric)
	Average time-domain standard deviation of linear body acceleration in y-axis
	 
8	tBodyAccStddevZ			(Numeric)
	Average time-domain standard deviation of linear body acceleration in z-axis
	 
9	tGravityAccMeanX			(Numeric)
	Average of time-domain mean linear gravity acceleration in x-axis
	
10	tGravityAccMeanY			(Numeric)
	Average of time-domain mean linear gravity acceleration in y-axis
	
11 	tGravityAccMeanZ			(Numeric)
	Average of time-domain mean linear gravity acceleration in z-axis
	
12 	tGravityAccStddevX			(Numeric)
	Average time-domain standard deviation of gravity body acceleration in x-axis 
	
13 	tGravityAccStddevY			(Numeric)
	Average time-domain standard deviation of gravity body acceleration in y-axis 
	
14	tGravityAccStddevZ			(Numeric)
	Average time-domain standard deviation of gravity body acceleration in z-axis
	 
15	tBodyAccJerkMeanX			(Numeric)
	Average of time-domain mean linear body acceleration jerk signals in x-axis
	
16	tBodyAccJerkMeanY			(Numeric)
	Average of time-domain mean linear body acceleration jerk signals in y-axis
	
17	tBodyAccJerkMeanZ			(Numeric)
	Average of time-domain mean linear body acceleration jerk signals in z-axis

18 	tBodyAccJerkStddevX		(Numeric)
	Average time-domain standard deviation of linear body acceleration jerk signals in x-axis 
	
19 	tBodyAccJerkStddevY		(Numeric)
	Average time-domain standard deviation of linear body acceleration jerk signals in y-axis

20	tBodyAccJerkStddevZ		(Numeric)
	Average time-domain standard deviation of linear body acceleration jerk signals in z-axis

21 	tBodyGyroMeanX			(Numeric)
	Average of time-domain mean body angular velocity in x-axis
	
22 	tBodyGyroMeanY			(Numeric)
	Average of time-domain mean body angular velocity in y-axis
	
23	tBodyGyroMeanZ			(Numeric)
	Average of time-domain mean body angular velocity in z-axis
	
24 	tBodyGyroStddevX			(Numeric)
	Average time-domain standard deviation of body angular velocity in x-axis
	
25 	tBodyGyroStddevY			(Numeric)
	Average time-domain standard deviation of body angular velocity in y-axis
	
26 	tBodyGyroStddevZ			(Numeric)
	Average time-domain standard deviation of body angular velocity in z-axis

27 	tBodyGyroJerkMeanX		(Numeric)
	Average of time-domain mean body angular velocity jerk signals in x-axis

28 	tBodyGyroJerkMeanY		(Numeric)
	Average of time-domain mean body angular velocity jerk signals in y-axis

29 	tBodyGyroJerkMeanZ		(Numeric)
	Average of time-domain mean body angular velocity jerk signals in z-axis

30 	tBodyGyroJerkStddevX		(Numeric)
	Average time-domain standard deviation of body angular velocity jerk signals in x-axis 

31 	tBodyGyroJerkStddevY		(Numeric)
	Average time-domain standard deviation of body angular velocity jerk signals in y-axis

32 	tBodyGyroJerkStddevZ		(Numeric)
	Average time-domain standard deviation of body angular velocity jerk signals in z-axis

33 	tBodyAccMagMean			(Numeric)
	Average of time-domain mean linear body acceleration magnitude (Euclidean norm)

34 	tBodyAccMagStddev			(Numeric)
	Average time-domain standard deviation of linear body acceleration magnitude (Euclidean norm) 
	
35 	tGravityAccMagMean		(Numeric)
	Average of time-domain mean linear gravity acceleration magnitude (Euclidean norm)
	
36 	tGravityAccMagStddev		(Numeric)
	Average time-domain standard deviation of linear gravity acceleration magnitude (Euclidean norm) 

37 	tBodyAccJerkMagMean		(Numeric)
	Average of time-domain mean linear body acceleration jerk signal magnitude (Euclidean norm)
	
38 	tBodyAccJerkMagStddev		(Numeric)
	Average time-domain standard deviation of linear body acceleration jerk signal magnitude (Euclidean norm)
	
39 	tBodyGyroMagMean			(Numeric)
	Average of time-domain mean body angular velocity magnitude (Euclidean norm)

40 	tBodyGyroMagStddev		(Numeric)
	Average time-domain standard deviation of body angular velocity magnitude (Euclidean norm)
	
41 	tBodyGyroJerkMagMean		(Numeric)
	Average of time-domain mean body angular velocity jerk signal magnitude (Euclidean norm)

42 	tBodyGyroJerkMagStddev		(Numeric)
	Average time-domain standard deviation of body angular velocity jerk signal magnitude (Euclidean norm)

43 	fBodyAccMeanX			(Numeric)
	Average of frequency-domain mean linear body acceleration in x-axis
	
44 	fBodyAccMeanY			(Numeric)
	Average of frequency-domain mean linear body acceleration in y-axis

45	fBodyAccMeanZ			(Numeric)
	Average of frequency-domain mean linear body acceleration in z-axis
	
46 	fBodyAccStddevX			(Numeric)
	Average frequency-domain standard deviation of linear body acceleration in x-axis
	
47 	fBodyAccStddevY			(Numeric)
	Average frequency-domain standard deviation of linear body acceleration in y-axis

48 	fBodyAccStddevZ			(Numeric)
	Average frequency-domain standard deviation of linear body acceleration in z-axis
	
49 	fBodyAccJerkMeanX			(Numeric)
	Average of frequency-domain mean linear body acceleration jerk signals in x-axis
	
50 	fBodyAccJerkMeanY			(Numeric)
	Average of frequency-domain mean linear body acceleration jerk signals in y-axis
	
51 	fBodyAccJerkMeanZ			(Numeric)
	Average of frequency-domain mean linear body acceleration jerk signals in z-axis
	
52 	fBodyAccJerkStddevX		(Numeric)
	Average frequency-domain standard deviation of linear body acceleration jerk signals in x-axis
	
53 	fBodyAccJerkStddevY		(Numeric)
	Average frequency-domain standard deviation of linear body acceleration jerk signals in y-axis
	
54 	fBodyAccJerkStddevZ		(Numeric)
	Average frequency-domain standard deviation of linear body acceleration jerk signals in z-axis
	
55 	fBodyGyroMeanX			(Numeric)
	Average of frequency-domain mean body angular velocity in x-axis
	
56 	fBodyGyroMeanY			(Numeric)
	Average of frequency-domain mean body angular velocity in y-axis
	
57 	fBodyGyroMeanZ			(Numeric)
	Average of frequency-domain mean body angular velocity in z-axis
	
58 	fBodyGyroStddevX			(Numeric)
	Average frequency-domain standard deviation of body angular velocity in x-axis
	
59 	fBodyGyroStddevY			(Numeric)
	Average frequency-domain standard deviation of body angular velocity in y-axis
	
60 	fBodyGyroStddevZ			(Numeric)
	Average frequency-domain standard deviation of body angular velocity in z-axis
	
61	fBodyAccMagMean			(Numeric)
	Average of frequency-domain mean linear body acceleration magnitude (Euclidean norm)
				
62 	fBodyAccMagStddev			(Numeric)
	Average frequency-domain standard deviation of linear body acceleration magnitude (Euclidean norm)
	
63	fBodyBodyAccJerkMagMean	(Numeric)
	Average of frequency-domain mean linear body acceleration jerk signal magnitude (Euclidean norm)

64 	fBodyBodyAccJerkMagStddev	(Numeric)
	Average frequency-domain standard deviation of linear body acceleration jerk signal magnitude (Euclidean norm)
	
65 	fBodyBodyGyroMagMean		(Numeric)
	Average of frequency-domain mean body angular velocity magnitude (Euclidean norm)
	
66 	fBodyBodyGyroMagStddev	(Numeric)
	Average frequency-domain standard deviation of body angular velocity magnitude (Euclidean norm)
	
67 	fBodyBodyGyroJerkMagMean	(Numeric)
	Average of frequency-domain mean body angular velocity jerk signal magnitude (Euclidean norm)

68 	fBodyBodyGyroJerkMagStddev	(Numeric)
	Average frequency-domain standard deviation of body angular velocity jerk signal magnitude (Euclidean norm)
	
---------------------------------------------------------------------
---------------------------------------------------------------------

###Appendix (extracted from features_info.txt)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.