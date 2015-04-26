Getting and Cleaning Data Course Project - Code Book
====================================================

According to the *README.txt* file contained in the downloaded archive, the original dataset is splitted into **training** and **test** data.
Each one again splitted into three files containing respectively:
    1. all of the estimators collected, 
    2. training labels, i.e the activities
    3. subjects who performed the activities

The `run_analysis.R` script does the following steps.

1. Loads the training data. In this 1st step they still are separated into 3 dataframes: **X_train**, **y_train**, **subject_train**. 
2. Loads the test data in the same way into **X_test**, **y_test** and **subject_test**.
3. Merges the training and the test sets to create one data set, in two steps:
    - row binding (`rbind` function) of the 3 original training data sets with the corresponding 3 test data sets to obtain 3 new dataframes: **X_total**, **y_total**, **subject_total**;
    - horizontal merge of these columns, through `cbind`, to obtain a unique data set as requested, named **total**. There is no need of using the `merge` function since raw data is correctly sorted.
4. Reads the features labels from **features.txt** and transform them into a vector to assign new colnames. Notice that the 1st column of **total** is now the subject, while the 2nd is **y** hence the **activity**, and the remaining ones are features.
5. Keeps only subject, activity and mean and std values of features. It uses regexps+grep to select them.
6. Substitutes integer values of activities with descriptive names, reading the desired labels from **activity_labels.txt**.
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject using the `ddply` function from the `plyr` package. This datafram is called **totalAvg**.
8. As a last step it exports **totalAvg** to a *txt* file named **averages_by_subject_and_activity.txt**, using the `write.table` function.