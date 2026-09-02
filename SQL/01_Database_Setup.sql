/*
===========================================
Project : Banking Analytics
File    : 01_Database_Setup.sql
Author  : Samruddhi Savale
Purpose : Database creation and verification
===========================================
*/

-- Create Database
CREATE DATABASE Banking_Analytics;

USE Banking_Analytics;

-- Verify table
SHOW TABLES;

-- Check Column names, data types, null values
DESCRIBE banking_data;

-- Rename Columns
ALTER TABLE banking_data RENAME COLUMN `Client ID` TO client_id;
ALTER TABLE banking_data RENAME COLUMN `Name` TO name;
ALTER TABLE banking_data RENAME COLUMN `Age` TO age;
ALTER TABLE banking_data RENAME COLUMN `Location ID` TO loction_id;
ALTER TABLE banking_data RENAME COLUMN `Joined Bank` TO joined_bank;
ALTER TABLE banking_data RENAME COLUMN `Banking Contact` TO banking_contact;
ALTER TABLE banking_data RENAME COLUMN `Nationality` TO nationality;
ALTER TABLE banking_data RENAME COLUMN `Occupation` TO occupation;
ALTER TABLE banking_data RENAME COLUMN `Fee Structure` TO fee_structure;
ALTER table banking_data RENAME COLUMN `Loyalty Classification` TO loyalty_classification;
ALTER TABLE banking_data RENAME COLUMN `Estimated Income` TO estimated_income;
ALTER TABLE banking_data RENAME COLUMN `Superannuation Savings` TO superannuation_savings;
ALTER TABLE banking_data RENAME COLUMN `Amount of Credit Cards` TO amount_of_credit_cards;
ALTER TABLE banking_data RENAME COLUMN `Credit Card Balance` TO credit_card_balance;
ALTER TABLE banking_data RENAME COLUMN `Bank Loans` TO bank_loans;
ALTER TABLE banking_data RENAME COLUMN `Bank Deposits` TO bank_deposits;
ALTER TABLE banking_data RENAME COLUMN `Checking Accounts` TO checking_accounts;
ALTER TABLE banking_data RENAME COLUMN `Saving Accounts` TO saving_accounts;
ALTER TABLE banking_data RENAME COLUMN `Foreign Currency Account` TO foreign_currency_account;
ALTER TABLE banking_data RENAME COLUMN `Business Lending` TO business_lending;
ALTER TABLE banking_data RENAME COLUMN `Properties Owned` TO properties_owned;
ALTER TABLE banking_data RENAME COLUMN `Risk Weighting` TO risk_weighting;
ALTER TABLE banking_data RENAME COLUMN `BRId` TO br_id;
ALTER TABLE banking_data RENAME COLUMN `GenderId` TO gender_id;
ALTER TABLE banking_data RENAME COLUMN `IAID` TO ia_id;

-- Verify column names
DESCRIBE banking_data;
