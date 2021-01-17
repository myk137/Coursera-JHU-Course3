## Description of how code written in run_analysis.R file works

### STEP 1

'subject_test', 'subject_train', 'x_test', 'y_test', 'x_train', 'y_train', 'features' and 'activity_labels' read all the given text files data using read.table() function.

names() function renames column names.

'test_dataframe' and 'train_dataframe' converts dataset into dataframe class using data.frame() function.

Above dataframes are merged row wise to form 'merged_dataset' using rbind() function. All 'test_dataframe' data will be above 'train_dataframe' data.



### STEP 2

'feature' is a logical vector which has true values for rows in 'features' data which contain 'mean' and 'std' strings. This is done using grepl() function.

Using sum() function 's' stores total true values present in 'feature' vector.

'd' stores dimensions of merged_dataset, done using dim() function.

'ext_data' stores matrix containing only NA values, done using matrix() function. 

After that 'subject' and 'activity' data from 'merged_dataset' is stored into first two columns of 'ext_data' dataset.

for loop is used to extract only the measurements on the mean and standard deviation for each measurement. For this 'feature' logical vector made above is equated to TRUE value and only when this holds true the mean and standard deviation data is stored in 'ext_data' dataset.
After this 'ext_data' is converted to dataframe class.



### STEP 3

for loop is used to fill 'activity column' data in 'merged_dataset' by picking activity names from 'activity_labels' dataset. 



### STEP 4

for loop is used to rename column names of 'merged_dataset' by picking variable names from 'features' dataset.

make.names() function is used to make syntactically valid column names of 'merged_dataset', i.e., it removes '-' and replaces it with '.' 



### STEP 5

arrange() function orders 'subject' data in 'merged_dataset' in chronological order from 1 to 6, and when subject value is same e.g. '1', then it orders 'activity' data in alphabetical order.

group_by() function groups the different combinations of 'subject' and 'activity' data in 'merged_dataset'. Grouping doesn't changes how the data looks.  

summarise(across()) function creates a tidy dataset containing average of each variable for each activity and each subject by transforming 'merged_dataset'. This tidy dataset is stored in 'result' variable.

write.table() function is used to save the above tidy dataset in a text document named as result.txt
