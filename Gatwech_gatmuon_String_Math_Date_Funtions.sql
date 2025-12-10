USE Sales
SELECT *
FROM orders;
-- 1. How many products in total were chairs?

SELECT COUNT(*) AS total_chairs
FROM orders
WHERE `Product Name` = 'Chairs';


-- 2. Create a new column that combines Customer Name and City into a single label.

SELECT 
    `Customer Name`,
    City,
    CONCAT(`Customer Name`, ' - ', City) AS Customer_Label
FROM orders;


-- 3. Find all states whose names start with the letter “C”.

SELECT DISTINCT State
FROM orders
WHERE State LIKE 'C%';


-- Calculate the profit margin (Profit ÷ Sales × 100) for each product and round it to 2 decimals.
  
SELECT
    `Product Name`,
    Sales,
    Profit,
    ROUND((Profit / Sales) * 100, 2) AS Profit_Margin
FROM orders;



-- 5. Find the average discount given per order and round it to 2 decimals.

SELECT 
    ROUND(AVG(Discount), 2) AS Avg_Discount_Per_Order
FROM orders;


-- 6.Identify the top 5 orders with the highest totel sales.

SELECT
    `Order ID`,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Order ID`
ORDER BY total_Sales DESC
LIMIT 5;




-- 7. Calculate monthly total sales and profit using month names; which month had the highest sales?

SELECT
    MONTHNAME(`Order Date`) AS Month_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY MONTHNAME(`Order Date`), MONTH(`Order Date`)
ORDER BY MONTH(`Order Date`);


-- 8. Determine which year had the highest profit.

SELECT
    YEAR(`Order Date`) AS Year,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY YEAR(`Order Date`)
ORDER BY Total_Profit DESC;


-- 9. Find the average shipping days (DATEDIFF (Ship Date, Order Date)) per category.

SELECT
    Category,
    ROUND(AVG(DATEDIFF(`Ship Date`, `Order Date`)), 2) AS Avg_Shipping_Days
FROM orders
GROUP BY Category;



-- 10. Count how many orders were placed in the last 30 days (assume today is 3rd April 2017).

SELECT
    COUNT(*) AS Orders_Last_30_Days
FROM orders
WHERE `Order Date` BETWEEN DATE('2017-04-03') - INTERVAL 30 DAY AND DATE('2017-04-03');