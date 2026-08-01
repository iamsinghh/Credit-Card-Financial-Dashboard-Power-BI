-- Credit Card Financial Dashboard | SQL Data Preparation Script
-- ============================================================
--
-- Description:
-- This script creates the required database tables and imports
-- the transaction and customer datasets used for the Power BI
-- Credit Card Financial Dashboard project.
--
-- ============================================================
-- CREATE DATABASE CCDB
USE CCDB;
-- ============================================================
-- Create Database Tables
-- ============================================================
DROP TABLE IF EXISTS cc_detail;

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date VARCHAR(20),
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(20),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc TINYINT
);
-- ============================================================
-- Customer Details Table
-- ============================================================
CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);
-- ============================================================
-- Import Credit Card Transaction Dataset
-- ============================================================
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/credit_card.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
-- Verify imported transaction records
SELECT * FROM cc_detail;
-- ============================================================
-- Import Customer Dataset
-- ============================================================
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer (1).csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
-- Verify imported customer records
SELECT COUNT(*) FROM cust_detail;
