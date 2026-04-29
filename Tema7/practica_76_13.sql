-- practica_76_13
-- Aday Trandafir Garcia

# 1. Crear la base de datos fmatematicas
DROP DATABASE IF EXISTS fmatematicas;
CREATE DATABASE IF NOT EXISTS fmatematicas;

-- usamos la base de datos
USE fmatematicas;
# 2. Crear la tabla angulos los valores con máxima precisión 
-- id
-- grados
-- radianes
-- seno
-- coseno
-- tangente
DROP TABLE IF EXISTS angulos;
CREATE TABLE IF NOT EXISTS angulos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    grados SMALLINT UNSIGNED,
    radianes DOUBLE(31,30),
    seno DOUBLE(31,30),
    coseno DOUBLE(31,30),
    tangente DOUBLE(31,30)
);
# 3. Insertar en la tabla angulos los valores de 5 angulos (0 a 360)
-- actualizar la columna grados
INSERT INTO	angulos (grados) VALUES
(25),
(80), 
(350), 
(250), 
(130);
# 4. Actualizar la columna radianes a partir de la columna grados
-- añadida en el apartado anterior
UPDATE angulos 
SET 
    radianes = RADIANS(grados);
# 5. Actualizar las columnas seno, coseno y tangente a partir de la 
-- columana radianes actualizada en el apartado anterior
UPDATE angulos 
SET 
    seno = SIN(radianes),
    coseno = COS(radianes),
    tangente = TAN(radianes);
# 6. Obtener un valor entre [1, 10]
SELECT CEILING(RAND()*10);
# 7. Obtener un valor entre [0, 9]
SELECT FLOOR(RAND()*9);
# 8. Obtener un valor entre [0, 4]
SELECT FLOOR(RAND()*4);
# 9. Obtener un valor entre [0, 100000]
SELECT FLOOR(RAND()*100001);