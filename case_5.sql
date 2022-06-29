/*
 * Projekt SQL - otázka 5 - Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
 */ 

SELECT 
	`year` ,
	GDP 
FROM economies e 
WHERE 1=1
	AND e.country = 'Czech Republic'
	AND `year` <2019
	AND `year` >2005

#+ soubor z case 4
