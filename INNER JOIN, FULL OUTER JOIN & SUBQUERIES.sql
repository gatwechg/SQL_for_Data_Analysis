USE retail

SELECT *
FROM orders;

                            -- SECTION A — INNER JOINS (6 Questions)

-- 1. Retrieve all orders with the customer name, city, product name, and sales amount.

SELECT 
    orders.Order_ID,
    customers.Customer_name,
    customers.City,
    products.Product_name,
    orders.Sales
FROM orders
INNER JOIN customers
    ON orders.Customer_ID = customers.Customer_ID
INNER JOIN products
    ON orders.Product_ID = products.Product_ID;



-- 2.  Show each customer’s total sales and total profit by merging Orders + Customers.

SELECT 
    customers.Customer_name,
	customers.City,
    SUM(orders.Sales) AS total_Sales,
	SUM(orders.profit) AS total_profit

FROM orders 
INNER JOIN customers 
    ON orders.Customer_ID = customers.Customer_ID
GROUP BY 
    customers.Customer_Name,
   customers.City;
   


-- 3. Identify the top 10 highest-value orders along with customer segment and product category


SELECT 
    orders.Order_ID,
    orders.Sales,
    customers.Customer_Name,
    customers.Segment,
    products.Product_ID,
    products.Category
FROM orders
INNER JOIN customers 
    ON orders.Customer_ID = customers.Customer_ID
INNER JOIN products 
    ON orders.Product_ID = products.Product_ID
ORDER BY orders.Sales DESC
LIMIT 10;



-- 4. List all orders where the product category is “Technology” and profit is above 100

SELECT 
     orders.Order_ID, 
     products.Product_Name,
     products.Category,
     customers.Customer_Name,
    orders.Profit
FROM orders
INNER JOIN products 
    ON products.Product_ID = orders.Product_ID
INNER JOIN customers 
    ON customers.Customer_ID = orders.Customer_ID
WHERE products.Category = 'Technology'
  AND orders.Profit > 100;



-- 5. Get a report showing each customer, the number of orders they placed, and their total quantity purchased.

SELECT 
    customers.Customer_Name,
    COUNT(orders.Order_ID) AS Number_of_Orders,
    SUM(orders.Quantity) AS Total_Quantity
FROM orders 
INNER JOIN customers 
    ON orders.Customer_ID = customers.Customer_ID
GROUP BY 
    customers.Customer_Name
ORDER BY 
    Number_of_Orders DESC;



-- 6. Find all customers who bought more than one product category (use JOIN + GROUP BY)

SELECT 
    customers.Customer_Name,
    COUNT(DISTINCT products.Category) AS Categories_Bought
FROM orders 
INNER JOIN customers 
    ON orders.Customer_ID = customers.Customer_ID
INNER JOIN products 
    ON orders.Product_ID = products.Product_ID
GROUP BY 
    customers.Customer_Name
HAVING 
    COUNT(DISTINCT products.Category) > 1;
    
                             
                             
                             
                             -- SECTION B — FULL OUTER JOIN (MySQL Emulated) (6 Questions)
    
    -- 7. Create a full list of customers and orders, showing customers with no orders and orders with invalid customer IDs.
    SELECT
		products.Product_ID,
		products.Product_Name,
		products.Category,
		orders.Order_ID,
		orders.Order_Date,
		orders.Quantity
        FROM products
        LEFT JOIN orders
			ON  products.Product_ID = orders.Product_ID
            
            UNION

 SELECT
		products.Product_ID,
		products.Product_Name,
		products.Category,
		orders.Order_ID,
		orders.Order_Date,
		orders.Quantity
        FROM products
        RIGHT JOIN orders
              ON  products.Product_ID = orders.Product_ID
 ORDER BY 
 Product_ID,
 Order_ID;
 
 
 
 
 -- 8. Using a FULL OUTER JOIN, find all products AND all orders, showing products never ordered and orders with invalid product IDs.
 
 SELECT
		products.Product_ID,
		products.Product_Name,
		products.Category,
		orders.Order_ID,
		orders.Order_Date,
		orders.Quantity
        FROM products
        INNER JOIN orders
            ON  products.Product_ID = orders.Product_ID
        ORDER BY    
        Products.Product_ID,
        Orders. Order_ID;
        
        
        -- 9. Build a full audit of customer–product interactions: every customer AND every product, showing matched and unmatched records.
        
 SELECT
		customers.Customer_ID,
		customers.Customer_Name,
        products.Product_ID,
        products.Product_Name,
		orders.Order_ID,
		orders.Quantity,
        orders.Sales,
        orders.Order_Date
