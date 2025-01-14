-- Joins
USE parks_and_recreation;

SELECT * 
FROM employee_demographics
;

SELECT * 
FROM employee_salary
;

-- INNER JOIN
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- OUTER JOIN
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;




