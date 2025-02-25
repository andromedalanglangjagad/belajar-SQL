-- WINDOWS FUNCTION
USE parks_and_recreation;


SELECT dem.first_name, dem.last_name, gender, AVG(salary) avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;



SELECT dem.first_name, dem.last_name, gender,  AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;










