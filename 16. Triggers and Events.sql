-- Triggers and Events
-- Triggers untuk otomatis memberi respon terhadap perubahan data(entah penolakan,penerimaaan dll)
-- Events untuk melakukan task/tugas yang sudah dibuat & ditentukan kapanpun dijalankan secara otomatis


USE parks_and_recreation;

SELECT * 
FROM employee_salary;

SELECT * 
FROM employee_demographics;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Exntertainment 720 CEO', 1000000, NULL);



-- EVENTS

SELECT *
FROM employee_demographics;


DELIMITER $$
CREATE EVENT delete_retires
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;


-- PAKAI INI UNTUK MELIHAT APAKAH VARIABLE/EVENT ON ATAU OFF(HARUS ON UNTUK AKSES)
-- cara ON vvvvvvvv
		-- SET GLOBAL event_scheduler = ON;
SHOW VARIABLES LIKE 'event%';



-- SOAL GPT

-- ============================================
-- Soal 1: Trigger untuk Mencatat Perubahan Jabatan Karyawan
-- Buatlah trigger bernama `LogJobChange`
-- yang akan mencatat perubahan jabatan (`occupation`) karyawan 
-- di tabel baru `job_history`. 
-- Tabel `job_history` harus menyimpan `employee_id`, `old_occupation`, 
-- `new_occupation`, dan `change_date`.
-- Trigger harus berjalan saat ada perubahan pada `occupation` di `employee_salary`.

CREATE TABLE job_history(
	log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_occupation VARCHAR(50),
    new_occupation VARCHAR(50),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER $$
CREATE TRIGGER LogJobChange
	BEFORE UPDATE ON employee_salary
    FOR EACH ROW
BEGIN
	IF OLD.occupation <> NEW.occupation THEN
		INSERT INTO job_history(employee_id, old_occupation, new_occupation)
		VALUES(OLD.employee_id, OLD.occupation, NEW.occupation);
	END IF;
END $$
DELIMITER ;
-- ============================================


-- ============================================
-- Soal 2: Trigger untuk Mencegah Penghapusan Data Karyawan Direktur
-- Buatlah trigger bernama `PreventDirectorDeletion`
-- yang akan mencegah penghapusan (`DELETE`) data karyawan yang memiliki 
-- jabatan "Director of Parks and Recreation" di tabel `employee_salary`.
-- Jika ada upaya penghapusan, trigger harus membatalkan operasi tersebut.

DELIMITER $$
CREATE TRIGGER PreventDirectorDeletion
	BEFORE DELETE ON employee_salary
    FOR EACH ROW
BEGIN 
		IF occupation = 'Director of Parks and Recreation' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Penhapusan Karyawan tidak bisa dilakukan';
        END IF;
END $$
DELIMITER ;

select *
from employee_salary;
-- ============================================


-- ============================================
-- Soal 3: Trigger untuk Memperbarui Usia Karyawan Secara Otomatis
-- Buatlah trigger bernama `UpdateEmployeeAge`
-- yang akan memperbarui kolom `age` di `employee_demographics` 
-- berdasarkan `birth_date` setiap kali ada pembaruan data (`UPDATE`).
-- Usia dihitung dari `YEAR(CURDATE()) - YEAR(birth_date)`.

DELIMITER $$
CREATE TRIGGER UpdateEmployeeAge
	AFTER UPDATE ON employee_demographics
    FOR EACH ROW
BEGIN
	SET NEW.age = TIMESTAMPDIFF(YEAR, NEW.birth_date, CURDATE());
END $$
DELIMITER ;
-- ============================================


-- ============================================
-- Soal 4: Event untuk Menghapus Karyawan yang Tidak Memiliki Data Gaji
-- Buatlah event bernama `DeleteEmployeesWithoutSalary`
-- yang akan menghapus data karyawan dari tabel `employee_demographics` 
-- jika tidak memiliki data gaji di `employee_salary`.
-- Event ini harus dijalankan setiap bulan sekali.

DELIMITER $$
CREATE EVENT DeleteEmployeeWithoutSalary
ON SCHEDULE EVERY 1 MONTH
DO
	DELETE FROM employee_demographics
	WHERE employee_id NOT IN(SELECT employee_id FROM employee_salary);
DELIMITER ;
-- ============================================


-- ============================================
-- Soal 5: Event untuk Menaikkan Gaji Semua Karyawan Setiap Tahun
-- Buatlah event bernama `AnnualSalaryIncrease`
-- yang akan menaikkan gaji semua karyawan sebesar 5% setiap tanggal 1 Januari.
-- Perubahan gaji dilakukan di tabel `employee_salary`.

DELIMITER $$
CREATE EVENT AnnualSalaryIncrease
ON SCHEDULE EVERY 1 YEAR
STARTS TIMESTAMP(CONCAT(YEAR(CURDATE)) + 1, '-01-01 00:00:00')
DO
UPDATE employee_salary
SET employee_salary * 1.05;

DELIMITER ;
-- ============================================


-- ============================================
-- Soal 6: Event untuk Mereset Gaji Karyawan yang Keluar
-- Buatlah event bernama `ResetSalaryForExitedEmployees`
-- yang akan mengatur gaji karyawan menjadi NULL jika mereka sudah keluar dari pekerjaan.
-- Karyawan dianggap keluar jika tidak ada di `employee_demographics` tetapi masih ada di `employee_salary`.
-- Event ini harus berjalan setiap akhir bulan.

DELIMITER $$
CREATE EVENT ResetSalaryForExiterEmployees
ON SCHEDULE EVERY 1 MONTH
DELIMITER ;
-- ============================================



