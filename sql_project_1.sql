
USE sql_project_p1;
-- SQL Retail Sales Analysis - P1
CREATE DATABASE IF NOT EXISTS sql_project_p1;
SHOW DATABASES LIKE 'sql_project_p1'; 


CREATE TABLE rretail_salesetail_sales
		(
            transactions_id INT PRIMARY KEY, 
			sale_date DATE, 
            sale_time TIME,	
			customer_id INT,	
			gender VARCHAR(100),	
			age INT,	
			category VARCHAR(100),	
			quantiy INT,	
			price_per_unit FLOAT,	
            cogs FLOAT,	
			total_sale FLOAT
		);
            
SHOW TABLES LIKE 'retail_sales';
SELECT * FROM retail_sales;
SELECT COUNT(*) FROM sql_project_p1.retail_sales;

USE sql_project_p1;


SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE '/Users/rohanshrestha/Desktop/retail_sales.csv'
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(transactions_id, sale_date, sale_time, customer_id, gender, age, category, quantity, price_per_unit, cogs, total_sale);


SELECT COUNT(*) FROM retail_sales;
SELECT * FROM retail_sales LIMIT 5;

SHOW WARNINGS;
SELECT
  COUNT(*) AS total_rows,
  COUNT(sale_date) AS sale_date_present,
  COUNT(sale_time) AS sale_time_present
FROM retail_sales;

SELECT * FROM retail_sales;





















