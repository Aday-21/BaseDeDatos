-- Borrar la tabla si existe
DROP TABLE IF EXISTS tipos_datos_string;

-- Crear la tabla
CREATE TABLE tipos_datos_string (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_postal CHAR(5),
    telefono VARCHAR(20),
    apellidos VARCHAR(100),
    nombre VARCHAR(50),
    nombre_acronimo CHAR(10),
    historial TEXT,
    direccion VARCHAR(150),
    provincia VARCHAR(50),
    observaciones TEXT,
    contenido_libro LONGTEXT,
    categoria ENUM('Primera','Segunda','Tercera','Regional'),
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insertar 3 registros
INSERT INTO tipos_datos_string VALUES
(NULL, '28001', '+34123456789', 'García López', 'Juan', 'JL',
 'Sin antecedentes', 'Calle Mayor 10', 'Madrid',
 'Buen alumno', 'Texto completo del libro', 'Primera',
 NOW(), NOW()),

(NULL, '41001', '+34987654321', 'Pérez Gómez', 'Ana', 'AG',
 'Paciente alérgico', 'Avda Andalucía 25', 'Sevilla',
 'Necesita refuerzo', 'Contenido del libro', 'Segunda',
 NOW(), NOW()),

(NULL, '11001', '+447700900123', 'Ruiz Martín', 'Carlos', 'CM',
 'Historial en revisión', 'Plaza España 3', 'Cádiz',
 'Sin observaciones', 'Libro completo', 'Regional',
 NOW(), NOW());

-- Comprobar que se han añadido
SELECT * FROM tipos_datos_string;
