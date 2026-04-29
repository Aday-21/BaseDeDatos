-- Active: 1777278272534@@127.0.0.1@3306@loteriaprimitiva
-- practica_711_13
-- Aday Trandafir Garcia

-- 1. CREAR USUARIO
-- Crear usuario
CREATE USER 'adaytrandafir'@'localhost' 
IDENTIFIED BY '1234567';

-- Sin privilegios (solo acceso)
GRANT USAGE ON *.* TO 'adaytrandafir'@'localhost';

-- 2. ASIGNACIÓN DE PRIVILEGIOS

-- 2.1 Superadministrador
GRANT ALL PRIVILEGES ON *.* 
TO 'adaytrandafir'@'localhost' 
WITH GRANT OPTION;

-- 2.2 Todos los privilegios sobre geslibros
GRANT ALL PRIVILEGES ON geslibros.* 
TO 'adaytrandafir'@'localhost';

-- 2.3 Privilegios sobre tablas concretas
GRANT ALL PRIVILEGES ON geslibros.libros 
TO 'adaytrandafir'@'localhost';

GRANT ALL PRIVILEGES ON geslibros.editoriales 
TO 'adaytrandafir'@'localhost';

GRANT ALL PRIVILEGES ON geslibros.clientes 
TO 'adaytrandafir'@'localhost';

-- 2.4 Solo consulta
GRANT SELECT ON geslibros.libros 
TO 'adaytrandafir'@'localhost';

GRANT SELECT ON geslibros.editoriales 
TO 'adaytrandafir'@'localhost';

GRANT SELECT ON geslibros.clientes 
TO 'adaytrandafir'@'localhost';

-- 2.5 Columnas específicas en clientes
GRANT SELECT (nombre, direccion, poblacion, codpostal, telefono, email),
      UPDATE (nombre, direccion, poblacion, codpostal, telefono, email)
ON geslibros.clientes 
TO 'adaytrandafir'@'localhost';

-- 2.6 Columnas específicas en libros
GRANT SELECT (id, titulo, precio_venta, fecha_edicion),
      UPDATE (titulo, precio_venta)
ON geslibros.libros 
TO 'adaytrandafir'@'localhost';

-- 2.7 Consulta en todas excepto ventas y lineasventas
GRANT SELECT ON geslibros.* 
TO 'adaytrandafir'@'localhost';

REVOKE SELECT ON geslibros.ventas 
FROM 'adaytrandafir'@'localhost';

REVOKE SELECT ON geslibros.lineasventas 
FROM 'adaytrandafir'@'localhost';

-- 3. ELIMINAR PRIVILEGIOS

-- 3.1 Quitar GRANT OPTION
REVOKE GRANT OPTION ON *.* 
FROM 'adaytrandafir'@'localhost';

-- 3.2 Quitar todos los privilegios globales
REVOKE ALL PRIVILEGES ON *.* 
FROM 'adaytrandafir'@'localhost';

-- 3.3 Quitar privilegios sobre BD
REVOKE ALL PRIVILEGES ON geslibros.* 
FROM 'adaytrandafir'@'localhost';

-- 3.4 Quitar UPDATE en libros
REVOKE UPDATE ON geslibros.libros 
FROM 'adaytrandafir'@'localhost';

-- 3.5 Quitar SELECT columnas concretas
REVOKE SELECT (id, titulo, precio_venta) 
ON geslibros.libros 
FROM 'adaytrandafir'@'localhost';

-- 3.6 Quitar acceso a todas excepto libros y clientes
REVOKE ALL PRIVILEGES ON geslibros.* 
FROM 'adaytrandafir'@'localhost';

GRANT SELECT ON geslibros.libros 
TO 'adaytrandafir'@'localhost';

GRANT SELECT ON geslibros.clientes 
TO 'adaytrandafir'@'localhost';

-- 3.7 Quitar SELECT, UPDATE y DELETE
REVOKE SELECT, UPDATE, DELETE ON geslibros.libros 
FROM 'adaytrandafir'@'localhost';

REVOKE SELECT, UPDATE, DELETE ON geslibros.clientes 
FROM 'adaytrandafir'@'localhost';

REVOKE SELECT, UPDATE, DELETE ON geslibros.editoriales 
FROM 'adaytrandafir'@'localhost';

REVOKE SELECT, UPDATE, DELETE ON geslibros.autores 
FROM 'adaytrandafir'@'localhost';

-- 4. CAMBIAR PASSWORD

-- Obtener nuevo password cifrado
SELECT PASSWORD('21436587');

-- Cambiar password
ALTER USER 'adaytrandafir'@'localhost' 
IDENTIFIED BY '21436587';

-- 5. SORTEO LOTERÍA PRIMITIVA

USE loteriaprimitiva;

START TRANSACTION;

INSERT INTO sorteos 
(fecha, num1, num2, num3, num4, num5, num6, complementario, reintegro)
VALUES 
(NOW(),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(RAND()*10)
);

INSERT INTO sorteos 
(fecha, num1, num2, num3, num4, num5, num6, complementario, reintegro)
VALUES 
(NOW(),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(RAND()*10)
);

COMMIT;

-- 6. BASE DE DATOS MARATOON

USE maratoon;

-- 6.1 Añadir columnas
ALTER TABLE corredores 
ADD COLUMN apellido1 VARCHAR(40),
ADD COLUMN apellido2 VARCHAR(40),
ADD COLUMN codigo CHAR(11);

-- 6.2 Separar apellidos
UPDATE corredores
SET apellido1 = SUBSTRING_INDEX(apellidos, ' ', 1),
    apellido2 = TRIM(SUBSTRING(apellidos, LOCATE(' ', apellidos) + 1));

-- 6.3 Generar código
UPDATE corredores
SET codigo = UPPER(CONCAT(
YEAR(fechanacimiento), '/',
LEFT(IFNULL(nombre,''),2),
LEFT(IFNULL(apellido1,''),2),
LEFT(IFNULL(apellido2,''),2)
));

-- 6.4 y 6.5 con transacción y bloqueo
LOCK TABLES categorias WRITE;

-- Actualizar edad
UPDATE corredores
SET edad = TIMESTAMPDIFF(YEAR, fechanacimiento, CURDATE());

-- Actualizar categoría (ajusta nombres según tu tabla)
UPDATE corredores c
JOIN categorias cat 
ON c.edad BETWEEN cat.edad_min AND cat.edad_max
SET c.categoria_id = cat.id;

UNLOCK TABLES;

-- 7. EXPORTAR / IMPORTAR DATOS

USE geslibros;

-- 7.1 Exportar clientes de Ubrique
SELECT * 
FROM clientes 
WHERE poblacion = 'Ubrique'
INTO OUTFILE 'C:/Users/09_1DAW_Alum/Documents/Base de Datos 25-26/Actividades/Tema7/clientesUbrique.csv'
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- 7.2 exportar autores.xml

-- 7.3 Copia de seguridad 
-- mysqldump -u root -p geslibros > geslibros_backup.sql

-- 7.4 Crear CSV libros 
/*
101;El Quijote Moderno;1;1;19.95;2020-05-10
102;Aprendiendo SQL;2;1;25.50;2021-03-15
103;Java desde Cero;3;2;30.00;2019-11-20
104;Bases de Datos Avanzadas;2;3;45.99;2022-01-10
*/

-- 7.5 Importar libros.csv
LOAD DATA INFILE 'C:/Users/09_1DAW_Alum/Documents/Base de Datos 25-26/Actividades/Tema7/libros.csv'
INTO TABLE libros
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;