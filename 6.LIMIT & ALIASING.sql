-- LIMIT & ALIASING
USE parks_and_recreation;


-- limit
-- Limit membatasi sebuah jumlah data dll
SELECT *
FROM employee_demographics
ORDER BY age DESC
limit 2, 1
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
limit 2, 1
;


-- Aliasing
SELECT gender, avg(age) AS avg_age
FROM employee_demographics
group by gender
HAVING avg_age > 20
;

-- SOAL GPT

-- ============================================
-- Soal 1: Menampilkan 5 Karyawan dengan Gaji Tertinggi
-- Buatlah query yang menampilkan 5 karyawan dengan gaji tertinggi dari tabel `employee_salary`.
-- Gunakan alias untuk kolom nama (`first_name` dan `last_name`) agar ditampilkan sebagai `Nama_Karyawan`.
-- Pastikan hasil diurutkan dari gaji tertinggi ke terendah dan hanya menampilkan 5 data teratas.

SELECT CONCAT(first_name, ' ',last_name) Nama_karyawan, occupation, salary gaji_tertinggi
FROM employee_salary
ORDER BY gaji_tertinggi DESC
LIMIT 5
;

SELECT *
FROM employee_salary
;
-- ============================================


-- ============================================
-- Soal 2: Menampilkan 3 Karyawan Termuda yang Masih Bekerja
-- Buatlah query yang menampilkan 3 karyawan termuda yang masih aktif bekerja di tabel `employee_demographics`.
-- Gunakan alias untuk `birth_date` menjadi `Tanggal_Lahir` dan `first_name` menjadi `Nama_Depan`.
-- Urutkan hasil berdasarkan usia termuda dan batasi hasilnya hanya 3 orang.

SELECT CONCAT(first_name, ' ', last_name) Nama_lengkap, birth_date Tanggal_Lahir, age 
FROM employee_demographics
ORDER BY age ASC
LIMIT 3
;
-- ============================================


-- ============================================
-- Soal 3: Menampilkan Jumlah Karyawan per Departemen dengan Minimal 5 Orang
-- Buatlah query yang menghitung jumlah karyawan di setiap departemen (`dept_id`).
-- Gunakan alias `Jumlah_Karyawan` untuk hasil COUNT.
-- Gunakan klausa HAVING agar hanya departemen dengan minimal 5 karyawan yang ditampilkan.
-- Urutkan hasil berdasarkan jumlah karyawan dari yang terbanyak ke paling sedikit.

SELECT dept_id, COUNT(*) AS Jumlah_karyawan
FROM employee_salary
GROUP BY dept_id
HAVING COUNT(*) >= 1
ORDER BY Jumlah_karyawan DESC
LIMIT 5
;
-- ============================================


-- ============================================
-- Soal 4: Menampilkan 10 Karyawan dengan Nama Mengandung Huruf 'A'
-- Buatlah query yang menampilkan maksimal 10 karyawan dari tabel `employee_demographics`
-- yang memiliki huruf 'A' dalam nama depan (`first_name`).
-- Gunakan alias `Nama_Karyawan` untuk kolom nama lengkap (`first_name` + ' ' + `last_name`).
-- Urutkan berdasarkan `first_name` secara alfabetis.
-- ============================================


-- ============================================
-- Soal 5: Menampilkan Departemen dengan Rata-rata Gaji Tertinggi
-- Buatlah query yang menghitung rata-rata gaji (`salary`) di setiap departemen (`dept_id`).
-- Gunakan alias `Rata_Rata_Gaji` untuk hasil AVG.
-- Urutkan hasil berdasarkan rata-rata gaji dari yang tertinggi ke terendah.
-- Batasi hasilnya hanya menampilkan 5 departemen teratas.
-- ============================================




