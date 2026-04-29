-- practica_75_13
-- Aday Trandafir Garcia

USE geslibros;

-- 1. Creacion de usuarios
CREATE USER ubrique_01@localhost IDENTIFIED BY 'ubrique_01';
CREATE USER arcos_01@localhost identified BY 'arcos_01';

-- Asignacion de privilegios
GRANT ALL PRIVILEGES ON *.* TO ubrique_01@localhost, arcos_01@localhost;

select * from mysql.user;








