CREATE TABLE sales_performance(
	orderID VARCHAR(50),
	amount INT,
	profit INT,
	quantity INT,
	category TEXT,
	sub_category TEXT ,
	paymentmethod TEXT,
	orderdate DATE,
	customername VARCHAR(100),
	state TEXT,
	city TEXT,
	year_month INT
	);
SELECT *
FROM sales_performance;

ALTER TABLE sales_performance
ALTER COLUMN orderID TYPE VARCHAR(20);

ALTER TABLE sales_performance
ALTER COLUMN year_month TYPE VARCHAR(7);

SELECT *
FROM sales_performance
WHERE amount IS NOT NULL;

SELECT SUM(amount) AS total_spent,
	state
FROM sales_performance
GROUP BY state
ORDER BY total_spent DESC;

SELECT COUNT(orderid) AS total_orders,
		orderdate
FROM sales_performance
GROUP BY orderdate
ORDER BY total_orders DESC
LIMIT 5;

SELECT DISTINCT COUNT (customername)
FROM sales_performance
WHERE amount > 5000;

SELECT SUM(amount) AS total_revenue,
		category
FROM sales_performance
GROUP BY category
ORDER BY total_revenue DESC;

SELECT MAX(profit) AS highest_profit,
	 category
FROM sales_performance
GROUP BY category
ORDER BY highest_profit DESC;

SELECT category,
		customername
FROM sales_performance
WHERE EXTRACT (YEAR FROM orderdate) = 2024;

SELECT COUNT(orderid) AS total_orders,
		state
FROM sales_performance
GROUP BY state
ORDER BY total_orders DESC
LIMIT 3;

SELECT AVG(amount) AS avg_amount,
		category
FROM sales_performance
GROUP BY category;

SELECT customername,
 		MAX(orderdate)
FROM sales_performance
GROUP BY customername
LIMIT 5;

SELECT MIN(amount)
FROM sales_performance;

SELECT MAX(amount)
FROM sales_performance;

SELECT AVG(amount)
FROM sales_performance;

SELECT
  CASE
    WHEN profit > 0 THEN 'profitable'
    WHEN profit < 0 THEN 'loss'
    ELSE 'neutral'
  END AS profit_status,
  COUNT(*) AS total_orders
FROM sales_performance
GROUP BY
  CASE
    WHEN profit > 0 THEN 'profitable'
    WHEN profit < 0 THEN 'loss'
    ELSE 'neutral'
  END;

SELECT
  customername,
  SUM(amount) AS total_spent
FROM sales_performance
GROUP BY customername
ORDER BY total_spent DESC
LIMIT 5;

SELECT
  paymentmethod,
  COUNT(orderid) AS orders,
  SUM(amount) AS revenue
FROM sales_performance
GROUP BY paymentmethod;

SELECT
  TO_CHAR(orderdate, 'YYYY-MM') AS month,
  SUM(amount) AS total_revenue
FROM sales_performance
GROUP BY month
ORDER BY month;

