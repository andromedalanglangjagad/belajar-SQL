-- LIMIT & ALIASING
USE parks_and_recreation;


-- limit
-- Limit membatasi sebuah jumlah data dll
SELECT *
FROM employee_demographics
ORDER BY age DESC
limit 2, 1
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
limit 2, 1
;


-- Aliasing
SELECT gender, avg(age) AS avg_age
FROM employee_demographics
group by gender
HAVING avg_age > 40
;