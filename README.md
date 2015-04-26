# GettingAndCleaningData

This repository contains all of my files produced for the Coursera Getting and Cleaning Data Course Project, which is part of the Data Science Specialization.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here's the link to the data for the project:
[UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The detailed content of this repo is the following:
1. A `run_analysis.R` R code script that can be run as long as the Samsung data `UCI HAR Dataset` is in your working directory. Its output is the tidy data set `averages_by_subject_and_activity.txt` described below.
2. The code book `CodeBook.md`, describing variables, data and any transformations performed to obtain the tidy data sets required.
3. An additional `Getting_and_Cleaning_Data_Course_Project.html` report with its Rmarkdown source code `Getting_and_Cleaning_Data_Course_Project.Rmd`. Here I describe in a more fancy way the steps involved in the `run_analysis.R` script, printing out a small portion of the `averages_by_subject_and_activity.txt` data set in a table using the `knitr` package. You can directly access to this report here: [Getting and Cleaning Data Course Project](http://emilzonta.github.io/GettingAndCleaningData/).
