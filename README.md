# Hackathons_Credit_Rate_Recovery_Prediction
1. Improve Bank’s prediction of risky customers (“sub-prime”) to offer automobile loans. Banks repossess and 
auction the cars for default customers and thus define a recovery rate. 
2. The Bank has provided 13K masked account to do the modelling. Drove the data preparation which involved complex table joining and come up with final target table (consisting of recovery rate) with the combined data set files with other columns with the help of SQL. 
3. In Data exploratory analysis and data pre-processing (removed duplicates, imputed the null values) and identified appropriate columns for the model.
4. Created linear regression model (Python) and employ K-fold cross validation to come up with a MAE of .16. 
4. When our model tested on an Out-Of-Time sample the RMSE was 0.359.
Environment: Python, SQL, Exploratory Data Analysis, Data Quality, Data pre-processing, Data normalization, Linear 
Regression model, K-fold cross validation, SQLite.
