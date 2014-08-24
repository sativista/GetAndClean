## Summary

The main script *run_analysis.R* generates two clean data sets from the raw data contained in the "Human Activity Recognition Using Smartphones Data Set".  The clean data set named *UCI-HAR-tidy-Dataset.txt* is a union of the raw training and test data with features added for the subject and activity associated with each sample row.  The clean data set named *UCI-HAR-tidy-means-Dataset.txt* contains the means for each unique subject/activity group present in the *UCI-HAR-tidy-Dataset.txt* data set.

## Requirements

### R Libraries

Uses the *data.table 1.9.2*.

### Original DataSet

The original DataSet have to be in a subdirectory called *OriginalDataSet*. Unzipped already.

### R Version

This script was written and tested using R 3.1.1

## High-level Script Steps

1. Load required libraries
2. Load the activity descriptions; this should yield 6 by 2 data.table.  The separator is a space and there is no heading line.
3. Load the feature names; this should yield a 561 by 2 data table.  The separator is a space and there is no heading line.
4. Load the raw test and train data.  The *X_test.txt* and *X_train.txt* files use whitespace to separate values and the files can contain leading and trailing whitespace.  The files may also contain extra whitespace between values.  This whitespace will be removed so that the individual feature values are correctly read.  There are no NA values so it is safe to remove the whitespace between values.
5. Add meaningful feature names so that the clean data sets are more friendly.
6. Assemble the test and train data sets into a single data set using the *rbind* and *cbind* functions.
7. Select the mean and standard deviation features while preserving the subject and activity-id features.
8. Define keys for the data sets and merge in the activity names.
9. Reorder the features to be more pleasing and redefine the keys for the clean data set.
10. Save the *tidy-Dataset.txt* data set.
11. Compute means grouped by subject and activity-name, then save this data set too as *tidy-means-Dataset.txt*.

