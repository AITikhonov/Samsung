In the beginning we load the files "activity_labels.txt", "features.txt" into the corresponding variables.
Then we goes to data from the "test" folder.
We define a vector of values the containing index of the elements containing in the name of  "mean" and "std" value, 
for this purpose we use the grep function.
On the basis of this information we form the data feature.
After we read the "subject_test.txt" and "X_test.txt" files,
for the last file used a vector of indexes we select necessary columns, apply appropriate names.

We bind (by columns) three tables (subject, activity, X).

We carry out similar actions and for train of data.

We bind (by rows) the test and train data, later we exclude not informative column.

By the ddply function it is determined mean for all subject and activity.
Output the table in the txt file.
