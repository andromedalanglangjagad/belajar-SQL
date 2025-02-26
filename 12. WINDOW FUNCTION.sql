-- WINDOWS FUNCTION
USE parks_and_recreation;


SELECT dem.first_name, dem.last_name, gender, AVG(salary) avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;



SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender) avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;



SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

-- ROW NUMBER untuk nomor urutan (unique tanpa duplikat)
-- RANK untuk sesuai posisi nomor (bisa duplikat)
-- DENSE RANK untuk sesuai urutan nomor (bisa duplikat)

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary DESC) row_num, 
RANK() OVER (PARTITION BY gender ORDER BY salary DESC) rank_num,
DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;



