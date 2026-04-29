-- Crear la tabla
CREATE TABLE IF NOT EXISTS tipo_datos_fechas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_nacimiento DATE,
    fecha_hora_nacimiento DATETIME,
    hora_llegada TIME,
    hora_salida TIME,
    anno_nacimiento INT,
    anno_fundacion INT,
    fecha_hora_salida DATETIME,
    fecha_hora_llegada DATETIME,
    fecha_hora_actual DATETIME,
    edad INT,
    create_at DATETIME,
    update_at DATETIME
);

-- Insertar 3 registros
INSERT INTO tipo_datos_fechas VALUES
(1, '1990-05-10', '1990-05-10 08:30:00',
 '08:00:00', '14:00:00', 1990, 1950,
 '2024-01-01 14:00:00', '2024-01-01 08:00:00',
 '2024-01-01 10:30:00', 34,
 '2024-01-01 10:00:00', '2024-01-01 10:00:00'),

(2, '1985-03-20', '1985-03-20 12:15:00',
 '09:00:00', '15:00:00', 1985, 1975,
 '2024-02-01 15:00:00', '2024-02-01 09:00:00',
 '2024-02-01 11:00:00', 39,
 '2024-02-01 11:00:00', '2024-02-01 11:00:00'),

(3, '2000-11-01', '2000-11-01 06:45:00',
 '10:00:00', '18:00:00', 2000, 2005,
 '2024-03-01 18:00:00', '2024-03-01 10:00:00',
 '2024-03-01 12:00:00', 24,
 '2024-03-01 12:00:00', '2024-03-01 12:00:00');

-- Ver los datos
SELECT * FROM tipo_datos_fechas;
