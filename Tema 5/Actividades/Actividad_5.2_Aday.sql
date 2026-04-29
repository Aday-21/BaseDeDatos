-- Actividad 5.2
-- Tema 5: Lenguaje SQL - DDL
-- Aday

-- 1
-- Crear la base de datos ajedrez, usar siempre la clausula IF NOT EXISTS.
-- Indicar el juego de caracteres y la colección establecida por defecto.
-- UTF8MB4
-- utf8mb4_general_ci

CREATE DATABASE IF NOT EXISTS ajedrez
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 2 
-- Modificar la base de datos ajedrez para establecer el juego de caracteres 
-- inglés internacional así como la colección correspondiente.

-- Opción 1

ALTER DATABASE ajedrez
CHARACTER SET hp8 COLLATE hp8_english_ci;

-- 3 
-- Eliminar la base de datos ajedrez.

DROP DATABASE IF EXISTS ajedrez;

-- 4 
-- Crear la base de datos futbol, usar siempre la clausula IF NOT EXISTS.
-- Indicar el juego de caracteres y la colección establecida por defecto.
-- El juego de caracteres utf16.
-- La colección utf16_general_ci.

CREATE DATABASE IF NOT EXISTS futbol
CHARACTER SET utf16 COLLATE utf16_general_ci;

-- 5
-- Modificar la base de datos futbol para cambiar al juego de caracteres UTF8MB4
-- y la colección utf8mb4_general_ci.
ALTER DATABASE futbol
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 6
-- Eliminar definitivamente la base de datos futbol

DROP DATABASE futbol;



