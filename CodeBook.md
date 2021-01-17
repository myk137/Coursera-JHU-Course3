## Description of variables (in alphabetical order) used in run_analysis.R code


'activity_labels'  - stores 6 activity names namely, SITTING, STANDING, LAYING, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS
                        
'd'                - stores dimensions of merged_dataset

'ext_data'         - stores only the measurements on the mean and standard deviation for each measurement 

'feature'          - logical vector containing TRUE values for rows in 'features' dataset which contain 'mean' & 'std' strings

'features'         - stores names of 561 features measured by the sensors

'merged_dataset'   - dataset formed by merging 'test_dataframe' and 'train_dataframe' data

'result'           - stores the tidy dataset required as the outcome of this project 

's'                - stores total TRUE values present in 'feature' vector

'subject_test'     - stores testing subjects code in numeral form 

'subject_train'    - stores training subjects code in numeral form

'test_dataframe'   - stores dataframe column wise containing 'subject_test', 'y_test' and 'X_test' data in that order
                        
'train_dataframe'  - stores dataframe column wise containing 'subject_train', 'y_train' and 'X_train' data in that order

'x_test'           - stores 561 features data measured by the sensors for testing

'x_train'          - stores 561 features data measured by the sensors for training

'y_test'           - stores 6 activities in numeral form from 1 to 6 for testing

'y_train'          - stores 6 activities in numeral form from 1 to 6 for training
