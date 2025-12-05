SELECT *
FROM employee_demographics;


SELECT first_name
FROM parks_and_recreation.employee_demographics;


SELECT 
first_name, 
last_name, 
birth_date,
age + 10
FROM parks_and_recreation.employee_demographics;


-- PEMDAS(
-- P: Parentheses ()
-- E: Exponents (in SQL, usually POWER() function)
-- M/D: Multiplication/Division * / /
-- A/S: Addition/Subtraction + / -)

-- Multiplication
SELECT 
first_name, 
last_name, 
birth_date,
(age + 10) * 10
FROM parks_and_recreation.employee_demographics;


-- Multiplication and Addition
SELECT 
first_name, 
last_name, 
birth_date,
(age + 10) * 10 + 10
FROM parks_and_recreation.employee_demographics;


SELECT first_name
FROM parks_and_recreation.employee_demographics;

-- this is not unique values
SELECT gender
FROM parks_and_recreation.employee_demographics;


SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;


-- DISTINCT → is use to remove duplicates
SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;
