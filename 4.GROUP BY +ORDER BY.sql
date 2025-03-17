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



-- SOAL GPT



-- ============================================
-- Soal 1: Hitung Jumlah Karyawan Berdasarkan Jabatan
-- Buatlah query yang menghitung jumlah karyawan berdasarkan jabatan (`occupation`) 
-- dari tabel `employee_salary`. Tampilkan nama jabatan dan jumlah karyawan dalam setiap jabatan.

SELECT occupation, COUNT(*) total_karyawan
FROM employee_salary
GROUP BY occupation; 

-- ============================================


-- ============================================
-- Soal 2: Rata-rata Gaji di Setiap Departemen
-- Buatlah query yang menghitung rata-rata gaji (`salary`) di setiap departemen (`dept_id`) 
-- pada tabel `employee_salary`. Tampilkan ID departemen dan rata-rata gaji.

SELECT dept_id, AVG(salary) AVG_GAJI
FROM employee_salary
GROUP BY dept_id;
-- ============================================


-- ============================================
-- Soal 3: Jumlah Karyawan Berdasarkan Gender
-- Buatlah query yang menghitung jumlah karyawan berdasarkan gender (`gender`) 
-- dari tabel `employee_demographics`. Tampilkan gender dan jumlah karyawan untuk setiap gender.

SELECT gender, COUNT(*) jumlah_karyawan
FROM employee_demographics
GROUP BY gender;
-- ============================================


-- ============================================
-- Soal 4: Urutkan Karyawan Berdasarkan Gaji (Tertinggi ke Terendah)
-- Buatlah query yang menampilkan semua karyawan dari tabel `employee_salary`,
-- dan urutkan berdasarkan gaji (`salary`) dari yang tertinggi ke terendah.

SELECT *
FROM employee_salary
ORDER BY salary DESC;
-- ============================================


-- ============================================
-- Soal 5: Urutkan Karyawan Berdasarkan Usia (Tertua ke Termuda)
-- Buatlah query yang menampilkan semua karyawan dari tabel `employee_demographics`, 
-- dan urutkan berdasarkan usia (dihitung dari `birth_date`).

SELECT *
FROM employee_demographics
ORDER BY birth_date ASC;
-- ============================================


-- ============================================
-- Soal 6: Urutkan Departemen Berdasarkan Jumlah Karyawan
-- Buatlah query yang menghitung jumlah karyawan di setiap departemen (`dept_id`) 
-- dan mengurutkannya dari jumlah karyawan terbanyak ke paling sedikit.

SELECT dept_id, COUNT(employee_id) jumlah_karyawan
FROM employee_salary
GROUP BY dept_id
ORDER BY jumlah_karyawan DESC;
-- ============================================

















