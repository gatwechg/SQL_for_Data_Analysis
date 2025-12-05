-- GROUP BY

SELECT *
FROM employee_demographics;


SELECT gender 
FROM employee_demographics
GROUP BY gender;



-- average 
SELECT gender, AVG (age)
FROM employee_demographics
GROUP BY gender;

-- Average , Max, Min, count
SELECT gender, AVG (age), MAX(age), MIN(age), count(age)
FROM employee_demographics
GROUP BY gender;




-- occupation
SELECT occupation
FROM employee_salary
GROUP BY occupation;


-- occupation and salary
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;



-- ODER BY
 -- ASC
SELECT *
FROM employee_demographics
ORDER BY first_name ASC;

-- DESC
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;


SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;
