-- Limit + Aliasing


-- Limit
SELECT *
FROM employee_demographics
limit 3;


SELECT *
FROM employee_demographics
ORDER BY age DESC
limit 3;


SELECT *
FROM employee_demographics
ORDER BY age DESC
limit 2, 1;


-- Aliasing

SELECT gender, AVG (age)
FROM  employee_demographics
GROUP BY gender
HAVING AVG (age) >40;


SELECT gender, AVG (age) AS avg_age
FROM  employee_demographics
GROUP BY gender
HAVING avg_age >40;