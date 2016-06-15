# Code book for class

## Data set variables. Data Set 1
Subject"                     
"Activity"                    
"tBodyAccMag mean"          
"tBodyAccMag std"          
"tGravityAccMag mean"       
"tGravityAccMag std"        
"tBodyAccJerkMag mean"      
"tBodyAccJerkMag std"      
"tBodyGyroMag mean"         
"tBodyGyroMag std"          
"tBodyGyroJerkMag mean"     
"tBodyGyroJerkMag std"     
"fBodyAccMag mean"          
"fBodyAccMag std"           
"fBodyBodyAccJerkMag mean"  
"fBodyBodyAccJerkMag std"  
"fBodyBodyGyroMag mean"     
"fBodyBodyGyroMag std"      
"fBodyBodyGyroJerkMag mean" 
"fBodyBodyGyroJerkMag std"

### Processing
Raw data has been tidied to remove unnecessary columns.  It has also been transformed to include the subject and activity per row.  Columns have been transformed to be more readable.

### Rows
Each row is one observation


## Data set 2 variables. Data Set 2 (the set uploaded as text file)
Subject"                     
"Activity"                    
"tBodyAccMag mean: Average"          
"tBodyAccMag std: Average"          
"tGravityAccMag mean: Average"       
"tGravityAccMag std: Average"        
"tBodyAccJerkMag mean: Average"      
"tBodyAccJerkMag std: Average"      
"tBodyGyroMag mean: Average"         
"tBodyGyroMag std: Average"          
"tBodyGyroJerkMag mean: Average"     
"tBodyGyroJerkMag std: Average"     
"fBodyAccMag mean: Average"          
"fBodyAccMag std: Average"           
"fBodyBodyAccJerkMag mean: Average"  
"fBodyBodyAccJerkMag std: Average"  
"fBodyBodyGyroMag mean: Average"     
"fBodyBodyGyroMag std: Average"      
"fBodyBodyGyroJerkMag mean: Average" 
"fBodyBodyGyroJerkMag std: Average"

### Processing
Averages have been calculated for measured variable.  The column names are tidied to explain that the values are averages

### Rows
Each row gives the averages for each combination of subject and activity
