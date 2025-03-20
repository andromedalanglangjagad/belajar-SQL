-- Joins
USE parks_and_recreation;

SELECT * 
FROM employee_demographics
;

SELECT * 
FROM employee_salary
;

-- INNER JOIN
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- OUTER JOIN
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Self Join
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;


-- JOINING MULTIPLE TABLE

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_departments;


-- SOAL GPT

-- ============================================
-- Soal 1: Menampilkan Data Karyawan dan Departemen
-- Tampilkan employee_id, first_name, dan department_name dari tabel employee_demographics
-- dan department dengan menggunakan INNER JOIN. Hanya tampilkan karyawan yang memiliki departemen.

SELECT dem.employee_id, dem.first_name, par.department_name
FROM employee_demographics dem
INNER JOIN parks_departments par
	ON dem.employee_id = par.department_id
;
-- ============================================

-- ============================================
-- Soal 2: Menampilkan Semua Karyawan Beserta Departemennya
-- Gunakan LEFT JOIN untuk menampilkan semua karyawan dari employee_demographics,
-- termasuk yang tidak memiliki departemen. Jika tidak memiliki departemen, tampilkan NULL.

SELECT *
FROM employee_demographics dem
LEFT JOIN parks_departments par
	ON dem.employee_id = par.department_id
;
-- ============================================

-- ============================================
-- Soal 3: Menampilkan Semua Departemen Beserta Karyawannya
-- Gunakan RIGHT JOIN untuk menampilkan semua departemen dan karyawan yang bekerja di departemen tersebut.
-- Jika ada departemen tanpa karyawan, tetap tampilkan dengan nilai NULL di kolom karyawan.
-- ============================================

-- ============================================
-- Soal 4: Menampilkan Semua Data dari Kedua Tabel
-- Gunakan UNION dari LEFT JOIN dan RIGHT JOIN untuk membuat efek FULL JOIN,
-- sehingga menampilkan semua karyawan dan semua departemen, termasuk yang tidak memiliki pasangan.
-- ============================================

-- ============================================
-- Soal 5: Menampilkan Semua Kombinasi Karyawan dan Departemen
-- Gunakan CROSS JOIN untuk menampilkan semua kombinasi antara karyawan dan departemen.
-- Pastikan tidak ada kondisi ON agar menghasilkan perkalian Cartesian.
-- ============================================

-- ============================================
-- Soal 6: Menampilkan Nama Karyawan dan Nama Manajernya
-- Gunakan SELF JOIN pada tabel employee_demographics untuk menampilkan employee_id, first_name karyawan,
-- serta first_name manajer mereka berdasarkan kolom manager_id.
-- ============================================

