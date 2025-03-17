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



-- SOAL GPT
USE parks_and_recreation;

-- ============================================
-- Soal 1: Menampilkan Data Karyawan yang Berusia di Atas 40 Tahun
-- Pemerintah kota ingin mengetahui daftar karyawan yang berusia lebih dari 40 tahun.
-- Gunakan tabel `employee_demographics` untuk mendapatkan daftar tersebut.

SELECT *
FROM employee_demographics
WHERE age >40;
-- ============================================


-- ============================================
-- Soal 2: Menampilkan Karyawan dengan Gaji di Bawah 50,000
-- Administrasi ingin melihat daftar karyawan yang memiliki gaji kurang dari 50,000.
-- Gunakan tabel `employee_salary` untuk mendapatkan daftar karyawan tersebut.

SELECT * 
FROM employee_salary
WHERE salary < 50000;

-- ============================================


-- ============================================
-- Soal 3: Menampilkan Karyawan yang Bekerja di Departemen Parks and Recreation
-- Pemerintah kota ingin melihat semua karyawan yang bekerja di departemen 
-- "Parks and Recreation". 
-- Gunakan tabel `employee_salary` yang berisi `dept_id`, dan cocokkan dengan 
-- tabel `parks_departments` untuk mendapatkan nama departemen.

SELECT *
FROM employee_salary
WHERE dept_id = 1;

SELECT *
FROM parks_departments;

-- ============================================


-- ============================================
-- Soal 4: Menampilkan Karyawan yang Tidak Memiliki Data Gaji
-- Beberapa karyawan mungkin belum memiliki data gaji di tabel `employee_salary`.
-- Administrasi ingin melihat daftar karyawan yang belum memiliki data gaji.
-- Gunakan `employee_demographics` dan cari karyawan yang tidak memiliki `employee_id`
-- di `employee_salary`.

SELECT *
FROM employee_salary
WHERE employee_id NOT IN(SELECT employee_id FROM employee_demographics);

SELECT * FROM employee_salary;

SELECT * FROM employee_demographics;
-- ============================================


-- ============================================
-- Soal 5: Menampilkan Karyawan yang Lahir di Bulan Maret
-- HR ingin melihat semua karyawan yang lahir di bulan Maret untuk merencanakan 
-- perayaan ulang tahun bersama.
-- Gunakan tabel `employee_demographics` dan ambil data karyawan yang memiliki
-- `birth_date` di bulan Maret.


-- ============================================













