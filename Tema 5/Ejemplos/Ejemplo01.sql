-- juego de caracteres mysql
SHOW CHARACTER SET;

-- muestro las colecciones disponibles
SHOW COLLATION;

-- crear la base de datos ejemplo
CREATE DATABASE ejemplo;

-- crear la base de datos ejemplos solo si no existe
CREATE DATABASE IF NOT EXISTS ejemplo;

-- crear la base de datos Banco multilingüe  con UFT8
CREATE DATABASE IF NOT EXISTS banco
CHARACTER SET UTF8 COLLATE utf8_general_ci;

-- crear la base de datos Banco para españoles con UFT8
CREATE DATABASE IF NOT EXISTS Banco
CHARACTER SET UTF8 COLLATE utf8_spanish_ci;

-- crear la base de datos Banco para españoles con utf8mb4
CREATE DATABASE IF NOT EXISTS BAnco
CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

-- Crear la base de datos geslibros español multilingüe con 
-- juego de caracteres utf8mb4
-- Opciones por defecto
CREATE DATABASE IF NOT EXISTS geslibros
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;


