-- 1. ORDER BY, LIMIT, ALL, DISTINCT
-- Obtener los 3 empleados con mayor salario

SELECT 
    *
FROM
    empleados
ORDER BY salario DESC
LIMIT 3;

-- Obtener los 5 empleados con menor salario

SELECT 
    *
FROM
    empleados
ORDER BY salario ASC
LIMIT 5;

-- Obtener los empleados ordenados alfabéticamente

SELECT 
    *
FROM
    empleados
ORDER BY nombre ASC;

-- Obtener los 3 primeros departamentos

SELECT 
    *
FROM
    departamentos
ORDER BY id
LIMIT 3;

-- Obtener los 3 empleados con mayores salarios del departamento 3

SELECT 
    *
FROM
    empleados
WHERE
    departamento_id = 3
ORDER BY salario DESC
LIMIT 3;

-- 2. Función COUNT()
-- Obtener el número total de departamentos

SELECT 
    COUNT(*) AS total_departamentos
FROM
    departamentos;
    
-- Obtener el número total de beneficiarios de sexo ‘M’ mujer

SELECT 
    COUNT(*) AS total_mujeres
FROM
    beneficiarios
WHERE
    genero = 'M';
    
-- Número total de empleados con salario entre 20000 y 50000

SELECT 
    COUNT(*) AS total_empleados
FROM
    empleados
WHERE
    salario BETWEEN 20000 AND 50000;

-- Número total de empleados nacidos después de 1970 (no inclusive)

SELECT 
    COUNT(*) AS total_empleados
FROM
    empleados
WHERE
    fecha_nac > '1970-01-01';

-- Número total de proyectos del departamento 3

SELECT 
    COUNT(*) AS total_proyectos
FROM
    proyectos
WHERE
    departamento_id = 3;

-- Número de departamentos que están realizando un proyecto

SELECT 
    COUNT(DISTINCT departamento_id) AS departamentos_con_proyectos
FROM
    proyectos;
    
-- Número de empleados que trabajan en algún proyecto

SELECT 
    COUNT(DISTINCT empleado_id) AS empleados_en_proyectos
FROM
    empleados_proyectos;

-- 3. Función SUM()
-- Total de horas trabajadas en los distintos proyectos
SELECT 
    SUM(horas) AS total_horas
FROM
    empleados_proyectos;
    
-- Total de horas trabajadas en el proyecto 2

SELECT 
    SUM(horas) AS total_horas
FROM
    empleados_proyectos
WHERE
    proyecto_id = 2;

-- Suma total de salarios de los empleados

SELECT 
    SUM(salario) AS total_salarios
FROM
    empleados;

-- Suma total de salarios del departamento 5

SELECT 
    SUM(salario) AS total_salarios
FROM
    empleados
WHERE
    departamento_id = 5;
    
-- Suma total de salarios de empleados con supervisor 3
SELECT 
    SUM(salario) AS total_salarios
FROM
    empleados
WHERE
    supervisor_id = 3;

-- Número de empleados y suma total de salarios del departamento 4

SELECT 
    COUNT(*) AS num_empleados, SUM(salario) AS total_salarios
FROM
    empleados
WHERE
    departamento_id = 4;
    
-- 4. Función AVG()
-- Media total de horas trabajadas en proyectos

SELECT 
    AVG(horas) AS media_horas
FROM
    empleados_proyectos;
    
-- Número total de jornadas, suma total y media de horas trabajadas

SELECT 
    COUNT(*) AS jornadas,
    SUM(horas) AS total_horas,
    AVG(horas) AS media_horas
FROM
    empleados_proyectos;

-- Número de empleados, suma y media de salarios del departamento 

SELECT 
    COUNT(*) AS num_empleados,
    SUM(salario) AS total_salarios,
    AVG(salario) AS media_salarios
FROM
    empleados
WHERE
    departamento_id = 3;

-- Salario medio de todos los empleados

SELECT 
    AVG(salario) AS salario_medio
FROM
    empleados;

-- Número total de empleados, salario medio y suma total de salarios

SELECT 
    COUNT(*) AS total_empleados,
    AVG(salario) AS salario_medio,
    SUM(salario) AS total_salarios
FROM
    empleados;

-- Número de empleados y salario medio nacidos entre 1960 y 1980

SELECT 
    COUNT(*) AS total_empleados, AVG(salario) AS salario_medio
FROM
    empleados
WHERE
    fecha_nac BETWEEN '1960-01-01' AND '1980-12-31';
    
-- Empleados con salario por encima de la media

SELECT 
    *
FROM
    empleados
WHERE
    salario > (SELECT 
            AVG(salario)
        FROM
            empleados);
            
-- Empleados con salario por debajo de la media del departamento 3

SELECT 
    *
FROM
    empleados
WHERE
    salario < (SELECT 
            AVG(salario)
        FROM
            empleados
        WHERE
            departamento_id = 3);
            
-- NSS, Nombre y Apellidos de empleados con horas por encima de la media

SELECT 
    e.nss, e.nombre, e.apellidos
FROM
    empleados e
        JOIN
    empleados_proyectos ep ON e.id = ep.empleado_id
WHERE
    ep.horas > (SELECT 
            AVG(horas)
        FROM
            empleados_proyectos);

-- 5. Funciones MIN() y MAX()
-- Salario máximo

SELECT 
    MAX(salario) AS salario_maximo
FROM
    empleados;

-- Salario mínimo

SELECT 
    MIN(salario) AS salario_minimo
FROM
    empleados;
    
-- Máximo de horas trabajadas en un proyecto

SELECT 
    MAX(horas) AS max_horas
FROM
    empleados_proyectos;
    
-- Datos de los empleados con salario máximo

SELECT 
    *
FROM
    empleados
WHERE
    salario = (SELECT 
            MAX(salario)
        FROM
            empleados);
            
-- Datos de los empleados con salario mínimo

SELECT 
    *
FROM
    empleados
WHERE
    salario = (SELECT 
            MIN(salario)
        FROM
            empleados);
            
-- NSS del empleado con máximo de horas trabajadas

SELECT 
    e.nss
FROM
    empleados e
        JOIN
    empleados_proyectos ep ON e.id = ep.empleado_id
WHERE
    ep.horas = (SELECT 
            MAX(horas)
        FROM
            empleados_proyectos);
            
-- NSS, nombre y apellidos de empleados con máximo de horas

SELECT 
    e.nss, e.nombre, e.apellidos
FROM
    empleados e
        JOIN
    empleados_proyectos ep ON e.id = ep.empleado_id
WHERE
    ep.horas = (SELECT 
            MAX(horas)
        FROM
            empleados_proyectos);

-- NSS de empleados con horas mínimas

SELECT 
    e.nss
FROM
    empleados e
        JOIN
    empleados_proyectos ep ON e.id = ep.empleado_id
WHERE
    ep.horas = (SELECT 
            MIN(horas)
        FROM
            empleados_proyectos);
            
-- NSS, nombre y apellidos con horas mínimas

SELECT 
    e.nss, e.nombre, e.apellidos
FROM
    empleados e
        JOIN
    empleados_proyectos ep ON e.id = ep.empleado_id
WHERE
    ep.horas = (SELECT 
            MIN(horas)
        FROM
            empleados_proyectos);