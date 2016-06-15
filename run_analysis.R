

getAccelerometerData <- function() {
  activityColumn = "Activity"
  subjectColumn = "Subject"
  columns <- read.table("./UCIHARDataset/features.txt")
  
  train.data <- read.table("./UCIHARDataset/train/X_train.txt")
  colnames(train.data) =columns$V2
  interesting.train <- subset(train.data, select=grep("mean..$|std..$", colnames(train.data)))
  names(interesting.train) <- gsub("-", " ", names(interesting.train))
  names(interesting.train) <- gsub("\\(\\)", "", names(interesting.train))
  train.activity <- read.table("./UCIHARDataset/train/y_train.txt")  
  colnames(train.activity) = c(activityColumn)
  train.subject <- read.table("./UCIHARDataset/train/subject_train.txt")
  colnames(train.subject) = c(subjectColumn)
  train <- cbind(train.subject, train.activity, interesting.train)
  
  test.data <- read.table("./UCIHARDataset/test/X_test.txt")
  colnames(test.data) = columns$V2
  interesting.test <- subset(test.data, select=grep("mean..$|std..$", colnames(test.data)))
  names(interesting.test) <- gsub("-", " ", names(interesting.test))
  names(interesting.test) <- gsub("\\(\\)", "", names(interesting.test))
  test.activity <- read.table("./UCIHARDataset/test/y_test.txt")  
  colnames(test.activity) = c(activityColumn)
  test.subject <- read.table("./UCIHARDataset/test/subject_test.txt")
  colnames(test.subject) = c(subjectColumn)
  test <- cbind(test.subject, test.activity, interesting.test)
  
  dF <- rbind(train, test)
  
  activities <- read.table("./UCIHARDataset/activity_labels.txt")
  cols <- c("Activity")
  dF[,cols] <- data.frame(apply(dF[cols], 2, as.factor))
  levels(dF$Activity) <- activities$V2
  
  returnValue(dF)
}

getSetTwo <- function(inputFrame) {
  returnValue(ddply(inputFrame,.(Subject, Activity),numcolwise(mean)))
}