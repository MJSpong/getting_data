# getting_data
Course project for Getting and Cleaning Data - Coursera

There is only one script - run_analysis.R. It does the following things.

It reads in a vector 'features' of variable names from 'features.txt', keeping only those with 'mean()' or 'std()' (i.e. standard deviation) in the name. Then it creates a vector 'act' of activity names.

Next, it reads in the data from the folder 'training'. Then it selects measurements corresponding to mean and standard deviation only, as in the vector 'features'. It replaces activity numbers with activity names, labels the activity and subject variables, puts the columns together, and converts it to a table 'train_data'.

Following this, it does everything in the previous paragraph to the test data, to produce a table 'test_data'.

Then, the training and test data sets are stacked on top of one another, and it gives descriptive names to all of the remaining variables (prior to this, only 'activity' and 'subject' variables were descriptively named). This produces 'data', which is a tidy data set, because there is one observation per row, one variable per column, and one value per cell.

Finally, it produces a second tidy data set from 'data' by grouping 'data' according to activity and subject, and then taking the mean of each variable in each group. This produces 'averaged_data'. It then writes this table to a file on the desktop.

The file CodeBook.Rmd allows us to interpret the descriptive variable names of the two tidy data sets 'data' and 'averaged_data' (which have the same variables).
