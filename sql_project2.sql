USE sql_project_p1;

SELECT * FROM retail_sales
LIMIT 10;

SELECT COUNT(*) FROM retail_sales
LIMIT 10;

SELECT * FROM retail_sales
WHERE transactions_id IS NULL; 

SELECT * FROM retail_sales LIMIT 10;

SELECT * FROM retail_sales WHERE transactions_id = 679;
SELECT COUNT(*) AS likely_missing_numeric
FROM retail_sales
WHERE quantity = 0
  AND price_per_unit = 0
  AND cogs = 0
  AND total_sale = 0;

SET SQL_SAFE_UPDATES = 0;


SELECT * FROM retail_sales;
UPDATE retail_sales
SET
  quantity = NULL,
  price_per_unit = NULL,
  cogs = NULL,
  total_sale = NULL
WHERE quantity = 0
  AND price_per_unit = 0
  AND cogs = 0
  AND total_sale = 0;
  
SELECT COUNT(*) AS zero_rows
FROM retail_sales
WHERE quantity = 0
AND price_per_unit = 0
AND cogs = 0
AND total_sale = 0;

SELECT COUNT(*) AS null_rows
FROM retail_sales
WHERE quantity IS NULL
AND price_per_unit IS NULL
AND cogs IS NULL
AND total_sale IS NULL;


SELECT COUNT(*) AS null_rows
FROM retail_sales
WHERE quantity IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;

SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL OR gender = ''
   OR age IS NULL
   OR category IS NULL OR category = ''
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL
LIMIT 50;


DELETE FROM retail_sales 
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL OR gender = ''
   OR age IS NULL
   OR category IS NULL OR category = ''
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL; 


SELECT COUNT(*) FROM retail_sales;

-- How many sales we have? 
SELECT COUNT(*) AS total_sales
FROM retail_sales;

SELECT * FROM retail_sales;

-- How many unique customer we have like unuqie 
SELECT COUNT(DISTINCT customer_id) AS total_ustomer_id
FROM retail_sales;

SELECT DISTINCT category FROM retail_sales;

-- DATA ANALYSIS & Business key problems and answers 

-- Q1) Write a SQL query to retrieve all columns for sales made on '2022-11-05'. 
		SELECT * FROM retail_sales 
        WHERE sale_date = '2022-11-05';

-- Q2) Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold 
-- is more than 10 in the month of Nov-2022. 

		SELECT *
		FROM retail_sales
		WHERE category = 'Clothing'
		AND quantity > 3
		AND sale_date >= '2022-11-01'
		AND sale_date <  '2022-12-01';

-- Q3) Write a SQL query to calculate the total sales (total_sale) for each category. 

		SELECT category, SUM(total_sale) AS total_sales, COUNT(*) as total_orders
        FROM retail_sales
        GROUP BY category
        ORDER BY total_sales DESC;


-- Q4) Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category. 

		SELECT  category, Round(AVG(age),2) AS average_age
        FROM retail_sales
        WHERE category = 'Beauty'
        GROUP BY category;
		
        
-- Q5) Write a SQL query to find all transactions where the total_sale is greater than 1000

		SELECT *
		FROM retail_sales
		WHERE total_sale > 1000
        ORDER BY total_sale DESC; 

-- Q6) Write a SQL query to find the total number of transactions (transaction_id) 
--     made by each gender in each category.

		SELECT  gender, category, COUNT(DISTINCT transactions_id) AS total_transaction
        FROM retail_sales
        GROUP by gender, category
        ORDER BY 1;
        
-- Q7) Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

        SELECT 
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        ROUND(AVG(total_sale),2) AS avg_sale
        FROM retail_sales
        GROUP BY 1,2
        ORDER BY 1,2;
        
        
-- Q8) Write a SQL query to find the top 5 customers based on the highest total sales 

		SELECT customer_id, SUM(total_sale) as customer_total_sale
        FROM retail_sales
        GROUP BY 1
        ORDER BY customer_total_sale DESC
        LIMIT 5;
        
        
-- Q9) Write a SQL query to find the numnber of unique customers who purchased items from each category. 

		SELECT COUNT(DISTINCT customer_id) AS unique_customers, category 
        FROM retail_sales
        GROUP BY 2;

-- Q10) Write a SQL query to create each shift and number of orders (Example Morning <= 12, 
--      Afternoon Between 12 & 17, Evening > 17) 

		WITH hourly_sale AS(
		SELECT *,
			CASE 
				WHEN HOUR(sale_time) < 12 THEN 'Morning'
				WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
				ELSE 'Evening'
		END as shift
        FROM retail_sales
		)
        SELECT shift, 
        COUNT(*) AS total_orders
        FROM hourly_sale
        GROUP BY shift
        ORDER BY total_orders DESC;
        
        
        -- END OF PROJECT
        
        
        
        
        
        
        













        
        
        
        












  
  
