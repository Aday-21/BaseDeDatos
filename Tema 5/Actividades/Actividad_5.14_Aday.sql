-- Actividad 5.14
-- Tema Lenguage SQL - DDL
-- Módulo: Base de datos
-- Curso 25/26
-- Nombre: Aday Trandafir

USE proyectos;
-- 1. Añadir nuevas columnas
ALTER TABLE clientes
ADD COLUMN apellidos VARCHAR(45),
ADD COLUMN poblacion VARCHAR(50),
ADD COLUMN nacionalidad VARCHAR(30),
ADD COLUMN email VARCHAR(80),
ADD COLUMN direccion VARCHAR(100),
ADD COLUMN cod_cliente CHAR(7) UNIQUE,
ADD COLUMN tipo_cliente TINYINT;

-- 2. Modificar columnas 
ALTER TABLE clientes
MODIFY nombre VARCHAR(25) NOT NULL,
MODIFY apellidos VARCHAR(45) NOT NULL,
MODIFY nacionalidad VARCHAR(30) DEFAULT 'España',
MODIFY direccion VARCHAR(100);

-- 3. Cambiar nombre de la columna email
ALTER TABLE clientes
CHANGE email correo_electronico VARCHAR(80);

-- 4. Añadir restricciones CHECK

-- El correo debe contener el carácter '@'
ALTER TABLE clientes
ADD CONSTRAINT CK_correo_clientes
CHECK (correo_electronico LIKE '%@%');

-- Tipo de cliente entre 0 y 10
ALTER TABLE clientes
ADD CONSTRAINT CK_tipo_cliente
CHECK (tipo_cliente BETWEEN 0 AND 10);

-- 5. Crear índice sobre apellidos y nombre
CREATE INDEX IN_apellidos_nombre_clientes ON clientes (apellidos, nombre);

-- 6. Mostrar índices de la tabla clientes
SHOW INDEX FROM clientes;
