USE retail_sales_db;
SELECT * FROM sales_data;
/* Basic queries*/

-- Total rows in the table
select COUNT(*) AS total_rows FROM sales_data;

-- Find the earliest and latest dates in the data
SELECT MIN(date_of_sale) AS earliest_date, MAX(date_of_sale) AS latest_date FROM sales_data;

-- Count how many unique stores and products exist
select count(DISTINCT store_id) AS `Unique Stores`, count(DISTINCT product_id) AS `Unique Products` from sales_data;

-- Calculate total units sold across all products
SELECT product_id, SUM(units_sold) as total_units_sold from sales_data
GROUP BY product_id;

-- Find average price per product category
SELECT category, AVG(price) AS avg_category_price FROM sales_data
GROUP BY category;
 
-- List all regions and how many records each has
SELECT region, COUNT(*) FROM sales_data
GROUP BY region;

-- Identify products with zero discount applied
SELECT store_id, product_id, discount FROM sales_data
WHERE discount = 0
ORDER BY product_id;

-- Show total demand per category
SELECT category, SUM(demand) AS total_demand FROM sales_data
GROUP BY category
ORDER BY total_demand DESC;

-- Find the maximum and minimum inventory levels
SELECT MIN(inventory_level) AS min_inventory_level, MAX(inventory_level) AS max_inventory_level FROM sales_data;
