/*
=====================================================
Project      : Banking Analytics
File Name    : 08_Views_and_CTE.sql
Author       : Samruddhi Savale
Description  : Views and Common Table Expressions
Database     : Banking_Analytics
Table        : banking_data
=====================================================
*/

-- Create a view for Premium Banking customers.
CREATE VIEW premium_customers AS
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
);

-- Display the view
SELECT *
FROM premium_customers;

-- Create a view for High-Risk Customers.
CREATE VIEW high_risk_customers AS
SELECT client_id, name, occupation, bank_loans, risk_weighting
FROM banking_data
WHERE risk_weighting IN(4,5);

-- Display the view
SELECT *
FROM high_risk_customers;

-- Create a view for customers having high income but low bank deposits.
CREATE VIEW investment_opportunity AS
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
ORDER BY estimated_income DESC,
		 bank_deposits;

-- Display the view
SELECT *
FROM investment_opportunity;

-- Create a view for customers having above-average bank deposits.
CREATE VIEW top_depositors AS
SELECT client_id, name, occupation, bank_deposits
FROM banking_data
WHERE bank_deposits >
(
    SELECT AVG(bank_deposits)
    FROM banking_data
);

-- Display the view
SELECT *
FROM top_depositors
ORDER BY bank_deposits DESC;