/*
 * Projekt SQL - otázka 5 - Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
 */ 

SELECT 
	*
FROM (
	SELECT 
		`year` ,
		GDP 
	FROM economies e 
	WHERE 1=1
		AND e.country = 'Czech Republic'
		AND `year` <2019
		AND `year` >2005
		) X
LEFT JOIN (	
	SELECT 
		vystup1.rok ,
		vystup1.rocni_cena
	FROM (
		SELECT 
			*,
			YEAR (date_from) AS rok ,
			AVG(value) OVER (PARTITION BY YEAR(date_from)) AS rocni_cena
		FROM czechia_price cp 
		LEFT JOIN czechia_price_category cpc 
			ON cp.category_code = cpc.code 
		GROUP BY YEAR (date_from), name	)vystup1
	WHERE category_code = 116103						
	)Y
	ON X.`year` = Y.rok 
LEFT JOIN (
	SELECT
		*
	FROM T_TDO_Projekt_SQL_out1_mzda ttpsom 
	WHERE 1 = 1
		AND rok <2019
		AND rok >2005
	GROUP BY rok 
	) Z
	ON X.`year` = Z.rok 
