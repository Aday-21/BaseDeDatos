-- Ejercicio 5.9
DROP DATABASE IF EXISTS RestriccionesDefault;
CREATE DATABASE IF NOT EXISTS RestriccionesDefault
CHARACTER SET utf8
COLLATE utf8_general_ci;

-- Usar la base de datos
USE RestriccionesDefault;

-- Crear la tabla ResDAFAULT
CREATE TABLE ResDAFAULT (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    poblacion VARCHAR(50) DEFAULT 'Ubrique',
    provincia VARCHAR(50) DEFAULT 'Cádiz',
    nacionalidad VARCHAR(50) DEFAULT 'España',
    precio DECIMAL(6,2) DEFAULT 10.20,
    sueldo DECIMAL(8,2) DEFAULT 1500.00,
    fecha_hora_llegada DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_llegada TIME NOT NULL,
    hora_llegada TIME DEFAULT CURTIME(),
    casado BOOLEAN DEFAULT 1,
    carnet_conducir BOOLEAN DEFAULT 1
);

-- Insertar 3 registros válidos
INSERT INTO ResDAFAULT () VALUES ();  -- Todos los valores por defecto

INSERT INTO ResDAFAULT (poblacion, provincia, nacionalidad, precio, sueldo, casado, carnet_conducir)
VALUES ('Sevilla', 'Sevilla', 'España', 15.50, 1800.00, 0, 1);

INSERT INTO ResDAFAULT (poblacion, provincia, nacionalidad, sueldo, casado, carnet_conducir)
VALUES ('Málaga', 'Málaga', 'España', 2000.00, 1, 0);

-- Comprobar los datos
SELECT * FROM ResDAFAULT;
