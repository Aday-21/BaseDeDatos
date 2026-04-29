-- Actividad 6.9

-- 1. Empleados
SELECT 
    empleados.id,
    empleados.nombre,
    empleados.apellidos,
    empleados.salario,
    empleados.departamento_id,
    departamentos.nmbre
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
ORDER BY empleados.id;

-- 2. Departamentos
SELECT 
    departamentos.id,
    departamentos.nmbre,
    departamentos.localizacion,
    departamentos.componentes,
    departamentos.jefe_departamento_id,
    empleados.apellidos,
    empleados.nombre
FROM
    departamentos
        INNER JOIN
    empleados ON departamentos.jefe_departamento_id = empleados.id
ORDER BY departamentos.nmbre;

-- 3. Empleados con supervisor
SELECT 
    empleados.id,
    empleados.nombre,
    empleados.apellidos,
    empleados.nss,
    empleados.salario,
    empleados_supervisor.nombre,
    empleados_supervisor.apellidos
FROM
    empleados
        INNER JOIN
    empleados empleados_supervisor ON empleados.supervisor_id = empleados_supervisor.id
ORDER BY empleados.id;

-- 4. Beneficiarios con Empleados
SELECT 
    beneficiarios.id,
    beneficiarios.nombre,
    beneficiarios.genero,
    beneficiarios.parentesco,
    beneficiarios.fecha_nac,
    beneficiarios.empleado_id,
    empleados.nombre,
    empleados.apellidos
FROM
    beneficiarios
        INNER JOIN
    empleados ON beneficiarios.empleado_id = empleados.id;
    
-- 5. Proyectos
SELECT 
    proyectos.id,
    proyectos.descripcion,
    proyectos.num_proyecto,
    proyectos.localizacion,
    proyectos.fecha_inicio,
    proyectos.fecha_fin,
    proyectos.departamento_id,
    departamentos.nmbre
FROM
    proyectos
        INNER JOIN
    departamentos ON proyectos.departamento_id = departamentos.id;
    
-- 6. Proyectos con Jefe de Departamento
SELECT 
    proyectos.id,
    proyectos.descripcion,
    proyectos.num_proyecto,
    proyectos.localizacion,
    proyectos.fecha_inicio,
    proyectos.fecha_fin,
    proyectos.departamento_id,
    departamentos.nmbre,
    empleados.nombre,
    empleados.apellidos
FROM
    proyectos
        INNER JOIN
    departamentos ON proyectos.departamento_id = departamentos.id
        INNER JOIN
    empleados ON departamentos.jefe_departamento_id = empleados.id;
    
-- 7. Informe empleados_proyectos
SELECT 
    empleados_proyectos.empleado_id,
    empleados_proyectos.proyecto_id,
    empleados_proyectos.horas,
    empleados.nombre,
    empleados.apellidos,
    proyectos.descripcion
FROM
    empleados_proyectos
        INNER JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        INNER JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id
ORDER BY empleados.nombre;