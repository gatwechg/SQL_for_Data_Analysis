-- where clause

SELECT *
FROM employee_salary;


SELECT *
FROM employee_salary
WHERE first_name = 'Leslie';



SELECT *
FROM employee_salary
WHERE salary > 50000;


SELECT *
FROM employee_salary
WHERE salary >= 50000;


SELECT *
FROM employee_salary
WHERE salary < 50000;


SELECT *
FROM employee_salary
WHERE salary <= 50000;



SELECT *
FROM employee_demographics;

-- this will display the name of the female
SELECT *
FROM employee_demographics
WHERE gender= 'female'
;



-- Not equal to and it look like the an exclamation point and an equal sign
SELECT *
FROM employee_demographics
WHERE gender != 'female' -- Not equal to
;





SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;



-- AND  OR   NOT  Logical Operators


-- Selecting the birth date  1985 and it must be male

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender= 'male'
;



-- OR it show that the birth date will be true or the gender will be true

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender= 'male'
;

-- the birth date could be graeter than 1985 or it could not be equal to male which is female 

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender= 'male'
;


SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;



-- LIKE statement
-- % and _

SELECT *
FROM employee_demographics
WHERE first_name = 'Jerry';




SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%';


SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%';



SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___';


SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';


SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%';