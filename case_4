/*
 * Projekt SQL - otázka 4 - Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
 */ 

SELECT 
	vystup1.rok ,
	vystup1.rocni_cena
FROM (SELECT 
		*,
		YEAR (date_from) AS rok ,
		AVG(value) OVER (PARTITION BY YEAR(date_from)) AS rocni_cena
	FROM czechia_price cp 
	LEFT JOIN czechia_price_category cpc 
		ON cp.category_code = cpc.code 
	GROUP BY YEAR (date_from), name	)vystup1
WHERE category_code = 116103												#jednojaký kod, cílem je jen reduplikovat radky pro rok
