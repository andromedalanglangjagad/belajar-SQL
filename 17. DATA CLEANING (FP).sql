-- DATA CLEANING
USE world_layoffs;




SELECT *
FROM layoffs
;


-- 1.Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or blank values
-- 4. Remove Any Columns 

-- A buat table untuk stagging dengan struktur table utama :
CREATE TABLE layoffs_stagging
LIKE layoffs;

-- B. Cek apakah sudah sesuai struktur table utama :
SELECT *
FROM layoffs_stagging
;

-- C. Masukan data table utama ke table stagging :
INSERT layoffs_stagging
SELECT * 
FROM layoffs
;

-- D. Tandai jumlah baris(ROW) yang memiliki data berbeda/Unique
-- 		ada di table stagging :
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) ROW_NUM
FROM layoffs_stagging
;

-- E. Masukkan penanda jumlah baris ke virtual table untuk mengetahui 
-- 		apakah ada data yang sama dalam perhitungan baris :
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`,stage, country
, funds_raised_millions) ROW_NUM
FROM layoffs_stagging
)
SELECT *
FROM duplicate_cte
WHERE ROW_NUM > 1;

-- F. Cek satu persatu untuk data yang sama dan  memiliki lebih dari satu baris 
-- 		yang berada di table stagging :
SELECT *
FROM layoffs_stagging2
WHERE company = 'Yahoo';


-- G. Hapus data yang tidak diinginkan di dalam virtual table :
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`,stage, country
, funds_raised_millions) ROW_NUM
FROM layoffs_stagging
)
DELETE 
FROM duplicate_cte
WHERE ROW_NUM > 1;

-- H. Buat table stagging 2 untuk memeriksa lebih detail data yang dibersihkan :
CREATE TABLE `layoffs_stagging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- I. Masukkan data dan pemeriksaan baris dari table stagging awal ke stagging 2 :
INSERT INTO layoffs_stagging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`,stage, country
, funds_raised_millions) ROW_NUM
FROM layoffs_stagging;



SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`,stage, country
, funds_raised_millions) ROW_NUM
FROM layoffs_stagging2;

-- J. Lihat apakah masih ada data yang tidak diperlukan(mirip, beda sintaks dll) :
SELECT *
FROM layoffs_stagging2
WHERE ROW_NUM > 1
;

-- K. Hapus data yang tidak diperlukan dari table stagging 2 :
DELETE 
FROM layoffs_stagging2
WHERE ROW_NUM > 1
;
-- L. Cek apakah data sudah bersih :
SELECT *
FROM layoffs_stagging2;

-- Fitur untuk menyalakan dan mematikan perubahan data di MYSQL :
SET SQL_SAFE_UPDATES = 0;


-- ~~~~~~~~~~~~~~~~~~~  Standardizing Data :


-- TRIM untuk menghapus karakter yang tidak diinginkan di awal dan akhir
-- entah spasi atau karakter khusus lain
SELECT company, TRIM(company)
FROM layoffs_stagging2
;

UPDATE layoffs_stagging2
SET company = TRIM(company);


-- DISTINCT menghapus duplikat data, dan hanya menampilkan nilai unik dalam hasil query

SELECT DISTINCT industry
FROM layoffs_stagging2
ORDER BY 1
;

-- Mengubah data ganda dengan penulisan berbeda menjadi satu data utuh
UPDATE layoffs_stagging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'
;

-- Melihat data yang harus diubah penulisan nilai datanya agar menjadi data siap pakai
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_stagging2
ORDER BY 1;

-- Merubah karakter unik dalam penulisan nilai data agar menjadi data siap pakai
UPDATE layoffs_stagging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'united states%'
;

-- melihat apakah jenis data dan format penulisan tanggal sudah benar atau tidak
SELECT `date`
FROM layoffs_stagging2;


-- Penulisan perubahan tipe data di sql vvvvvvvvvvv
UPDATE layoffs_stagging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');


-- ALTER TABLE untuk mengubah struktur tabel yang sudah ada
-- tanpa menghapus data
ALTER TABLE layoffs_stagging2
MODIFY COLUMN `date` DATE;

-- Kita cek apakah data sudah benar
SELECT *
FROM layoffs_stagging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
;

-- ubah data kosong menjadi NULL  
UPDATE layoffs_stagging2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoffs_stagging2
WHERE industry IS NULL
OR industry = ''
;

SELECT *
FROM layoffs_stagging2
WHERE company LIKE '%bally%'
;

SELECT t1.industry, t2.industry
FROM layoffs_stagging2 t1
JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL
    
;

UPDATE layoffs_stagging2 t1
JOIN layoffs_stagging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;



SELECT *
FROM layoffs_stagging2;





