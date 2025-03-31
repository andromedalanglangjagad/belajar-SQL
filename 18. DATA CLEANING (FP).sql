-- Exploratory Data Analysis

SELECT *
FROM layoffs_stagging2
;


SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_stagging2
;


SELECT *
FROM layoffs_stagging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC
;

SELECT company, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC
;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_stagging2
;


SELECT country, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY country
ORDER BY 2 DESC
;

SELECT *
FROM layoffs_stagging2
;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC
;

SELECT stage, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY stage
ORDER BY 2 DESC
;


SELECT company, SUM(percentage_laid_off)
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC
;
 















