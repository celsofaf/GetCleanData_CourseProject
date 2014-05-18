Code Book for Getting and Cleaning Data - Course Project
========================================================
  
### Dataset description and cleaning
  
All original data were extracted to the `./data/UCI HAR Dataset` folder, relative to the working directory of the analysis. All of the steps described below were run by the `run_analisys.R` script, as instructed by ReadMe.  

The test and train sets for the activities were merged. I chose to leave the inertial signals data out, and only use the calculated data for the features (contained in the `X_train.txt` and `X_test.txt` files).  
  
The `X` files contain data for 561 features (one in each column), where each row represents an individual and an activity (they may be repeated). The `subject_test.txt` and `subject_train.txt` files contain the same number of rows of the corresponding `X` file, each row containing one column meaning the ID for the subject which undertook an activity. Along the same lines, the `y_test.txt` and `y_train.txt` files contain the ID for the corresponding activity. The `activity_labels.txt` file matches the activity ID with the activity name, and the `features.txt` file matches the 561 features columns with their names.  

The test and train data were then all merged, and a dataset with 10299 rows containing the subjects ID, activity names and the features together was created. Then, I begun my analysis. I picked from my data only the features with mean and standard deviation measures, and only the time-domain features (so, the frequency-domain ones were left out). This left me with only 40 features. Hifens and parenthesis were stripped out from their names.  
  
The last step was to take the average of each measure for each subject and activity. The resulting dataset, containing 42 variables (columns) and 180 observations (rows), is saved in the `averages.txt` file.  
  
### Variable descriptions  
  
All variables here refer to variables found on the `averages.txt` file, which is actualy comma-separated.  
  
The first two variables define "who did what":  
  
**subject** - The ID for the tested subject  
**activity** - The name for the considered activity  

The other 40 variables are the average, with respect to time, of the measures taken of each individual (subject) for each activity. They are normalized within the [-1, 1] range.  
  
**tBodyAccMeanX** - Mean of body acceleration, X-axis  
**tBodyAccMeanY** - Mean of body acceleration, Y-axis  
**tBodyAccMeanZ** - Mean of body acceleration, Z-axis  
**tBodyAccStdX** - Standard deviation of body acceleration, X-axis  
**tBodyAccStdY** - Standard deviation of body acceleration, Y-axis  
**tBodyAccStdZ** - Standard deviation of body acceleration, Z-axis  
**tGravityAccMeanX** - Mean of gravity acceleration, X-axis  
**tGravityAccMeanY** - Mean of gravity acceleration, Y-axis  
**tGravityAccMeanZ** - Mean of gravity acceleration, Z-axis  
**tGravityAccStdX** - Standard deviation of gravity acceleration, X-axis  
**tGravityAccStdY** - Standard deviation of gravity acceleration, Y-axis  
**tGravityAccStdZ** - Standard deviation of gravity acceleration, Z-axis  
**tBodyAccJerkMeanX** - Mean of Jerk signals for body acceleration, X-axis  
**tBodyAccJerkMeanY** - Mean of Jerk signals for body acceleration, Y-axis  
**tBodyAccJerkMeanZ** - Mean of Jerk signals for body acceleration, Z-axis  
**tBodyAccJerkStdX** - Standard deviation of Jerk signals for body acceleration, X-axis  
**tBodyAccJerkStdY** - Standard deviation of Jerk signals for body acceleration, Y-axis  
**tBodyAccJerkStdZ** - Standard deviation of Jerk signals for body acceleration, Z-axis  
**tBodyGyroMeanX** - Mean of body angular velocity, X-axis  
**tBodyGyroMeanY** - Mean of body angular velocity, Y-axis  
**tBodyGyroMeanZ** - Mean of body angular velocity, Z-axis  
**tBodyGyroStdX** - Standard deviation of body angular velocity, X-axis  
**tBodyGyroStdY** - Standard deviation of body angular velocity, Y-axis  
**tBodyGyroStdZ** - Standard deviation of body angular velocity, Z-axis  
**tBodyGyroJerkMeanX** - Mean of Jerk signals for body angular velocity, X-axis  
**tBodyGyroJerkMeanY** - Mean of Jerk signals for body angular velocity, Y-axis  
**tBodyGyroJerkMeanZ** - Mean of Jerk signals for body angular velocity, Z-axis  
**tBodyGyroJerkStdX** - Standard deviation of Jerk signals for body angular velocity, X-axis  
**tBodyGyroJerkStdY** - Standard deviation of Jerk signals for body angular velocity, Y-axis  
**tBodyGyroJerkStdZ** - Standard deviation of Jerk signals for body angular velocity, Z-axis  
**tBodyAccMagMean** - Mean of the magnitude of body acceleration  
**tBodyAccMagStd** - Standard deviation of the magnitude of body acceleration  
**tGravityAccMagMean** - Mean of the magnitude of gravity acceleration  
**tGravityAccMagStd** - Standard deviation of the magnitude of gravity acceleration  
**tBodyAccJerkMagMean** - Mean of Jerk signals for the magnitude of body acceleration  
**tBodyAccJerkMagStd** - Standard deviation of Jerk signals for the magnitude of body acceleration  
**tBodyGyroMagMean** - Mean of the magnitude of body angular velocity  
**tBodyGyroMagStd** - Standard deviation of the magnitude of body angular velocity  
**tBodyGyroJerkMagMean** - Mean of Jerk signals for the magnitude of body angular velocity  
**tBodyGyroJerkMagStd** - Standard deviation of Jerk signals for the magnitude of body angular velocity  