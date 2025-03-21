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




