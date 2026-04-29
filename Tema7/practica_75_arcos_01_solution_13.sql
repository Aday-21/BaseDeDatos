-- practica_75_13
-- conexion arcos_01

-- 4

-- Selecciona todos los clientes de la provincia de Guadalajara (acción permitida comprobar)
SELECT 
    *
FROM
    clientes
WHERE
    provincia_id = 19;

-- Inserta un cliente y asignar datos a vuestro criterio (acción no permitida comprobar)
INSERT INTO clientes values (1, 'Aday', 'C/Azufre 23', 'Puerto Serrano', 11545, 19, null, null, null, null , null, null);

-- 6

-- Comprobar que ha conseguido insertar el cliente anterior.
SELECT 
    *
FROM
    clientes
WHERE
    nombre = 'Aday';

-- Bloquea la tabla libros a modo escritura.
LOCK TABLE libros WRITE;

-- Inserta un nuevo libro (debe permitir la acción)
INSERT INTO libros
VALUES (37, 16841354, null, 'DiaLOCO', null, null, null, null, null, null, null, null, null, null);