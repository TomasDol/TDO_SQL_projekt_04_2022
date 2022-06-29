/*
 * Projekt SQL - otázka 1 - Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
 */ 


-- CREATE OR REPLACE TABLE T_TDO_Projekt_SQL_Case1_data AS
	SELECT 
		x.payroll_year as rok,
		x.y_vse_prumer as rocni_prumerna_mzda,
		cpu.name as jednotka ,
		cpib.name as obor 
	FROM (
		SELECT 
			*,
			AVG(value) OVER (PARTITION BY payroll_year, industry_branch_code, calculation_code, unit_code) as Y_vse_prumer
		FROM czechia_payroll) x
	LEFT JOIN czechia_payroll_industry_branch cpib 			
		ON x.industry_branch_code = cpib.code 
	LEFT JOIN czechia_payroll_unit cpu 
		ON x.unit_code = cpu.code 
	WHERE x.payroll_quarter = 4							
		AND x.calculation_code = 100  						
		AND x.unit_code = 200 								
	ORDER BY 
		x.industry_branch_code ,
		x.payroll_year 
