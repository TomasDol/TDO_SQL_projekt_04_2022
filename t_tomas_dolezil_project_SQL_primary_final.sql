CREATE OR REPLACE TABLE t_tomas_dolezil_project_SQL_primary_final
SELECT 
	x.* ,
	YEAR (cp.date_from) AS CP_ROK ,
	cpc.name AS potravina ,
	cp.value AS cena ,
	cpc.price_value ,
	cpc.price_unit ,
	e.GDP ,
	e.population ,
	e.gini ,
	e.taxes ,
	e.fertility ,
	e.mortaliy_under5 
FROM (SELECT
		cpa.payroll_year AS ROK ,
		name AS obor ,
		AVG(cpa.value) OVER (PARTITION BY cpa.payroll_year, cpa.industry_branch_code, cpa.calculation_code, cpa.unit_code) as Y_mzda_prumer
	FROM czechia_payroll cpa
	LEFT JOIN czechia_payroll_industry_branch cpib 
		ON cpa.industry_branch_code = cpib.code  
	WHERE calculation_code = 100 )x
LEFT JOIN czechia_price cp 
	ON x.rok = YEAR (cp.date_from)
LEFT JOIN czechia_price_category cpc 
	ON cp.category_code = cpc.code 
LEFT JOIN economies e 
	ON YEAR (cp.date_from) = e.`year` 
WHERE e.country LIKE 'czech%'
	AND e.`year` <2019
	AND e.`year` >2005
GROUP BY obor, ROK
