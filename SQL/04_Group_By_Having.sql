/*
=====================================================
Project      : Banking Analytics
File Name    : 04_Group_By_Having.sql
Author       : Samruddhi Savale
Description  : Customer Segmentation using GROUP BY
               and HAVING
Database     : Banking_Analytics
Table        : banking_data
=====================================================
*/

-- 1. GROUP BY
-- Count customers by nationality.
SELECT nationality, COUNT(*) AS total_customers
FROM banking_data
GROUP BY nationality
ORDER BY total_customers DESC;

-- Count customers by loyalty classification.
SELECT loyalty_classification, COUNT(*) AS total_customers
FROM banking_data
GROUP BY loyalty_classification
ORDER BY total_customers DESC;

-- Calculate average estimated income by nationality.
SELECT nationality, ROUND(AVG(estimated_income),2) AS average_income
FROM banking_data
GROUP BY nationality
ORDER BY average_income DESC;

-- Calculate average estimated income by loyalty classification.
SELECT loyalty_classification, ROUND(AVG(estimated_income),2) AS average_income
FROM banking_data
GROUP BY loyalty_classification
ORDER BY average_income DESC;

-- Calculate the total bank deposits by top 10 occupation.
SELECT occupation, ROUND(SUM(bank_deposits),2) AS total_bank_deposits
FROM banking_data
GROUP BY occupation
ORDER BY total_bank_deposits DESC
LIMIT 10;

-- Calculate the total bank loans by top 10 occupation.
SELECT occupation, ROUND(SUM(bank_loans),2) AS total_bank_loans
FROM banking_data
GROUP BY occupation
ORDER BY total_bank_loans DESC
LIMIT 10;

-- Calculate total bank deposits by nationality.
SELECT nationality, ROUND(SUM(bank_deposits),2) AS total_bank_deposits
FROM banking_data
GROUP BY nationality
ORDER BY total_bank_deposits;

-- Calculate total bank loans by risk weighting.
SELECT risk_weighting, ROUND(SUM(bank_loans), 2) AS total_bank_loans
FROM banking_data
GROUP BY risk_weighting
ORDER BY total_bank_loans DESC;

-- Calculate average estimated income by gender.
SELECT gender_id, ROUND(AVG(estimated_income), 2) AS average_estimated_income
FROM banking_data
GROUP BY gender_id
ORDER BY average_estimated_income DESC;

-- Calculate average bank deposits by gender.
SELECT gender_id, ROUND(AVG(bank_deposits), 2) AS average_bank_deposits
FROM banking_data
GROUP BY gender_id
ORDER BY average_bank_deposits DESC;

-- Calculate total bank deposits by loyalty classification.
SELECT loyalty_classification, ROUND(SUM(bank_deposits), 2) AS total_bank_deposits
FROM banking_data
GROUP BY loyalty_classification
ORDER BY total_bank_deposits DESC;

-- 2. HAVING
-- Display occupations having more than 20 customers.
SELECT occupation, COUNT(*) AS total_customers
FROM banking_data
GROUP BY occupation
HAVING COUNT(*) > 20
ORDER BY total_customers DESC;

-- Display nationalities whose average estimated income is greater than ₹170,000.
SELECT nationality, ROUND(AVG(estimated_income),2) AS average_income
FROM banking_data
GROUP BY nationality
HAVING AVG(estimated_income) > 170000
ORDER BY average_income DESC;

-- Display loyalty classifications having more than 700 customers.
SELECT loyalty_classification, COUNT(*) AS total_customers
FROM banking_data
GROUP BY loyalty_classification
HAVING COUNT(*) > 700
ORDER BY total_customers DESC;

-- Display risk categories whose total bank loans exceed ₹50,000,000.
SELECT risk_weighting, ROUND(SUM(bank_loans),2) AS total_bank_loans
FROM banking_data
GROUP BY risk_weighting
HAVING SUM(bank_loans) > 50000000
ORDER BY total_bank_loans DESC;

-- Display occupations whose average bank deposits exceed ₹500,000.
SELECT occupation, ROUND(AVG(bank_deposits), 2) AS average_bank_deposits
FROM banking_data
GROUP BY occupation
HAVING AVG(bank_deposits) > 500000
ORDER BY average_bank_deposits DESC;

-- Display nationalities having average bank deposits greater than ₹500,000.
SELECT nationality, ROUND(AVG(bank_deposits),2) AS average_bank_deposits
FROM banking_data
GROUP BY nationality
HAVING AVG(bank_deposits) > 500000
ORDER BY average_bank_deposits DESC;

-- Display occupations having average bank loans greater than ₹300,000.
SELECT occupation, ROUND(AVG(bank_loans),2) AS average_bank_loans
FROM banking_data
GROUP BY occupation
HAVING AVG(bank_loans) > 300000
ORDER BY average_bank_loans DESC;

-- Display loyalty classifications with total deposits greater than ₹300 million.
SELECT loyalty_classification, ROUND(SUM(bank_deposits),2) AS total_bank_deposits
FROM banking_data
GROUP BY loyalty_classification
HAVING SUM(bank_deposits) > 300000000
ORDER BY total_bank_deposits DESC;