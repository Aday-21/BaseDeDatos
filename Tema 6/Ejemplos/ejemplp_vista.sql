-- ejemplo de vista
SELECT 
    *
FROM
    registros;
SELECT 
    *
FROM
    registros
WHERE
    carrera_id = 1
ORDER BY TiempoInvertido;
-- nombre corredor
SELECT 
    registros.id,
    registros.corredor.id,
    corredores.nombre,
    corredores.apellidos,
    corredores.Categoria_id,
    corredores.Club_id,
    
    registros.TiempoInvertido
FROM
    (registros
    INNER JOIN corredores ON registros.corredor_id = corredor_id)
        INNER JOIN
    clubs ON corredor.club_id = clubs_id
WHERE
    carrera_id = 1
ORDER BY TiempoInvertido;
