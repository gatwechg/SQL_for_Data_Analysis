use sales

-- 1 — Regional Performance

-- total Sales
SELECT SUM(sales) AS total_revenue
FROM orders;

-- Total Profit for each region
SELECT SUM(profit) AS total_profit
FROM orders;

-- Which region should the company prioritize for expansion based on profitability and revenue contribution?

-- which rigion generate the most revenue 
SELECT region,SUM(sales) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- which product categories are most profitable
SELECT category,SUM(profit) AS total_profit
FROM orders
GROUP BY category
ORDER BY total_profit DESC;

-- The company should prioritize the West region for expansion, as it delivers the highest overall profitability and strong revenue performance


-- 2 — Shipping Mode Analysis

-- Number of orders
SELECT COUNT(Sales) AS number_of_orders
FROM orders;

-- Average sales per order for each shipping mode
SELECT `Ship Mode`,AVG(sales) AS average_sales_per_order
FROM orders
GROUP BY `Ship Mode`
ORDER BY average_sales_per_order DESC;
-- Which shipping method is most popular, and which generates the highest average order value?
-- Same Day is both the most popular and the most profitable shipping mode in terms of average order value.



-- 3 — Customer Segment Insights

-- Total profit
SELECT SUM(profit) AS total_profit
FROM orders; 

-- Average discount for each customer segment

SELECT Segment,AVG(discount) AS avg_discount
FROM orders
GROUP BY Segment;
-- Are we giving too much discount to any segment, and how is it affecting profit?
-- Consumer and Corporate segments are receiving the highest discounts (≈15.8%), which is likely eroding profit. The company should review and optimize discounts for these segments to improve overall profitability without hurting sales


-- 4 — Loss-Making Sub-Categories


-- Write a query to find sub-categories where total profit is negative.
SELECT `Sub-Category`, SUM(Profit) AS Total_Profit
FROM orders
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0;


-- Write a query to find the top 5 states by total sales, ordered from highest to lowest.
-- Which states are the top revenue generators, and where should regional managers focus their efforts?
SELECT state,SUM(sales) AS total_sales
FROM orders
GROUP BY state
ORDER BY total_sales DESC
LIMIT 5;


-- Write a query to find categories where the average discount is above 15%.
-- Which categories have high discounts, and is this hurting profitability?
SELECT category,AVG(discount) AS avg_discount
FROM orders
GROUP BY category
HAVING AVG(discount) > 0.15
ORDER BY avg_discount DESC;


-- Write a query to analyze the West region:
-- • Include total sales, total profit, average profit per order, and order count for each sub-category
-- • Only include sub-categories where total profit > 1000
-- • Order results by total profit descending
-- Which sub-categories in the West region are most profitable and worth prioritizing for growth?

SELECT `Sub-Category`, 
  SUM(Sales) AS total_sales,
  SUM(profit) AS total_profit,
  AVG(profit) AS avg_profit_per_order,
  COUNT(Sales) AS order_count
FROM orders
WHERE region = 'West'
GROUP BY `Sub-Category`
HAVING SUM(profit) > 1000
ORDER BY total_profit DESC;










