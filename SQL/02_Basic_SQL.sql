/*
=====================================================
Project      : Banking Analytics
File Name    : 02_Basic_SQL.sql
Author       : Samruddhi Savale
Description  : Basic SQL Queries
Database     : Banking_Analytics
Table        : banking_data
=====================================================
*/

-- 1. BASIC SELECT STATEMENTS
-- Display all customer records.
SELECT *
FROM banking_data;

-- Display only first 10 records.
SELECT *
FROM banking_data
LIMIT 10;

-- Display only customer name.
SELECT name
FROM banking_data;

-- Display cutomer name and age.
SELECT name, age
FROM banking_data;

-- Customer segmentation based on profession and income.
-- Display each customers name, occupation, and estimated income.
SELECT name, occupation, estimated_income
FROM banking_data;

-- 2. DISTINCT
-- Display Unique Occupations
SELECT DISTINCT occupation
FROM banking_data;

-- Display Unique Nationalities
SELECT DISTINCT nationality
FROM banking_data;

-- Diaplay Unique Loaylty Classification
SELECT DISTINCT loyalty_classification
FROM banking_data;

-- Diaplay Unique Gender
SELECT DISTINCT gender_id
FROM banking_data;

-- 3. WHERE CLAUSE
-- Display customer whose age is greater than 40 years.
SELECT *
FROM banking_data
WHERE age > 40;

-- Display customer younger than 30 years.
SELECT *
FROM banking_data
WHERE age < 30;

-- Display customer with estimated income
-- greater than ₹500,000.
SELECT client_id, name, estimated_income
FROM banking_data
WHERE estimated_income >= 500000;

-- Display customer having bank deposits
-- greater than ₹1,000,000.
SELECT client_id, name, bank_deposits
FROM banking_data
WHERE bank_deposits > 1000000;

-- Display high-risk customer.
SELECT client_id, name, risk_weighting
FROM banking_data
WHERE risk_weighting >= 4;

-- Display customer whose age is exactly 30 years.
SELECT client_id, name, age
FROM banking_data
WHERE age = 30;

-- Display customer who are not European.
SELECT client_id, name, nationality
FROM banking_data
WHERE nationality != 'European';

-- 4. AND
-- Customer older than 40 AND
-- income greater than ₹200,000.
SELECT client_id, name, age, estimated_income
FROM banking_data
WHERE age > 40 AND estimated_income > 200000;

-- 5. OR
-- Customer who are younger than 25 OR older than 60.
SELECT client_id, name, age
FROM banking_data
WHERE age < 25 OR age > 60;

-- 7. BETWEEN
-- Customer age between 30 and 40 years.
-- Customer estimated income is between ₹100,000 and ₹250,000.
SELECT client_id, name, age, estimated_income
FROM banking_data
WHERE age BETWEEN 30 AND 40
And estimated_income BETWEEN 100000 AND 250000;

-- 8. IN
-- Display customer who belong to Asian or European Nationalities
SELECT client_id, name, nationality
FROM banking_data
WHERE nationality IN ('Asian','European');

-- Display customer with high risk weighting.
SELECT client_id, name, risk_weighting
FROM banking_data
WHERE risk_weighting IN (4,5);

-- Display customers belonging to Gold and Platinum loyalty classifications.
SELECT client_id, name, loyalty_classification
FROM banking_data
WHERE loyalty_classification IN ('Gold', 'Platinum');

-- 9. LIKE
-- Display customers whose names start with 'A'.
SELECT client_id, name
FROM banking_data
WHERE name LIKE 'A%';

-- Display customers whose occupation contains the word 'Engineer'.
SELECT client_id, name, occupation
FROM banking_data
WHERE occupation LIKE '%Engineer%';

-- 10. ORDER BY
-- Display top 10 customers with the highest estimated income.
SELECT client_id, name, estimated_income
FROM banking_data
ORDER BY estimated_income DESC
LIMIT 10;

-- Display customers sorted by age.
SELECT client_id, name, age
FROM banking_data
ORDER BY age ASC;