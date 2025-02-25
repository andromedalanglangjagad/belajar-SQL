SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT distinct first_name
FROM parks_and_recreation.employee_demographics;
# distinct untuk menampilkan hanya nilai unique(1 value saja untuk berapapun jumlah dari value tsb)

SELECT last_name, age, gender
FROM parks_and_recreation.employee_demographics;

SELECT first_name,
age,
(age + 10) * 10
FROM parks_and_recreation.employee_demographics;
#tes aja sih

select MAX(salary)
from parks_and_recreation.employee_salary;