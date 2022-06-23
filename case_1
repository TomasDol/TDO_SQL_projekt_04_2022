/*
 * Projekt SQL - otázka 1 - Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
 */ 

#Krok 1 - doplnění ročních průměrů
#Krok 2 - filtrace
#Krok 3 - doplnění názvů z payroll_Ind_branch přes left join + propojení jednotek z cz_payroll_unit
#Krok 4 - filtrace
#Krok 5 - export a vytvoření tabulky 

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
	LEFT JOIN czechia_payroll_industry_branch cpib 			#krok 3 - propojení s druhou tabulkou
		ON x.industry_branch_code = cpib.code 
	LEFT JOIN czechia_payroll_unit cpu 
		ON x.unit_code = cpu.code 
	WHERE 1=1
		AND x.payroll_quarter = 4							#krok 2 - filtrace jen jeden řádek za rok a to 4Q
		AND x.calculation_code = 100  						#krok 2 - filtrace jen fyzický dle čísleníku payroll_calculation
		AND x.unit_code = 200 								#krok 4 - filtrace jen Kč
	ORDER BY 
		x.industry_branch_code ,
		x.payroll_year 
