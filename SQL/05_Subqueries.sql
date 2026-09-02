/*
=====================================================
Project      : Banking Analytics
File Name    : 05_Subqueries.sql
Author       : Samruddhi Savale
Description  : Advanced Banking Analysis using
               Subqueries
Database     : Banking_Analytics
Table        : banking_data
=====================================================
*/

-- Display customers earning above the bank's average estimated income.
SELECT client_id, name, estimated_income
FROM banking_data
WHERE estimated_income >
(
    SELECT AVG(estimated_income)
    FROM banking_data
)
ORDER BY estimated_income DESC;

-- Display customers whose bank deposits exceed the average bank deposit.
SELECT client_id, name, bank_deposits
FROM banking_data
WHERE bank_deposits >
(
    SELECT AVG(bank_deposits)
    FROM banking_data
)
ORDER BY bank_deposits DESC;

-- Display customers whose bank loans exceed the average bank loan.
SELECT client_id, name, bank_loans
FROM banking_data
WHERE bank_loans >
(  
    SELECT AVG(bank_loans)
    FROM banking_data
)
ORDER BY bank_loans DESC;

-- Display customers having below-average estimated income but above-average bank deposits.
SELECT client_id, name, estimated_income, bank_deposits
FROM banking_data
WHERE estimated_income <
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

-- Display occupations whose average bank deposits are above the overall average.
SELECT occupation, ROUND(AVG(bank_deposits), 2) AS average_bank_deposits
FROM banking_data
GROUP BY occupation
HAVING AVG(bank_deposits) >
(
    SELECT AVG(bank_deposits)
    FROM banking_data
)
ORDER BY average_bank_deposits DESC;

-- Display nationalities whose average estimated income is above the bank average.
SELECT nationality, ROUND(AVG(estimated_income),2) AS average_estimated_income
FROM banking_data
GROUP BY nationality
HAVING AVG(estimated_income) >
(
    SELECT AVG(estimated_income)
    FROM banking_data
)
ORDER BY average_estimated_income DESC;

-- Display customer(s) having the highest bank deposits.
SELECT client_id, name, occupation, bank_deposits
FROM banking_data
WHERE bank_deposits =
(   
    SELECT MAX(bank_deposits)
    FROM banking_data
);

-- Display customer(s) having the lowest bank loan amount.
SELECT client_id, name, occupation, bank_loans
FROM banking_data
WHERE bank_loans = 
(
    SELECT MIN(bank_loans)
    FROM banking_data
);

-- Display customers having above-average credit card balance.
SELECT client_id, name, credit_card_balance
FROM banking_data
WHERE credit_card_balance >
(
    SELECT AVG(credit_card_balance)
    FROM banking_data
)
ORDER BY credit_card_balance DESC;

-- Display high-risk customers with above-average bank loans.
SELECT client_id, name, risk_weighting, bank_loans
FROM banking_data
WHERE risk_weighting IN (4,5) 
AND bank_loans >
(
    SELECT AVG(bank_loans)
    FROM banking_data
)
ORDER BY bank_loans DESC;

-- Display loyalty classifications whose average bank deposits exceed the overall bank average.
SELECT loyalty_classification, ROUND(AVG(bank_deposits), 2) AS average_bank_deposits
FROM banking_data
GROUP BY loyalty_classification
HAVING AVG(bank_deposits) >
(
    SELECT AVG(bank_deposits)
    FROM banking_data
)
ORDER BY average_bank_deposits DESC;