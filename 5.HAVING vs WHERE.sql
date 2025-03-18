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

-- ============================================
-- Soal 1: Menampilkan Karyawan dengan Gaji Lebih dari 50.000 (WHERE)
-- Buatlah query untuk menampilkan daftar karyawan yang memiliki gaji lebih dari 50.000.
-- Kolom yang ditampilkan: first_name, last_name, salary, dept_id
-- Gunakan klausa WHERE untuk memfilter data sebelum pengelompokan.

SELECT first_name, last_name, salary, dept_id
FROM employee_salary
WHERE salary > 50000
;
-- ===========================================


-- ============================================
-- Soal 2: Menghitung Jumlah Karyawan di Setiap Departemen (GROUP BY)
-- Buatlah query yang menghitung jumlah karyawan di setiap departemen.
-- Kolom yang ditampilkan: dept_id, jumlah_karyawan
-- Gunakan fungsi COUNT() dan GROUP BY untuk mengelompokkan data berdasarkan dept_id.

SELECT dept_id, COUNT(*) jumlah_karyawan
FROM employee_salary
GROUP BY dept_id
;
-- ============================================


-- ============================================
-- Soal 3: Menampilkan Departemen dengan Lebih dari 3 Karyawan (GROUP BY + HAVING)
-- Buatlah query untuk menghitung jumlah karyawan di setiap departemen
-- tetapi hanya menampilkan departemen yang memiliki lebih dari 3 karyawan.
-- Kolom yang ditampilkan: dept_id, jumlah_karyawan
-- Gunakan GROUP BY untuk mengelompokkan, dan HAVING untuk memfilter hasil agregasi.
-- ============================================


-- ============================================
-- Soal 4: Menampilkan Rata-rata Gaji per Jabatan dengan Minimal 2 Karyawan (GROUP BY + HAVING)
-- Buatlah query yang menghitung rata-rata gaji untuk setiap jabatan (occupation)
-- tetapi hanya menampilkan jabatan yang memiliki minimal 2 karyawan.
-- Kolom yang ditampilkan: occupation, rata_rata_gaji, jumlah_karyawan
-- Gunakan GROUP BY untuk mengelompokkan, dan HAVING untuk memfilter jabatan dengan COUNT() >= 2.
-- ============================================


-- ============================================
-- Soal 5: Menampilkan Karyawan dengan Gaji Lebih dari 40.000 dalam Departemen yang Memiliki Minimal 2 Karyawan (WHERE + GROUP BY + HAVING)
-- Buatlah query yang menghitung jumlah karyawan dalam setiap departemen
-- tetapi hanya untuk karyawan yang memiliki gaji lebih dari 40.000.
-- Tampilkan hanya departemen yang memiliki minimal 2 karyawan setelah penyaringan gaji.
-- Kolom yang ditampilkan: dept_id, jumlah_karyawan
-- Gunakan WHERE untuk menyaring gaji, GROUP BY untuk mengelompokkan, dan HAVING untuk memfilter jumlah karyawan.
-- ============================================
