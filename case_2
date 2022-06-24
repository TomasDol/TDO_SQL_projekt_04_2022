/*
 * Projekt SQL - otázka 2 - Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd
 */ 

#mzda
SELECT 
	tdo.rok ,
	AVG (tdo.rocni_prumerna_mzda) as Y_prum_mzda_CR
FROM T_TDO_Projekt_SQL_out1_mzda
GROUP BY rok 

#mleko
SELECT 
	category_code as druh_potraviny ,
	value as cena_za_1L ,
	YEAR (date_from) AS R1
from czechia_price cp
WHERE category_code = 114201 
GROUP BY R1

#chleba
SELECT 
	category_code as druh_potraviny ,
	value as cena_za_Kg ,
	YEAR (date_from) AS R1
from czechia_price cp
WHERE category_code = 111201 
GROUP BY R1

SELECT *
FROM czechia_price_category cpc 
