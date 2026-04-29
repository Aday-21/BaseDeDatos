-- practica_75_13
-- conexion ubrique_01

-- 2
USE geslibros;

-- 3
LOCK TABLE clientes READ;
SELECT * FROM libros; -- no se puede porque esta bloqueda la tabla clientes

-- 5 
UNLOCK TABLES;