-- practica_78_13
-- Aday Trandafir Garcia

-- usamos la base de datos maratoon
USE maratoon;

-- 1. Añadir Corredores; Añadir 3 corredores con datos válidos. No añadir ni la 
-- edad ni la categoría. Los tres corredores pertenecen al club 5 "Club Atletismo Fronter"
INSERT INTO Corredores (Nombre, Apellidos, Ciudad, FechaNacimiento, Sexo, Club_id)
VALUES
('Luis', 'Martínez López', 'Jerez', '1995-03-12', 'H',  5),
('Ana', 'Gómez Ruiz', 'Cádiz', '2002-07-25', 'M',5),
('Carlos', 'Sánchez Díaz', 'Sevilla', '1988-11-03', 'H', 5);

-- 2. Actualizar Edad; Realiza una actualización de la tabla corredores para que actualice
-- la edad a partir de cada corredor, a partir de la fecha hora actual y de la fecha 
-- de nacimiento de cada corredor.
UPDATE Corredores
SET Edad = TIMESTAMPDIFF(YEAR, FechaNacimiento, NOW());

-- 3. Actualizar Categoría; Actualizar la columna categoria_id a partir de la edad 
-- teniendo en cuenta la siguiente tabla:
-- 1 INF si es menor de 12 años
-- 2 JUN si es menor de 15 años
-- 3 JUV si es menor de 18 años
-- 4 SNA si es menor de 30 años
-- 5 SNB si es menor de 40 años
-- 6 VTA si es menor de 50 años
-- 7 VTB si es menor de 60 años
-- 8 VTC mayor de 60 años inclusive
UPDATE Corredores 
SET 
    categoria_id = CASE
        WHEN Edad < 12 THEN 1 -- infantil
        WHEN Edad < 15 THEN 2 -- junior
        WHEN Edad < 18 THEN 3 -- juvenil
        WHEN Edad < 30 THEN 4 -- senior and
        WHEN Edad < 40 THEN 5 -- senior b
        WHEN Edad < 50 THEN 6 -- VT a
        WHEN Edad < 60 THEN 7 -- VT b
        ELSE 8
    END;
    
-- 4. Mostrar Corredores
-- Realiza una consulta que muestre id, nombre, apellidos, fechaNacimiento,
-- Edad, Categoria (nombre corto) y Club (nombre corto) de todos los corredores.
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    c.FechaNacimiento,
    c.Edad,
    cat.Nombrecorto AS Categoria,
    cl.NombreCorto AS Club
FROM
    Corredores c
        JOIN
    Categorias cat ON c.categoria_id = cat.id
        JOIN
    Clubs cl ON c.club_id = cl.id;
    
-- Realiza una consulta que muestre los corredores que cumplen año el mes que viene, 
-- teniendo en cuenta la fecha y hora actual. Mostrar las mismas columnas que en el apartado anterior.
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    c.FechaNacimiento,
    c.Edad,
    cat.Nombrecorto,
    cl.NombreCorto
FROM
    Corredores c
        JOIN
    Categorias cat ON c.categoria_id = cat.id
        JOIN
    Clubs cl ON c.club_id = cl.id
WHERE
    MONTH(c.FechaNacimiento) = MONTH(DATE_ADD(NOW(), INTERVAL 1 MONTH));
    
-- Realiza una consulta que muestre los corredores que cumplen año la semana que viene, 
-- teniendo en cuenta también la fecha y hora actual.
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    c.FechaNacimiento,
    c.Edad,
    cat.Nombrecorto,
    cl.NombreCorto
FROM
    Corredores c
        JOIN
    Categorias cat ON c.categoria_id = cat.id
        JOIN
    Clubs cl ON c.club_id = cl.id
WHERE
    WEEK(c.FechaNacimiento) = WEEK(DATE_ADD(NOW(), INTERVAL 1 WEEK));
    
-- Mostrar aquellos corredores que nacieron en el 2 cuatrimestre del año. 
-- Mostrar mismos detalles que los apartados anteriores.
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    c.FechaNacimiento,
    c.Edad,
    cat.Nombrecorto,
    cl.NombreCorto
FROM
    Corredores c
        JOIN
    Categorias cat ON c.categoria_id = cat.id
        JOIN
    Clubs cl ON c.club_id = cl.id
