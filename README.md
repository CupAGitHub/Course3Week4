getAccelerometerData function reads the training and test data sets, pulls out the mean and stdev columns and the merges them.

getActivityDataFrame function takes a frame returned from getAccelerometerData transposes the columns to rows and creates averages for each activity.

getSubjectDataFrame function takes a frame returned from getAccelerometerData transposes the columns to rows and creates averages for each subject.

getConsolidatedDataSet calls both getActivityDataFrame and getSubjectDataFrame to create a list of the two data frames.
