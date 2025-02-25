USE parks_and_recreation;

SELECT first_name, 
last_name,
CASE
	WHEN age <=30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN "On Death's Door"
END Age_Bracket
FROM employee_demographics;


-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

Select first_name, last_name, salary, 
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
	WHEN salary > 50000 THEN salary * 1.07
    
END NEW_SALARY,
CASE
	WHEN dept_id = 6 THEN salary * .10
END NEW_SALARY
From employee_salary;



SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

