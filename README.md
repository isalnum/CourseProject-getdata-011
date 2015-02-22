
## Description of the script

Data are prepared by the run_analysis.R script only.

It first loads the plyr package, which is used for data summarization at the end of the script.

Then it loads all necessary train and test data. It is supposed, that working directory contains the UCI HAR Dataset folder.

Variable names of the train and test data are modified according to the features.txt file.

Only columns denoting mean or standard deviation are extracted from the input data (X_train and X_test).

Because original data uses numeric values to denote activities, factor vectors are created and the labels from the activity_labels.txt files are used to denote activities.

Columns with subject numbers and activities are connected to input data (X_train and X_text respectively) so the train and test datasets are created.

Next, train and test data sets are joined together so one large dataset is created.

At the end, summarized the dataset in such a way that for each subject and activity, mean value of each signal is computed.

This summarized dataset is saved into a text file named TidyData.txt.