WHERE
    MONTH(c.FechaNacimiento) BETWEEN 4 AND 8;
    
-- 5. Maratón de Sevilla; Añadir 5 registros con la llegada a meta en la Maraton de 
-- Sevilla correspondiente a los corredores 2, 3, 4 y 5. Además se supone que el primero 
-- en llegar a la meta fue el corredor 1 cuyo registro ya está arriba. Poner la columna 
-- llegada a vuestro criterio.
INSERT INTO Registros (carrera_id, corredor_id, Salida, Llegada, TiempoInvertido)
VALUES
(2, 2, '2019-12-02 09:00:00', '2019-12-02 11:05:00', NULL),
(2, 3, '2019-12-02 09:00:00', '2019-12-02 11:07:30', NULL),
(2, 4, '2019-12-02 09:00:00', '2019-12-02 11:12:10', NULL),
(2, 5, '2019-12-02 09:00:00', '2019-12-02 11:20:45', NULL),
(2, 6, '2019-12-02 09:00:00', '2019-12-02 11:25:00', NULL);

-- 6. Actualizar Tiempo de LLegada; Actualizar la columna tiempoInvertido a partir de
-- las columna salida y llegada. Sólo maratón de Sevilla.
UPDATE Registros
SET TiempoInvertido = TIMEDIFF(Llegada, Salida)
WHERE carrera_id = 2;

-- 7. Mostrar Clasificación
-- Mostrar la clasificación de la Maratón de Sevilla (id = 2) con los siguientes detalles:
-- id, nombre, apellidos, club (nombre completo), categoria (nombre completo), tiempoInvertido
-- Ordenado de menor a mayor tiempo invertido
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    cl.Nombre AS Club,
    cat.Nombre AS Categoria,
    r.TiempoInvertido
FROM
    Registros r
        JOIN
    Corredores c ON r.corredor_id = c.id
        JOIN
    Clubs cl ON c.club_id = cl.id
        JOIN
    Categorias cat ON c.categoria_id = cat.id
WHERE
    r.carrera_id = 2
ORDER BY r.TiempoInvertido ASC;

-- Muestra la misma clasificación anterior pero junto a la columna tiempoinvertido mostrar el total de segundos.
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    cl.Nombre AS Club,
    cat.Nombre AS Categoria,
    r.TiempoInvertido,
    TIME_TO_SEC(r.TiempoInvertido) AS Segundos
FROM
    Registros r
        JOIN
    Corredores c ON r.corredor_id = c.id
        JOIN
    Clubs cl ON c.club_id = cl.id
        JOIN
    Categorias cat ON c.categoria_id = cat.id
WHERE
    r.carrera_id = 2
ORDER BY r.TiempoInvertido;

-- El reccord mundial de maratón lo posee el keniano Eliud Kipchoge a 2:01:39. 
-- Muestra la misma clasificación anterior pero especificando una nueva columna 
-- el tiempo que le ha faltado para batir el record mundial.
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    cl.Nombre AS Club,
    cat.Nombre AS Categoria,
    r.TiempoInvertido,
    SEC_TO_TIME(TIME_TO_SEC(r.TiempoInvertido) - TIME_TO_SEC('02:01:39')) AS DiferenciaRecord
FROM
    Registros r
        JOIN
    Corredores c ON r.corredor_id = c.id
        JOIN
    Clubs cl ON c.club_id = cl.id
        JOIN
    Categorias cat ON c.categoria_id = cat.id
WHERE
    r.carrera_id = 2
ORDER BY r.TiempoInvertido;

-- Mostrar la clasificación de la categoría SNA.
SELECT 
    c.id,
    c.Nombre,
    c.Apellidos,
    cl.Nombre AS Club,
    cat.Nombre AS Categoria,
    r.TiempoInvertido
FROM
    Registros r
        JOIN
    Corredores c ON r.corredor_id = c.id
        JOIN
    Clubs cl ON c.club_id = cl.id
        JOIN
    Categorias cat ON c.categoria_id = cat.id
WHERE
    r.carrera_id = 2
        AND cat.Nombrecorto = 'SNA'
ORDER BY r.TiempoInvertido;

