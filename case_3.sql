/*
 * Projekt SQL - otázka 3 - Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
 */ 

SELECT 
	*
FROM (SELECT 
		YEAR (date_from) AS rok ,		
		name ,
		value as cena2018 ,
		MIN(value) OVER (PARTITION BY category_code) AS min2006a2018 ,
		MAX(value) OVER (PARTITION BY category_code) AS max2006a2018
	FROM czechia_price cp 
	LEFT JOIN czechia_price_category cpc 
		ON cp.category_code = cpc.code 
	WHERE 1 = 1
		AND YEAR (date_from) = 2006 
		OR YEAR (date_from) = 2018
	GROUP BY category_code, rok) vstup
WHERE rok = 2018
