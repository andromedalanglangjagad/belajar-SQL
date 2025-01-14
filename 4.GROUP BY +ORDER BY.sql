USE parks_and_recreation;
-- AVG(value) untuk rata" sebuah data yang diambil dari value


SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY 5, age
;

-- (ASC) untuk abjad dari A, (DESC) untuk abjad dari Z
-- usahakan order by diawali dengan data berkategori/beraturan dibanding data unique/beragam
-- angka/urutan tabel bisa dipakai sebagai pengganti nama tabel

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;