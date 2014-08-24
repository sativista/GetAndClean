## Codebook for the *run_analysis.R* Script

### Generated Data Set 1: *tidy-Dataset.txt*

*tidy-Dataset.txt* is a 10,299 by 68 data set derived from the "Human Activity Recognition Using Smartphones Data Set" (HAR) provided by the [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).  The file is formatted as multiple lines of comma separated values.  The first line contains the feature names.  The features are outlined in the table below.

<table>
<thead>
<tr>
<td>Position</td>
<td>Name</td>
<td>Description</td>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>subject</td>
<td>The numeric ID of the test subject from which the measured data was collected.  There were 30 subjects in the HAR test therefore the range of values will be 1 to 30.
</td>
</tr>
<tr>
<td>2</td>
<td>activity-name</td>
<td>The human-readable name for the activity the test subject was performing when the measured data was collected.  There were 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.
</td>
</tr>
<tr>
<td>3 to 68</td>
<td>Various mean and standard deviation measurements.  See the HAR codebook files (*features.txt*, *features_info.txt*, and *README.txt*) for the complete list of feature names and how they were measured. </td>
<td>The raw HAR data contains 561 features for each sample row.  The *tidy-Dataset.txt* data set contains 68 features with 66 of them taken from the original set of 561.  These 66 features are broken down into 33 mean and 33 standard deviation measurements for each sample.  The other two features are the subject and activity-name as previously described.  Mean measurements are denoted by a substring of "-mean()" in a feature name while standard deviations are denoted by a "-std()" substring.
<p>
40 measurements are derived from the device's accelerometer while 26 are from the device's gyroscope.  The accelerometer measurements are in standard gravity units which are expressed in meters per second squared.  The gyroscope measurements are expressed in radians per second.
</td>
</tr>
</tbody>
</table>

No additional processing of the HAR feature values was performed. However, the raw data itself required cleaning that is described in the README.md file along with the steps required to generate the *tidy-Dataset.txt* file.

### Generated Data Set 2: *tidy-means-Dataset.txt*

*tidy-means-Dataset.txt* is a 180 by 68 data set derived from the tidy dataset above.  The file is formatted as multiple lines of comma separated values.  The first line contains the feature names.  The features are the same as those described in the table above.  The main difference is that the rows in *tidy-means-Dataset.txt* represent the means computed for each unique subject/activity-id group in *tidy-Dataset.txt*.  No additional processing of the *tidy-Dataset.txt* data was performed.