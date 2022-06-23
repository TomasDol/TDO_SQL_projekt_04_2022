CREATE OR REPLACE TABLE t_tomas_dolezil_project_SQL_secondary_final
SELECT 
	e.country ,
	e.`year` ,
	e.population ,
	e.gini ,
	e.taxes ,
	e.fertility  ,
	e.mortaliy_under5 ,
	c.continent
from economies e 
LEFT JOIN countries c 
	ON e.country = c.country 
WHERE 1=1
	AND c.continent = 'Europe' ;
	
