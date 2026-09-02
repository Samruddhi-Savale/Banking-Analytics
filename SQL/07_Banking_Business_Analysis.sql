/*
=====================================================
Project      : Banking Analytics
File Name    : 07_Banking_Business_Analysis.sql
Author       : Samruddhi Savale
Description  : Banking Business Analysis Queries
Database     : Banking_Analytics
Table        : banking_data
=====================================================
*/

-- Identify customers suitable for Premium Banking services.
SELECT client_id, name, occupation, estimated_income, bank_deposits
FROM banking_data
WHERE estimated_income >
(
    SELECT AVG(estimated_income)
    FROM banking_data
)
AND bank_deposits >
(
    SELECT AVG(bank_deposits)
    FROM banking_data
)
ORDER BY bank_deposits DESC;

-- Identify customers with high income but low bank deposits.
SELECT client_id, name, occupation, estimated_income, bank_deposits
FROM banking_data
WHERE estimated_income >
(
    SELECT AVG(estimated_income)
    FROM banking_data
)
AND bank_deposits <
(
    SELECT AVG(bank_deposits)
    FROM banking_data
)
ORDER BY estimated_income DESC;

-- Identify high-risk customers with above-average bank loans.
SELECT client_id, name, occupation, bank_loans, risk_weighting
FROM banking_data
WHERE bank_loans >
(
    SELECT AVG(bank_loans)
    FROM banking_data
)
AND risk_weighting IN (4, 5)
ORDER BY bank_loans DESC;

-- Identify customers with high savings but low bank loans.
SELECT client_id, name, occupation, saving_accounts, bank_loans
FROM banking_data
WHERE saving_accounts >
(
    SELECT AVG(saving_accounts)
    FROM banking_data
)
AND bank_loans <
(
    SELECT AVG(bank_loans)
    FROM banking_data
)
ORDER BY saving_accounts DESC;

-- Identify customers with above-average credit card balances.
SELECT client_id, name, credit_card_balance, loyalty_classification
FROM banking_data
WHERE credit_card_balance >
(
    SELECT AVG(credit_card_balance)
    FROM banking_data
)
ORDER BY credit_card_balance DESC;

-- Identify long-term customers with above-average bank deposits.
SELECT client_id, name, joined_bank, bank_deposits
FROM banking_data
WHERE joined_bank < '2015-01-01'
AND bank_deposits >
(
    SELECT AVG(bank_deposits)
    FROM banking_data
)
ORDER BY bank_deposits DESC;

-- Display the Top 10 occupations generating the highest bank deposits.
SELECT occupation, ROUND(SUM(bank_deposits), 2) AS total_bank_deposits
FROM banking_data
GROUP BY occupation
ORDER BY total_bank_deposits DESC
LIMIT 10;

-- Identify customers with high income but low savings account balance.
SELECT client_id, name, occupation, estimated_income, saving_accounts
FROM banking_data
WHERE estimated_income >
(
    SELECT AVG(estimated_income)
    FROM banking_data
)
AND saving_accounts <
(
    SELECT AVG(saving_accounts)
    FROM banking_data
)
ORDER BY estimated_income DESC;

-- Identify customers with high loans but low bank deposits.
SELECT client_id, name, occupation, bank_loans, bank_deposits
FROM banking_data
WHERE bank_loans >
(
    SELECT AVG(bank_loans)
    FROM banking_data
)
AND bank_deposits <
(
    SELECT AVG(bank_deposits)
    FROM banking_data
)
ORDER BY bank_loans DESC;

-- Display nationalities generating the highest total bank deposits.
SELECT nationality, ROUND(SUM(bank_deposits),2) AS total_bank_deposits
FROM banking_data
GROUP BY nationality
ORDER BY total_bank_deposits DESC;

-- Display loyalty classifications generating the highest bank deposits.
SELECT
    loyalty_classification,
    ROUND(SUM(bank_deposits),2) AS total_bank_deposits
FROM banking_data
GROUP BY loyalty_classification
ORDER BY total_bank_deposits DESC;

-- Display occupations with above-average income and above-average deposits.
SELECT occupation, ROUND(AVG(estimated_income),2) AS average_income, ROUND(AVG(bank_deposits),2) AS average_deposits
FROM banking_data
GROUP BY occupation
HAVING AVG(estimated_income) >
(
    SELECT AVG(estimated_income)
    FROM banking_data
)
AND AVG(bank_deposits) >
(
    SELECT AVG(bank_deposits)
    FROM banking_data
)
ORDER BY average_deposits DESC;

-- Identify customers eligible for Wealth Management services.
SELECT client_id, name, occupation, estimated_income, bank_deposits, loyalty_classification
FROM banking_data
WHERE estimated_income >
(
    SELECT AVG(estimated_income)
    FROM banking_data
)
AND bank_deposits >
(
    SELECT AVG(bank_deposits)
    FROM banking_data
)
AND loyalty_classification IN ('Gold', 'Platinum')
ORDER BY bank_deposits DESC;

-- Identify high-risk customers having below-average savings.
SELECT client_id, name, occupation, risk_weighting, saving_accounts
FROM banking_data
WHERE risk_weighting IN (4,5)
AND saving_accounts <
(
    SELECT AVG(saving_accounts)
    FROM banking_data
)
ORDER BY risk_weighting DESC,
         saving_accounts;
         
-- Identify financially strong customers.
SELECT client_id, name, occupation, estimated_income, bank_deposits, risk_weighting
FROM banking_data
WHERE estimated_income >
(
    SELECT AVG(estimated_income)
    FROM banking_data
)
AND bank_deposits >
(
    SELECT AVG(bank_deposits)
    FROM banking_data
)
AND risk_weighting IN (1,2)
ORDER BY bank_deposits DESC;

-- Display Top 10 occupations having the highest average bank loans.
SELECT occupation, ROUND(AVG(bank_loans),2) AS average_bank_loans
FROM banking_data
GROUP BY occupation
ORDER BY average_bank_loans DESC
LIMIT 10;

-- Display Top 20 customers based on overall financial relationship.
SELECT client_id, name, occupation, ROUND(bank_deposits + saving_accounts + credit_card_balance,2) AS total_relationship_value
FROM banking_data
ORDER BY total_relationship_value DESC
LIMIT 20;