-- DATA CLEANING
USE world_layoffs;




SELECT *
FROM layoffs
;


-- 1.Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or blank values
-- 4. Remove Any Columns 


CREATE TABLE layoffs_stagging
LIKE layoffs;


SELECT *
FROM layoffs_stagging
;


INSERT layoffs_stagging
SELECT * 
FROM layoffs
;




SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) ROW_NUM
FROM layoffs_stagging
;

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


SELECT *
FROM layoffs_stagging
WHERE company = 'Yahoo';



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


INSERT INTO layoffs_stagging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`,stage, country
, funds_raised_millions) ROW_NUM
FROM layoffs_stagging;


SELECT *
FROM layoffs_stagging2
WHERE ROW_NUM > 1
;

DELETE
FROM layoffs_stagging2
WHERE ROW_NUM > 1
;

SELECT *
FROM layoffs_stagging2;

SET SQL_SAFE_UPDATES = 0;


-- Standardizing Data

SELECT company, TRIM(company)
FROM layoffs_stagging2
;

UPDATE layoffs_stagging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_stagging2
ORDER BY 1
;

UPDATE layoffs_stagging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'
;



