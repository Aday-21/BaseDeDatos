-- Usar la base de datos
USE test;

-- Crear la tabla pacientes
CREATE TABLE pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    nss VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20),
    poblacion VARCHAR(50) NOT NULL,
    expediente VARCHAR(20) NOT NULL,
    dni VARCHAR(10) NOT NULL,
    historial_clinico TEXT NOT NULL,
    fecha_nac DATE NOT NULL,
    edad INT NOT NULL
);
