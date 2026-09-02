/*
=====================================================
Project      : Banking Analytics
File Name    : 03_Aggregate_Functions.sql
Author       : Samruddhi Savale
Description  : Aggregate Functions for Banking Analysis
Database     : Banking_Analytics
Table        : banking_data
=====================================================
*/

-- 1. COUNT
-- Count the total number of customers.
SELECT COUNT(*) AS total_customers
FROM banking_data;

-- Count the total number of unique gender.
SELECT COUNT(DISTINCT gender_id) AS unique_gender_categories
FROM banking_data;

-- Count the total number of unique occupations.
SELECT COUNT(DISTINCT occupation) AS unique_occupations
FROM banking_data;

-- Count the total number of unique nationalities.
SELECT COUNT(DISTINCT nationality) AS unique_nationalities
FROM banking_data;

-- 2. AVERAGE
-- Calculate the average estimated income.
SELECT ROUND(AVG(estimated_income),2) AS average_estimated_income
FROM banking_data;

-- Calculate the average bank deposits.
SELECT ROUND(AVG(bank_deposits),2) AS average_bank_deposits
FROM banking_data;

-- Calculate the average bank loans.
SELECT ROUND(AVG(bank_loans),2) AS average_bank_loans
FROM banking_data;

-- 3. MIN & MAX
-- Find the minimum and maximum customer ages.
SELECT MIN(age) AS minimum_age, 
       MAX(age) AS maximum_age
FROM banking_data;

-- Find the minimum and maximum estimated incomes.
SELECT ROUND(MIN(estimated_income),2) AS minimum_income,
       ROUND(MAX(estimated_income),2) AS maximum_income
FROM banking_data;

-- Find the minimum and maximum bank deposits.
SELECT ROUND(MIN(bank_deposits),2) AS minimum_deposit,
       ROUND(MAX(bank_deposits),2) AS maximum_deposit
FROM banking_data;

-- 4. SUM
-- Calculate the total amount income by all customers.
SELECT ROUND(SUM(estimated_income),2) AS total_estimated_income
FROM banking_data;

-- Calculate the total amount deposited by all customers.
SELECT ROUND(SUM(bank_deposits),2) AS total_bank_deposits
FROM banking_data;

-- Calculate the total amount of bank loans.
SELECT ROUND(SUM(bank_loans),2) AS total_bank_loans
FROM banking_data;

-- Calculate the total credit card balance.
SELECT ROUND(SUM(credit_card_balance),2) AS total_credit_card_balance
FROM banking_data;