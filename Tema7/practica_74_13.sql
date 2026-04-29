-- practica_74_13
-- Aday Trandafir Garcia
-- Transacciones

USE geslibros;

-- 1. Incluye en una transacción un proceso que realice las siguientes actualizaciones:
-- Todos los libros de tema Novela se ponen en oferta y se decrementa el precio en un 10%
-- Los libros de la editorial Anaya se incrementa el precio en un 6% mientras que el resto de editoriales se reduce en un 4,5%.
START TRANSACTION;

-- 1. Libros de tema 'Novela' en oferta (-10%)
UPDATE libros 
SET 
    precio_venta = precio_venta * 0.9
WHERE
    id IN (SELECT 
            libro_id
        FROM
            libros_temas
        WHERE
            tema_id = (SELECT 
                    id
                FROM
                    temas
                WHERE
                    tema = 'Novela'));

-- 2. Editorial Anaya (+6%)
UPDATE libros 
SET 
    precio_venta = precio_venta * 1.06
WHERE
    editorial_id = (SELECT 
            id
        FROM
            editoriales
        WHERE
            nombre LIKE '%Anaya%');

-- 3. Resto de editoriales (-4.5%)
UPDATE libros 
SET 
    precio_venta = precio_venta * 0.955
WHERE
    editorial_id != (SELECT 
            id
        FROM
            editoriales
        WHERE
            nombre LIKE '%Anaya%');

COMMIT;

-- 2. Finalizar la transacción deshaciendo las operaciones anteriores. Comprobar
ROLLBACK;

SELECT * FROM libros;

-- 3. Inicia una nueva transacción que contenga las siguientes operaciones:
-- Añadir dos nuevos libros
-- Añadir una venta y 3 líneas de detalle sobre esa venta

START TRANSACTION;

-- Insertar dos nuevos libros
INSERT INTO libros (id_libro, titulo, precio, editorial, tema)
VALUES 
(101, 'Libro A', 20.00, 'Planeta', 'Novela'),
(102, 'Libro B', 25.00, 'Anaya', 'Ensayo');

-- Insertar venta
INSERT INTO ventas (id_venta, fecha, id_cliente)
VALUES (5001, CURRENT_DATE, 1);

-- Insertar 3 líneas de detalle de la venta
INSERT INTO lineas_venta (id_venta, id_libro, cantidad, precio_unitario)
VALUES 
(5001, 101, 2, 20.00),
(5001, 102, 1, 25.00),
(5001, 103, 1, 18.00);

-- 4. Finalizar la transacción confirmando las operaciones anteriores.
COMMIT;

-- 5. Incluye en una transacción las siguientes operaciones sobre la base de datos geslibros: 
-- Insertar dos libros
-- Insertar dos clientes
-- Crear SAVEPOINT a 
-- Actualizar los precios de todos los libros en 10% de incremento
-- Crear SAVEPOINT b
-- Eliminar los libros no vendidos
-- Deshacer a partir del SAVEPOINT a
-- Comprobar 
