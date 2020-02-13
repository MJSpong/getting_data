#read in a vector of variable names, and keep only those with 'mean' or 'std' 
# (i.e. standard deviation) in the name

features <- read.table("~/Desktop/UCI HAR Dataset/features.txt")
features <- features[grep("mean\\(|std",features[[2]]),2]

#create vector of activity names in the right order

act <- c("walking", "walking up", "walking down", "sitting", "standing", "laying")

# read in training data, select measurements on mean and standard deviation, 
# replace activity numbers with activity names, label the activity and subject 
# variables, put the columns together, convert to a table

X_train <- read.table("~/Desktop/UCI HAR Dataset/train/X_train.txt") #7352 x 561 
y_train <- read.table("~/Desktop/UCI HAR Dataset/train/y_train.txt") #7352 x 1
subject_train <- read.table("~/Desktop/UCI HAR Dataset/train/subject_train.txt") #7352 x 1
X_train <- select(X_train, features) 
y_train <- mutate(y_train, activity = act[V1], V1 = NULL)
subject_train <- rename(subject_train, subject = V1)
train_data <- cbind(y_train, subject_train, X_train)
train_data <- tbl_df(train_data)

# do the same thing, but now with the test data 

X_test <- read.table("~/Desktop/UCI HAR Dataset/test/X_test.txt") #2947 x 561
y_test <- read.table("~/Desktop/UCI HAR Dataset/test/y_test.txt") #2947 x 1
subject_test <- read.table("~/Desktop/UCI HAR Dataset/test/subject_test.txt") #2947 x 1
X_test <- select(X_test,features)
y_test <- mutate(y_test, activity = act[V1], V1 = NULL)
subject_test <- rename(subject_test, subject = V1)
test_data <- cbind(y_test, subject_test, X_test)
test_data <- tbl_df(test_data)

# merge the training and test data sets vertically, give variables descriptive names

data <- rbind(train_data, test_data)
names(data)[3:68] <- as.character(features)

# group dataset by activity and subject, then produce a second dataset with the 
# averages of each variable for each activity and subject

data <- group_by(data, activity, subject)
averaged_data <- summarise_all(data, mean)
write.table(averaged_data, "~/Desktop/averaged_data.txt")

# here is the code for reading in and viewing "averaged_data.txt"

#data <- read.table("~/Desktop/averaged_data.txt", header = TRUE) 
#View(data)
