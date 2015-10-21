#Human Activity Recognition Using Smartphones Dataset
###Version 1.0

##Study design

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

###For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

###The dataset includes the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

###License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


###Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

##Units
All measurements and downstream calculated features are normalised within [-1, 1].

##Code Book - run_analysis.R

###Required packages:
- dplyr
- data.table

###Steps and summary operations:
- Merge the training and test sets for features (X), classes (y) and subjects.
- Use features.txt to name the feature data set's columns
- Use a function to rename any duplicate column by adding a numeric suffix ("_1", "_2" etc.) 
- Select only features that correspond to means and standard deviations of other features (selectSet). Note that the angle() variables are angles between mean vectors, but are not means themselves, therefore I chose not to include them. 
- Join classes (y) with the activity names (from activity_labels.txt) to get a readable column (activityName) corresponding to the activityLabel 's.
- Bind classes (and corresponding activityName 's) to the features table
- Bind the subject column to the selected data set
- Group the resulting table (summaryTbl) by activity then subject and calculate the mean for each group.
- Export the table to a summaryTbl.txt

###Variables retained and summarised in the analysis, and exported to summaryTbl.txt:
| Count | Variables | Variables                  |
|-------|-----------|----------------------------|
| [1] |"activityLabel"               |"activityName"               |               
| [3] |"tBodyAcc-mean()-X"           |"tBodyAcc-mean()-Y"          |
| [5] |"tBodyAcc-mean()-Z"           |"tGravityAcc-mean()-X"       |
| [7] |"tGravityAcc-mean()-Y"        |"tGravityAcc-mean()-Z"       |
| [9] |"tBodyAccJerk-mean()-X"       |"tBodyAccJerk-mean()-Y"      |
|[11] |"tBodyAccJerk-mean()-Z"       |"tBodyGyro-mean()-X"         |
|[13] |"tBodyGyro-mean()-Y"          |"tBodyGyro-mean()-Z"         |
|[15] |"tBodyGyroJerk-mean()-X"      |"tBodyGyroJerk-mean()-Y"     |
|[17] |"tBodyGyroJerk-mean()-Z"      |"tBodyAccMag-mean()"         |
|[19] |"tGravityAccMag-mean()"       |"tBodyAccJerkMag-mean()"     |
|[21] |"tBodyGyroMag-mean()"         |"tBodyGyroJerkMag-mean()"    |
|[23] |"fBodyAcc-mean()-X"           |"fBodyAcc-mean()-Y"          |
|[25] |"fBodyAcc-mean()-Z"           |"fBodyAccJerk-mean()-X"      |
|[27] |"fBodyAccJerk-mean()-Y"       |"fBodyAccJerk-mean()-Z"      |
|[29] |"fBodyGyro-mean()-X"          |"fBodyGyro-mean()-Y"         |
|[31] |"fBodyGyro-mean()-Z"          |"fBodyAccMag-mean()"         |
|[33] |"fBodyBodyAccJerkMag-mean()"  |"fBodyBodyGyroMag-mean()"    |
|[35] |"fBodyBodyGyroJerkMag-mean()" |"tBodyAcc-std()-X"           |
|[37] |"tBodyAcc-std()-Y"            |"tBodyAcc-std()-Z"           |
|[39] |"tGravityAcc-std()-X"         |"tGravityAcc-std()-Y"        |
|[41] |"tGravityAcc-std()-Z"         |"tBodyAccJerk-std()-X"       |
|[43] |"tBodyAccJerk-std()-Y"        |"tBodyAccJerk-std()-Z"       |
|[45] |"tBodyGyro-std()-X"           |"tBodyGyro-std()-Y"          |
|[47] |"tBodyGyro-std()-Z"           |"tBodyGyroJerk-std()-X"      |
|[49] |"tBodyGyroJerk-std()-Y"       |"tBodyGyroJerk-std()-Z"      |
|[51] |"tBodyAccMag-std()"           |"tGravityAccMag-std()"       |
|[53] |"tBodyAccJerkMag-std()"       |"tBodyGyroMag-std()"         |
|[55] |"tBodyGyroJerkMag-std()"      |"fBodyAcc-std()-X"           |
|[57] |"fBodyAcc-std()-Y"            |"fBodyAcc-std()-Z"           |
|[59] |"fBodyAccJerk-std()-X"        |"fBodyAccJerk-std()-Y"       |
|[61] |"fBodyAccJerk-std()-Z"        |"fBodyGyro-std()-X"          |
|[63] |"fBodyGyro-std()-Y"           |"fBodyGyro-std()-Z"          |
|[65] |"fBodyAccMag-std()"           |"fBodyBodyAccJerkMag-std()"  |
|[67] |"fBodyBodyGyroMag-std()"      |"fBodyBodyGyroJerkMag-std()" |

###Ad-hoc functions used in the script:
####loadFile(directory, fileName, class, numRows):
- Prepends the directory name to fileName (assumes the data files are in a subdirectory of the current working directory)
- Uses fread (from the data.table package) to read the data file.

####renameDuplicates(df):
Appends a numeric suffix ("_1", "_2" etc.) to duplicates column names in the dataframe df.
- Maps all unique names to a table with matching count (initially 0) (mapNames)
- Loops through the whole names vector (namesAll) and increments the unique name's count (in mapNames).
- If the count is greater than 1, appends a suffix to the name in the whole names vector (namesAll). The suffix depends on the count found for this name.
- Returns df modified with the new names vector.

###Internal variables:
- dir1, dir2: Character strings. Path names to the subdirectories containing the train and test datasets respectively.
- mainDir: Character string?. Path name to the subdirectory containing the feature names and activity labels.
- X_complete: Data frame. Intermediate variable used to collate the train and test datasets.
- features: Data frame. Used to load the list of features.
- varNames: Vector. Stores the list of features, to be assigned as X_complete's names vector.
- actNames: Data frame. Used to load the list of activity labels and their corresponding names.
- y_complete: Data frame. Intermediate variable used to collate the train and test classes, then joining them to actNames using activityLabel 's. The resulting columns are named activityLabel and activityName.
- selectSet: Data frame. A subset of X_complete containing only the columns refering to a mean or a standard deviation, and to which y_complete is then column-bound.
- summaryTbl: Data frame. Summary of selectSet, grouped by activity and subject, with means calculated for each group. This data frame is then exported to summaryTbl.txt.