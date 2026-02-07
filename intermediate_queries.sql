USE retail_sales_db;
SELECT * FROM sales_data;

-- Total revenue by product category and region
SELECT region, category, SUM(units_sold * price) AS total_revenue FROM sales_data
GROUP BY region, category;

-- Average units sold when promotion is on vs off
SELECT 
	CASE
		WHEN promotion = 1 THEN 'Promotion Active'
        WHEN promotion = 0 THEN 'No Promotion'
        ELSE 'Unknown'
	END AS 'promo_status',
    AVG(units_sold) AS avg_units_sold FROM sales_data
GROUP BY promotion;

-- Monthly demand trends over time
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month, SUM(demand) AS total_demand
FROM sales_data
GROUP BY month;

-- Top 5 products by total units sold
SELECT store_id, product_id, category, SUM(units_sold) AS 'total_units_sold' FROM sales_data
GROUP BY product_id, category, store_id
ORDER BY total_units_sold DESC
LIMIT 5;

-- Compare average demand by weather condition
SELECT weather_condition, AVG(demand) AS avg_demand, COUNT(*) AS frequency, SUM(demand) AS total_volume
FROM sales_data
GROUP BY weather_condition;

-- Average discount applied per category
SELECT category, AVG(discount) AS avg_discount FROM sales_data
GROUP BY category;

-- Stores with the highest average demand
SELECT store_id, avg(demand) AS avg_demand FROM sales_data
GROUP BY store_id
ORDER BY avg_demand DESC
LIMIT 5;