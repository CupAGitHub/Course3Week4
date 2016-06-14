

getAccelerometerData <- function() {
  activityColumn = "Activity"
  subjectColumn = "Subject"
  columns <- read.table("./UCIHARDataset/features.txt")
  
  train.data <- read.table("./UCIHARDataset/train/X_train.txt")
  colnames(train.data) = columns$V2
  interesting.train <- subset(train.data, select=grep("mean..$|std..$", colnames(train.data)))
  train.activity <- read.table("./UCIHARDataset/train/y_train.txt")  
  colnames(train.activity) = c(activityColumn)
  train.subject <- read.table("./UCIHARDataset/train/subject_train.txt")
  colnames(train.subject) = c(subjectColumn)
  train <- cbind(train.subject, train.activity, interesting.train)
  
  test.data <- read.table("./UCIHARDataset/test/X_test.txt")
  colnames(test.data) = columns$V2
  interesting.test <- subset(test.data, select=grep("mean..$|std..$", colnames(test.data)))
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

getActivityDataFrame <- function(inputFrame) {
  #Input frame must have Activity column
  
  activities <- read.table("./UCIHARDataset/activity_labels.txt", stringsAsFactors=FALSE)
  
  dF = data.frame()
  for(rname in colnames(inputFrame)){
    if(rname == "Subject"){
      next
    }
    if(rname == "Activity"){
      next
    }
    dRow = vector()
    for(cname in activities$V2){
      dRow <- append(dRow, mean(inputFrame[rname][inputFrame$Activity == cname,]))
    }
    dF <- rbind(dF, dRow)
  }
  row.names(dF) <- colnames(inputFrame)[!(colnames(inputFrame) %in% c("Activity","Subject"))]
  colnames(dF) <- activities$V2
  returnValue(dF);
}

getSubjectDataFrame <- function(inputFrame) {
  #Input frame must have Subject column
  
  subjects <- sort(unique(inputFrame$Subject))
  
  dF = data.frame()
  for(rname in colnames(inputFrame)){
    if(rname == "Subject"){
      next
    }
    if(rname == "Activity"){
      next
    }
    dRow = vector()
    for(cname in subjects){
      dRow <- append(dRow, mean(inputFrame[rname][inputFrame$Subject == cname,]))
    }
    dF <- rbind(dF, dRow)
  }
  row.names(dF) <- colnames(inputFrame)[!(colnames(inputFrame) %in% c("Activity","Subject"))]
  colnames(dF) <- subjects
  returnValue(dF);
}

getConsolidatedDataSet <- function(inputFrame) {
  
  a <- getActivityDataFrame(inputFrame)
  b <- getSubjectDataFrame(inputFrame)
  
  output<-list(a,b)
  returnValue(output)
}

