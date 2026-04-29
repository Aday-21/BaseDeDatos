-- Actividad 5.3
-- Tema 5. Lenguage SQL - DDL
-- Descripción: tipo de datos numéricos

-- Borro y creo la base de datos si existe y no existe respectivamente
Drop DATABASE IF exists tipo_datos;
CREATE DATABASE IF NOT exists tipo_datos;

-- Activar la base de datos tipo_datos
USE tipo_datos;

-- Borro y creo la tabla tipo_datos_num
DROP TABLE IF EXISTS tipo_datos_num;
CREATE TABLE IF NOT EXISTS tipo_datos_num (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    num_camiseta TINYINT UNSIGNED,
    diferencia_goles SMALLINT,
    goles_a_favor SMALLINT UNSIGNED,
    goles_en_contra SMALLINT UNSIGNED,
    num_habitantes INT UNSIGNED,
    humedad FLOAT(3,2) UNSIGNED,
	precipitaciones SMALLINT UNSIGNED,
    temperatura_maxima FLOAT(5,2) UNSIGNED,
    temperatura_minima FLOAT(5,2),
    velocidad_viento SMALLINT UNSIGNED,
	altura SMALLINT UNSIGNED,
    precio DECIMAL(10,2),
    sueldo DECIMAL(10,2),
    seno DOUBLE(30,29),
    coseno DOUBLE(30,29),
    tangente SMALLINT UNSIGNED
) CHARACTER SET = 'UTF8MB4' COLLATE = 'utf8mb4_general_ci';

-- Insertar 3 registros válidos
INSERT INTO tipo_datos_num VALUES (
	NULL,
    21,
    -6,
    27,
    10,
    203551,
    0.90,
    300,
    45.56,
    -12.41,
    580,
    10000,
    28.10,
    45000,
    0.3546,
    0.845,
    45
);