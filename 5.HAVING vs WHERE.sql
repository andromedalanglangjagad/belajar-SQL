-- Having vs Where
USE parks_and_recreation;

SELECT gender, AVG(age) AVG_AGE
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

-- HAVING bisa digunakan setelah group by saja


SELECT occupation, AVG(salary) AVG_SALARY
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;



-- SOAL GPT