FROM customers
LEFT JOIN orders
	ON customers.Customer_ID = orders.Customer_ID
RIGHT JOIN products
	ON products.Product_ID = orders.Product_ID
ORDER BY 
      customers.Customer_ID,
      products.Category,
      orders.Order_ID;
      
  -- 10.Show a complete dataset of customer segments and product categories purchased   — including segments with no purchases and categories never bought. 


SELECT
    customers.Segment AS Customer_Segment,
    products.Category AS Product_Category,
    COALESCE(SUM(orders.Sales), 0) AS Total_Sales,
    COALESCE(SUM(orders.Quantity), 0) AS Total_Quantity,
    COUNT(orders.Order_ID) AS Number_of_Orders
FROM customers
RIGHT JOIN orders
    ON customers.Customer_ID = orders.Customer_ID
RIGHT JOIN products
    ON orders.Product_ID = products.Product_ID
GROUP BY
    customers.Segment,
    products.Category
ORDER BY
    Customer_Segment,
    Product_Category;




  -- 11.Produce a full list comparing customers and regions, highlighting customers assigned to regions with zero orders.

SELECT
    customers.Customer_ID,
    customers.Customer_Name,
    customers.Region,
    COALESCE(COUNT(orders.Order_ID), 0) AS Number_of_Orders
FROM customers
LEFT JOIN orders
    ON customers.Customer_ID = orders.Customer_ID
GROUP BY
    customers.Customer_ID,
    customers.Customer_Name,
    customers.Region
ORDER BY
    customers.Region,
    customers.Customer_Name;
   
   
-- 12.Create a full reconciliation between Products and Orders showing:

SELECT
    products.Product_ID,
    products.Product_Name,
    products.Category,
    orders.Order_ID,
    orders.Customer_ID,
    orders.Quantity,
    orders.Sales
FROM products
LEFT JOIN orders
    ON products.Product_ID = orders.Product_ID

UNION


SELECT
    products.Product_ID,
    products.Product_Name,
    products.Category,
    orders.Order_ID,
    orders.Customer_ID,
    orders.Quantity,
    orders.Sales
FROM products
RIGHT JOIN orders
    ON products.Product_ID = orders.Product_ID

ORDER BY Product_ID, Order_ID;  



-- 13.Find all products priced above the overall average price.
   
    SELECT
    Product_ID,
    Product_Name,
    Category,
    Price
FROM products
WHERE Price > (SELECT AVG(Price) FROM products)
ORDER BY Price DESC;

-- insight: these are all products priced above the overall average price.for




-- 14. Identify orders that have sales above the average order sales for their product category.

SELECT
    orders.Order_ID,
    orders.Customer_ID,
    orders.Product_ID,
    products.Category,
    orders.Sales
FROM orders
JOIN products
    ON orders.Product_ID = products.Product_ID
WHERE orders.Sales > (
    SELECT AVG(orders.Sales)
    FROM orders
    JOIN products
        ON orders.Product_ID = products.Product_ID
    WHERE products.Category = products.Category
)
ORDER BY products.Category, orders.Sales DESC;

-- insight: these are orders that have sales above the average order sales for their product category.



   
-- 15. List customers whose total spending is above the average total spending across all customers  

  SELECT
    customers.Customer_ID,
    customers.Customer_Name,
    SUM(orders.Sales) AS Total_Spending
FROM customers
JOIN orders
    ON customers.Customer_ID = orders.Customer_ID
GROUP BY
    customers.Customer_ID,
    customers.Customer_Name
