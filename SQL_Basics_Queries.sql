
-- Select all Columns
SELECT * from students;


--  Select full name and course
SELECT full_name, course FROM students;


-- Retrieve a list of unique courses
SELECT DISTINCT course FROM students;


-- Rename full_name as 'Full Name
SELECT full_name AS "full name" from students;


-- Concatenate full_name and course as 'Student_Details
SELECT CONCAT(full_name, ' - ', course) AS Student_Details FROM students;

