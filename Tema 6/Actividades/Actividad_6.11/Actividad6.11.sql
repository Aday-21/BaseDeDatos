-- ACTIVIDAD 6.11
-- GROUP BY - HAVING

-- BASE DE DATOS EMPRESA
use empresa;

-- 1.Número de empleados en cada departamento
-- columnas: id, departamento, num_empleados
SELECT 
    departamento_id, COUNT(*) num_empleados
FROM
    empleados
		INNER JOIN
	departamentos ON empleados.departamento_id = departamento.id
GROUP BY departamento_id;

