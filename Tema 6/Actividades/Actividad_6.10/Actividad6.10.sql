-- Actividad 6.10

-- Actividad 1 : Mostrar los detalles sobre empleados y departamentos.
SELECT 
    empleados.id,
    empleados.nombre,
    empleados.apellidos,
    empleados.nss,
    TIMESTAMPDIFF(YEAR,
        empleados.fecha_nac,
        CURDATE()) edad,
    empleados.salario,
    departamentos.nmbre
FROM
    empleados
        LEFT JOIN
    departamentos ON empleados.departamento_id = departamentos.id
ORDER BY empleados.id;

-- Actividad 2 : Mostrar detalles a cerca de los departamentos.
SELECT 
    departamentos.id,
    departamentos.nmbre,
    departamentos.jefe_departamento_id,
    empleados.id,
    empleados.nombre,
    empleados.apellidos
FROM
    departamentos
        LEFT JOIN
    empleados ON departamentos.jefe_departamento_id = empleados.id
ORDER BY departamentos.id;

-- Actividad 3 : Mostrar los detalles sobre los empleados que hayan trabajado en algún proyecto.
SELECT 
    empleados.id,
    empleados.nombre,
    empleados.apellidos,
    departamentos.nmbre nombre_departamento,
    proyectos.descripcion nombre_proyecto,
    empleados_proyectos.horas
FROM
    empleados
        LEFT JOIN
    departamentos ON empleados.departamento_id = departamentos.id
        LEFT JOIN
    empleados_proyectos ON empleados.id = empleados_proyectos.empleado_id
        LEFT JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id
ORDER BY empleados_proyectos.horas DESC;

-- Actividad 4 : Mostrar los siguientes detalles sobre proyectos
SELECT 
    proyectos.id,
    proyectos.nombre,
    proyectos.num_proyecto,
    proyectos.fecha_inicio,
    departamentos.nombre,
    empleados.nombre,
    empleados.apellidos,
    empleados_proyectos.horas
FROM
    proyectos
        LEFT JOIN
    departamentos ON proyectos.departamento_id = departamentos.id
        LEFT JOIN
    empleados_proyectos ON proyectos.id = empleados_proyectos.proyecto_id
        LEFT JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
ORDER BY empleados_proyectos.horas DESC;