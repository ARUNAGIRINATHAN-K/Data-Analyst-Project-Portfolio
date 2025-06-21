-- 1. Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- 2. Overall churn rate
SELECT 
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS churn_rate_percent
FROM customers;

-- 3. Churn rate by contract type
SELECT Contract, 
       COUNT(*) AS total, 
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
       ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS churn_rate_percent
FROM customers
GROUP BY Contract;

-- 4. Average tenure for churned vs. non-churned
SELECT Churn, ROUND(AVG(tenure), 2) AS avg_tenure
FROM customers
GROUP BY Churn;

-- 5. Monthly charges vs. churn
SELECT 
    CASE 
        WHEN MonthlyCharges < 35 THEN 'Low'
        WHEN MonthlyCharges BETWEEN 35 AND 70 THEN 'Medium'
        ELSE 'High'
    END AS charge_band,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)/COUNT(*)*100, 2) AS churn_rate_percent
FROM customers
GROUP BY charge_band;
