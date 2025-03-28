-- CTEs
USE parks_and_recreation;


-- pengganti alias vvvvvvvvvvvvvvvv
WITH CTE_Example(JENIS, RATARATA, MAKSIMAL, MINIMAL, TOTAL) AS 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;

-- CONTOH SALAH UNTUK PENULISAN CTEs
SELECT AVG(avg_sal)
FROM (
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;

SELECT AVG(avg_sal)
FROM CTE_Example;


-- CONTOH UNTUK PENGGUNAAN 2 VIRTUAL TABLE
WITH CTE_Example AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id, salary
FROM employee_Salary
WHERE salary > 5000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	on CTE_Example.employee_id = CTE_Example2.employee_id
;












