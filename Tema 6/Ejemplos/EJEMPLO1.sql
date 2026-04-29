-- Ejemplo
-- Select

-- MUESTRA TODOS LOS REGISTROS DE LA TABLA LIBROS,
-- CON TODAS LAS COLUMNAS DE LA TABLA
-- LISTA DE TODAS LAS COLUMNAS; *
SELECT * FROM libros;

-- Especificamos lista de columnas
SELECT 
    id, titulo, autor_id, editorial_id, precio_venta
FROM
    libros;

-- Especificamos lista de columnas con otro orden
SELECT 
    id,
    titulo,
    precio_venta,
    autor_id,
    editorial_id,
    precio_coste
FROM
    libros;
    
-- Lista de columnas con expresión
-- Beneficios que obtengo de cada libro; precio_venta - precio_coste
SELECT 
    id,
    titulo,
    autor_id,
    editorial_id,
    precio_coste,
    precio_venta,
    precio_venta - precio_coste
FROM
    libros;
    
-- Lista de columnas con expresión
-- Beneficios que obtengo de cada libro; precio_venta - precio_coste
-- Coloca el alias beneficio en esta ultima columna
SELECT 
    id,
    titulo,
    autor_id,
    editorial_id,
    precio_coste,
    precio_venta,
    precio_venta - precio_coste AS beneficio
FROM
    libros;
    
-- Lista de columnas con expresión
-- Beneficios que obtengo de cada libro; precio_venta - precio_coste
-- La clausula as no es obligatoria
SELECT 
    id,
    titulo,
    autor_id,
    editorial_id,
    precio_coste,
    precio_venta,
    precio_venta - precio_coste beneficio
FROM
    libros;
    
-- Uso de prefijos
-- Columnas: nombre de la base de datos; nombre de la tabla
-- Tablas; nombre de la base de datos
SELECT 
    libros.id,
	libros.titulo,
    libros.autor_id,
    libros.editorial_id,
    libros.precio_coste,
    libros.precio_venta,
    libros.precio_venta - libros.precio_coste beneficio
FROM
    geslibros.libros;
    
use mara;

-- Clausula FROM
-- las tablas a partir de la cuela extraigo los datos 
SELECT 
    libros.id,
    libros.titulo,
    libros.autor_id,
    autores.id as id_autor,
    autores.nombre as autor,
    libros.id as id_libros,
    libros.precio_venta
FROM
    libros,
    autores,
    editoriales;