HAVING
    SUM(orders.Sales) > (
        SELECT AVG(customer_total)
        FROM (
            SELECT SUM(orders.Sales) AS customer_total
            FROM customers
            JOIN orders
                ON customers.Customer_ID = orders.Customer_ID
            GROUP BY customers.Customer_ID
        ) AS customer_totals
    )
ORDER BY Total_Spending DESC;

-- insight: these are customers whose total spending is above the average total spending across all customers.





-- 16. Find products whose price is below the average price within their category (category-level benchmark).

SELECT
    Product_ID,
    Product_Name,
    Category,
    Price
FROM products
WHERE Price < (
    SELECT AVG(Price)
    FROM products
    WHERE Category = products.Category
)
ORDER BY Category, Price ASC;

-- insight: these are products whose price is below the average price within their category.





-- 17.For each customer, show their total spending and include a column comparing it to the average customer spending (above/below benchmark).

SELECT
    customers.Customer_ID,
    customers.Customer_Name,
    SUM(orders.Sales) AS Total_Spending,
    CASE
        WHEN SUM(orders.Sales) > (
            SELECT AVG(customer_total)
            FROM (
                SELECT SUM(orders.Sales) AS customer_total
                FROM customers
                JOIN orders
                    ON customers.Customer_ID = orders.Customer_ID
                GROUP BY customers.Customer_ID
            ) AS avg_totals
        ) THEN 'Above Benchmark'
        ELSE 'Below Benchmark'
    END AS Spending_Comparison
FROM customers
JOIN orders
    ON customers.Customer_ID = orders.Customer_ID
GROUP BY
    customers.Customer_ID,
    customers.Customer_Name
ORDER BY Total_Spending DESC;

-- insight: this is for each customer showing their total spending and include a column comparing it to the average customer spending (above/below benchmark).




-- 18.Identify the top 3 customer segments by total revenue using a subquery in the FROM clause.

SELECT
    segment_totals.Customer_Segment,
    segment_totals.Total_Revenue
FROM
    (
        SELECT
            customers.Segment AS Customer_Segment,
            SUM(orders.Sales) AS Total_Revenue
        FROM customers
        JOIN orders
            ON customers.Customer_ID = orders.Customer_ID
        GROUP BY customers.Segment
    ) AS segment_totals
ORDER BY segment_totals.Total_Revenue DESC
LIMIT 3;

-- insight: these are top 3 customer segments by total revenue using a subquery in the FROM clause.





-- 19.Find customers who have ordered items from at least two different categories AND whose total spending is above average (JOIN + SUBQUERY hybrid).
   
   SELECT
    customers.Customer_ID,
    customers.Customer_Name,
    COUNT(DISTINCT products.Category) AS Category_Count,
    SUM(orders.Sales) AS Total_Spending
FROM customers
JOIN orders
    ON customers.Customer_ID = orders.Customer_ID
JOIN products
    ON orders.Product_ID = products.Product_ID
GROUP BY
    customers.Customer_ID,
    customers.Customer_Name
HAVING
    COUNT(DISTINCT products.Category) >= 2
    AND SUM(orders.Sales) > (
        SELECT AVG(customer_total)
        FROM (
            SELECT SUM(orders.Sales) AS customer_total
            FROM customers
            JOIN orders
                ON orders.Customer_ID = orders.Customer_ID
            GROUP BY customers.Customer_ID
        ) AS avg_totals
    )
ORDER BY Total_Spending DESC;

-- insight:these are customers who have ordered items from at least two different categories AND whose total spending is above average (JOIN + SUBQUERY hybrid



-- 20.Show all customers who have ordered products priced higher than the category average (subquery + join filtering).

SELECT DISTINCT
    customers.Customer_ID,
    customers.Customer_Name,
    orders.Order_ID,
    products.Product_ID,
    products.Product_Name,
    products.Category,
    products.Price
FROM customers
JOIN orders
    ON customers.Customer_ID = orders.Customer_ID
JOIN products
    ON orders.Product_ID = products.Product_ID
WHERE products.Price > (
    SELECT AVG(products.Price)
    FROM products
    WHERE products.Category = products.Category
)
ORDER BY customers.Customer_ID, products.Category, products.Price DESC;

-- insight: these are all customers who have ordered products priced higher than the category average. 
