-- Stored Procedures
USE parks_and_recreation;



DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries3();


DELIMITER $$
CREATE PROCEDURE large_salaries4(huggymuffin INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = huggymuffin
    ;
END $$
DELIMITER ;

CALL large_salaries4(1)


-- SOAL GPT

-- ============================================
-- Soal 1: Stored Procedure untuk Menampilkan Semua Karyawan
-- Buatlah stored procedure bernama `GetAllEmployees`
-- yang akan menampilkan seluruh data karyawan dari tabel `employee_demographics`.
-- Stored procedure harus bisa dipanggil dengan:
-- CALL GetAllEmployees();

DELIMITER $$
CREATE PROCEDURE GetAllEmployees()
BEGIN
	SELECT *
	FROM employee_demographics
	;
END $$
DELIMITER ;

CALL GetAllEmployees();

-- ============================================


-- ============================================
-- Soal 2: Stored Procedure untuk Menampilkan Karyawan Berdasarkan ID
-- Buatlah stored procedure bernama `GetEmployeeByID`
-- yang menerima satu parameter (employee_id) dan mengembalikan 
-- data karyawan dengan ID tersebut dari tabel `employee_demographics`.
-- Parameter yang digunakan: emp_id INT
-- Stored procedure harus bisa dipanggil dengan:
-- CALL GetEmployeeByID(3);

DELIMITER $$
CREATE PROCEDURE GetEmployeeByID(emp_id INT)
BEGIN
	SELECT *
	FROM employee_demographics
	WHERE employee_id = emp_id
	;
END $$
DELIMITER ;

CALL GetEmployeeByID(3);

-- ============================================


-- ============================================
-- Soal 3: Stored Procedure untuk Menghitung Jumlah Karyawan Berdasarkan Gender
-- Buatlah stored procedure bernama `GetTotalEmployeesByGender`
-- yang menerima satu parameter (gender) dan mengembalikan jumlah 
-- karyawan berdasarkan jenis kelamin dari tabel `employee_demographics`.
-- Parameter yang digunakan: gender VARCHAR(10)
-- Stored procedure harus bisa dipanggil dengan:
-- CALL GetTotalEmployeesByGender('Female');

DELIMITER $$
CREATE PROCEDURE GetTotalEmployeesByGender(gender1 Varchar(10))
BEGIN 
	SELECT *
	FROM employee_demographics
	WHERE gender = gender1
	;
END $$
DELIMITER ;

CALL GetTotalEmployeesByGender('Female');

-- ============================================


-- ============================================
-- Soal 4: Stored Procedure untuk Menaikkan Gaji Berdasarkan Jabatan
-- Buatlah stored procedure bernama `UpdateSalaryByOccupation`
-- yang akan menambahkan gaji sebesar 10% untuk semua karyawan 
-- berdasarkan jabatan (`occupation`) di tabel `employee_salary`.
-- Parameter yang digunakan: job_title VARCHAR(50)
-- Stored procedure harus bisa dipanggil dengan:
-- CALL UpdateSalaryByOccupation('Office Manager');

DELIMITER $$
CREATE PROCEDURE UpdateSalaryByOccupation(job_title VARCHAR(50))
BEGIN
SELECT *
FROM employee_salary
WHERE salary * 1.1
;
END $$
DELIMITER ;




-- ============================================


-- ============================================
-- Soal 5: Stored Procedure untuk Mendapatkan Karyawan dengan Gaji Tertinggi
-- Buatlah stored procedure bernama `GetHighestSalaryEmployee`
-- yang akan mengembalikan nama lengkap (`first_name`, `last_name`) 
-- dan gaji (`salary`) dari karyawan dengan gaji tertinggi di tabel `employee_salary`.
-- Stored procedure harus bisa dipanggil dengan:
-- CALL GetHighestSalaryEmployee();
-- ============================================








