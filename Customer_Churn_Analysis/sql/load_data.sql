-- Load data from a local CSV file
LOAD DATA INFILE '/workspaces/Data-Analyst-Project-Portfolio/Customer_Churn_Analysis/data/Processed/cleaned_telco_data.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customerID, gender, SeniorCitizen, Partner, Dependents, tenure, PhoneService, MultipleLines,
 InternetService, OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport,
 StreamingTV, StreamingMovies, Contract, PaperlessBilling, PaymentMethod,
 MonthlyCharges, TotalCharges, Churn);
