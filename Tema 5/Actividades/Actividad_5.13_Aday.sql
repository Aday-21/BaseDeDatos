-- Actividad 5.13
-- Tema Lenguage SQL - DDL
-- Módulo: Base de datos
-- Curso 25/26
-- Nombre: Aday Trandafir

-- Creación de la base de datos
DROP DATABASE IF EXISTS proyectos;
CREATE DATABASE IF NOT EXISTS proyectos;

-- Usar base de datos taller
USE proyectos;

-- Crear tabla clientes
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nif CHAR(9) UNIQUE NOT NULL
);

-- Crear table teléfonos clientes
DROP TABLE IF EXISTS telefonos_clientes;
CREATE TABLE IF NOT EXISTS telefonos_clientes(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT UNSIGNED NOT NULL,
	telefono CHAR(9) NOT NULL,
    UNIQUE(cliente_id, telefono),
    FOREIGN KEY(cliente_id) REFERENCES clientes(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear la tabla empleados 
DROP TABLE IF EXISTS empleados;
CREATE TABLE IF NOT EXISTS empleados(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
    proyecto_id INT UNSIGNED,
    supervisor_id INT UNSIGNED
    -- las restricciones FOREIGN KEY se añaden al final 
    -- mediante ALTER TABLE
);

-- Crear la tabla telefonos empleados
DROP TABLE IF EXISTS telefonos_empleados;
CREATE TABLE IF NOT EXISTS telefonos_empleados(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    empleados_id INT UNSIGNED NOT NULL,
	telefono CHAR(9) NOT NULL,
    UNIQUE(empleados_id, telefono),
    FOREIGN KEY(empleados_id) REFERENCES empleados(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear tabla beneficiarios
DROP TABLE IF EXISTS beneficiarios;
CREATE TABLE IF NOT EXISTS beneficiarios(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_nac DATE NOT NULL,
    empleado_id INT UNSIGNED,
    FOREIGN KEY(empleado_id) REFERENCES empleados(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear tabla proyectos
DROP TABLE IF EXISTS proyectos;
CREATE TABLE IF NOT EXISTS proyectos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    proyecto VARCHAR(100) NOT NULL,
    descripción TEXT NOT NULL, 
    presupuesto DECIMAL(10,2),
    cliente_id INT UNSIGNED,
	jefe_id INT UNSIGNED,
    FOREIGN KEY(cliente_id) REFERENCES clientes(id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(jefe_id) REFERENCES proyectos(id)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Crer tabla proyectos_empleados
DROP TABLE IF EXISTS proyectos_empleados;
CREATE TABLE IF NOT EXISTS proyectos_empleados(
	empleado_id INT UNSIGNED NOT NULL,
    proyecto_id INT UNSIGNED NOT NULL,
    horas SMALLINT UNSIGNED,
    valoracion VARCHAR(255),
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY(empleado_id, proyecto_id),
    FOREIGN KEY(empleado_id) REFERENCES empleados(id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(proyecto_id) REFERENCES proyectos(id)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla empleados restricciones FOREIGN KEY
ALTER TABLE empleados
ADD CONSTRAINT FK_proyecto_id_empleados FOREIGN KEY(proyecto_id) REFERENCES proyectos(id)
ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_supervisor_id_empleados FOREIGN KEY(supervisor_id) REFERENCES empleados(id)
ON DELETE RESTRICT ON UPDATE CASCADE;

-- Crear indice para la columna nombre de la tabla empleados
CREATE INDEX IN_nombre_empleados ON empleados(nombre);

-- Crear indice para la columna proyecto de la tabla proyectos
CREATE INDEX IN_proyecto_proyectos ON proyectos(proyecto);

-- Parte 2
-- Modificaciones en la base de datos

-- 1. Añadir columnas email en la tabla empleados con restriccion clave secundaria
ALTER TABLE empleados
ADD COLUMN email VARCHAR(60) UNIQUE NOT NULL;

-- 2. Añadir la columna estado en la tabla proyectos el estado podra ser:
-- Presupuestado, Iniciado, Pausado, Cancelado, Finalizado
-- esta columna es obligatoria y por defecto valor Presupuestado
ALTER TABLE proyectos
ADD COLUMN estado ENUM(
  'Presupuestado',
  'Iniciado',
  'Pausado',
  'Cancelado',
  'Finalizado'
) NOT NULL DEFAULT 'Presupuestado';
 

show index from empleados;
show index from proyectos;