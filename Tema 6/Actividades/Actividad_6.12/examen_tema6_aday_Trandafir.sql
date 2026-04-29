-- Aday Trandafir Garcia
-- Tema 6. Examen 

-- Usamos la base de datos geslibro:
USE geslibros;

-- 1. Insertar libro: Insertar un nuevo libro en la base 
-- de datos con los siguientes datos:

INSERT INTO libros (autor_id, editorial_id, ISBN, EAN, titulo, precio_coste, precio_venta, stock, stock_min, stock_max, fecha_edicion) VALUES 
(2, 4, 9788408096528, 9788888199587, 'El Retrato de Dorian Gray', '18.00', '24.00', 12, 5, 25, 2015-03-15);

-- 2. Insertar - Libros_Temas: Insertar los registros necesarios
-- en la tabla libros_temas para asociar el libro insertado 
-- anteriormente con las temáticas de Novela y Ciencia.

INSERT INTO libros_temas (libro_id, tema_id) VALUES
(26, 3),
(26, 9);

-- 3. Insertar - Ventas: Insertar un nuevo registro
-- en la tabla ventas y sus correspondientes líneas de venta:

INSERT INTO ventas (cliente_id, fecha) VALUES
(1, 2014-05-10);

-- 4. Insertar lineas ventas: Crear 2 líneas de venta con
-- al menos 2 libros diferentes y que se pueda emparejar 
-- con la venta anterior

INSERT INTO ventas (cliente_id, fecha, importe_bruto, importe_iva, importe_total) VALUES 
(1, '2014-05-10',100.00,21.00,121.00),
(1, '2014-05-10',300.00,63.00,363.00);

-- 5. Update - Libros: Actualizar el precio de venta de todos
-- los libros de la editorial Planeta incrementándolo en un 15%.


-- 6. Update - Libros: Reducir el stock de todos los libros 
-- cuyo stock actual sea superior a 15 unidades en un 20%.

-- 7. Delete - Libros: Eliminar de la base de datos todos
-- los libros de temática Viajes.

DELETE FROM libros where editorial_id=(4);

-- 8. Script - clientes: Mostrar aquellos clientes cuya dirección 
-- de email pertenezca al dominio "gmail.com" y que estén ubicados
-- en la provincia de Guadalajara.

SELECT 
    c.id,
    c.nombre,
    c.direccion,
    c.c_postal,
    c.nif,
    c.telefono,
    c.email
FROM
    clientes AS c
        INNER JOIN
    provincias AS p ON c.provincia_id = provincia_id
WHERE
    email LIKE '%gmail.com'
        AND provincia LIKE '%Guadalajara%'
ORDER BY nombre;

-- 9. Script - ventas: Mostrar las 5 ventas con menor 
-- importe total realizadas en el año 2013.

SELECT 
    v.id,
    c.nombre,
    v.fecha,
    v.importe_bruto,
    v.importe_iva,
    v.importe_total
FROM
    ventas AS v
        INNER JOIN
    clientes AS c ON v.cliente_id = cliente_id
WHERE
    YEAR(fecha) = 2013
ORDER BY 5, importe_total;

-- 10. Script - libros: Mostrar los libros publicados 
-- en el año 2014 cuyo stock sea inferior a 20 unidades.

SELECT 
    l.id,
    l.titulo,
    a.nombre AS autores,
    e.nombre AS editoriales,
    l.stock,
    l.precio_coste,
    l.precio_venta
FROM
    (libros AS l
    INNER JOIN autores AS a ON l.autor_id = autor_id)
        INNER JOIN
    editoriales AS e ON l.editorial_id = editorial_id
WHERE
    stock < 20
        AND YEAR(fecha_edicion) = 2014
ORDER BY titulo;

-- 11. Script - libros: Mostrar los libros de temática
-- Novela cuyo precio de venta sea superior a 20 €.

SELECT 
    l.id,
    l.titulo,
    a.nombre AS autores,
    e.nombre AS editoriales,
    t.tema,
    l.precio_coste,
    l.precio_venta
FROM
    (libros AS l
    INNER JOIN autores AS a ON l.autor_id = autor_id)
        INNER JOIN
    editoriales AS e ON l.editorial_id = editorial_id
        INNER JOIN
    temas AS t ON l.temas_id = temas_id
        INNER JOIN
    libros_temas AS tl ON l.libro_temas_id = libro_tema_id
WHERE
    temas_id = 3 AND precio_venta > 20.00
ORDER BY titulo;

-- 12. Script - libros: Mostrar los libros cuyo precio 
-- de venta sea superior al precio medio de todos los 
-- libros de la base de datos.

SELECT 
    l.id,
    l.titulo,
    a.nombre AS autores,
    e.nombre AS editoriales,
    l.precio_venta
FROM
    (libros AS l
    INNER JOIN autores AS a ON l.autor_id = autor_id)
        INNER JOIN
    editoriales AS e ON l.editorial_id = editorial_id
WHERE
    precio_venta
ORDER BY precio_venta;

-- 13. Script - ventas: Mostrar el número de ventas realizadas
-- y el importe total facturado por cada cliente.

SELECT 
    c.id, c.nombre,
    COUNT(*)numero_ventas,
    v.importe_total
FROM
    ventas AS v
        INNER JOIN
    clientes AS c ON v.cliente_id = cliente_id
WHERE
    COUNT(*)
        AND SUM(importe_total)
ORDER BY numero_ventas;