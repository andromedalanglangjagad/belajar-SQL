-- WHERE Clause

SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie';

SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
;

-- AND or NOT -- Logical Operators

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

-- OR NOT sama dengan (!=)

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name =  'Leslie' AND age = 44) OR age > 55
;

-- LIKE STATEMENT
-- % and _  
-- (% tanda untuk mengisi semua kekosongan sebuah data entah diakhir,awal ataupun tengah seterusnya)
-- (_ tanda untuk mengisi 1 kekosongan karakter)
-- (% and _ bisa dipakai untuk str/int dll selama penulisannya lengkap dan jelas)
SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name LIKE 'a__';