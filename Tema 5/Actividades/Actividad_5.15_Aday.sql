-- Actividad 5.15
-- Tema Lenguage SQL - DDL
-- Módulo: Base de datos
-- Curso 25/26
-- Nombre: Aday Trandafir

-- Creación de la base de datos
DROP DATABASE IF EXISTS libreria;
CREATE DATABASE IF NOT EXISTS libreria;

-- Usamos la base de datos libreriaç
USE libreria;

-- Creación de la tabla libros
DROP TABLE IF EXISTS libros;
CREATE TABLE IF NOT EXISTS libros(
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    autor VARCHAR(150) NOT NULL,
    precio DECIMAL(8,2) NOT NULL
);

-- Creación de la tabla educación
DROP TABLE IF EXISTS educacion;
CREATE TABLE IF NOT EXISTS educacion(
	id_libro INT,
    curso VARCHAR(100),
    asignatura VARCHAR(100),
    PRIMARY KEY (id_libro),
    FOREIGN KEY (id_libro) REFERENCES Libros(id)
);

-- Creación de la tabla lectura
DROP TABLE IF EXISTS lectura;
CREATE TABLE IF NOT EXISTS lectura(
	id_libro INT,
    tipo VARCHAR(50),
    genero VARCHAR(50),
    PRIMARY KEY (id_libro),
    FOREIGN KEY (id_libro) REFERENCES Libros(id)
);

-- Creación de la tabla provincias
DROP TABLE IF EXISTS provincias;
CREATE TABLE IF NOT EXISTS provincias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_almacen INT
);

-- Creación de la tabla poblaciones
DROP TABLE IF EXISTS poblaciones;
CREATE TABLE IF NOT EXISTS poblaciones(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    habitantes INT,
    id_provincias INT,
    FOREIGN KEY (provincias_id) REFERENCES Provincias(id)
);

-- Creación de la tabla pedidos
DROP TABLE IF EXISTS pedidos;
CREATE TABLE IF NOT EXISTS pedidos(
	id INT PRIMARY KEY,
    fecha DATE NOT NULL,
    envio VARCHAR(50),
    socio_id INT,
    FOREIGN KEY (socios_id) REFERENCES socios(id)
);

-- Creación de la tabla LibrosPedidos
DROP TABLE IF EXISTS LibrosPedidos;
CREATE TABLE IF NOT EXISTS LibrosPedidos(
    id_pedido INT,
    id_libro INT,
    unidades INT NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (id_pedido, id_libro),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_libro) REFERENCES Libros(id)
);

