-- String Functions
USE parks_and_recreation;

-- LENGTH untuk panjang sesuatu
-- UPPER LOWWER untuk penulisan
-- RTRIM untuk penempatan
-- SUBSTRING(nama variabel, letak mulai variabel, jumklah variabel) pemotongan/pemilihan variabel
-- REPLACE untuk penempatan/perpindahan ulang variabel
-- LOCATE untuk mencari letak variabel
-- CONCAT untuk menggabungkan 2 variabel







SELECT LENGTH('SKYFALL');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;


SELECT UPPER('sky');
SELECT LOWER('sky');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;


SELECT RTRIM('           strength             ');


SELECT first_name, LEFT(first_name, 4)
FROM employee_demographics;

SELECT first_name, RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date,6,2) AS Month
FROM employee_demographics;


SELECT first_name, REPLACE(first_name, 'A', 'z')
FROM employee_demographics;


SELECT LOCATE('x', 'Alexander');


SELECT first_name, LOCATE('ril', first_name)
FROM employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;