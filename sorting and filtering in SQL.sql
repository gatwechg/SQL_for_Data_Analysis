SELECT *
FROM salesdata;


-- FILTERING IN USING WHERE STATEMENT

-- All Order from East Region
SELECT *
FROM  salesdata
where Region= "East";


-- All Orders for furniture category
SELECT *
FROM salesdata
where category= "furniture";


-- High value sales (Sales above 500)
SELECT *
FROM salesdata
WHERE Sales > 500;




-- SORTING DATA USING ORDER BY


-- High sales first (descending)
SELECT *
FROM salesdata
ORDER BY sales DESC;


-- High sales first(ascending)
SELECT *
FROM salesdata
ORDER BY sales;


-- Most profitable orders(ascending)
SELECT *
FROM salesdata
ORDER BY Profit DESC;

-- Highest sales from Texas(this is combination of WHERE/ORDER BY)
SELECT *
FROM salesdata
WHERE State = 'Texas'
ORDER BY Sales DESC;

-- Most profitable cities (5 rows)---(Limit 5)
SELECT city, profit
FROM salesdata
ORDER BY Profit DESC
limit 5;


-- Most profitable cities (5 rows)---(Unlimit)
SELECT city, profit
FROM salesdata
ORDER BY Profit DESC;
