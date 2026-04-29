-- practica_71_13
-- Aday Trandafir Garcia

-- 1. Crear usuarios
SELECT password('juan_01');
CREATE USER 'juan'@'localhost' IDENTIFIED BY '*DBEA713660EAA6053C71DCAD75AFBC96A73ECA0F';
SELECT PASSWORD('pedro_01');
CREATE USER 'pedro'@'localhost' IDENTIFIED BY '*63058EE0D2496A67E1B947A59809A732758516FF';
SELECT password('maria_03');
CREATE USER 'maria'@'localhost' IDENTIFIED BY '*610163669DEF78BB9ABD9FF46C482F1235C7B03D';
SELECT password('miguel_04');
CREATE USER 'miguel'@'localhost' IDENTIFIED BY '*FD1C9AE91857DAED605342CF3B9B1EBA5B1E4A46';
SELECT PASSWORD('rocio_05');
CREATE USER 'rocio'@'localhost' IDENTIFIED BY '*8D4F0AFD37706EF85EE95411E70503B0C33027DF';

-- 3. Crear Usuario tabla mysql.user
SELECT PASSWORD('roberto_79');
INSERT INTO mysql.user (host,user,password)
VALUES ('localhost','roberto','*4C6E33327FDDF7C42D2683DC5BABCAB8848540DF');

GRANT ALL PRIVILEGES ON test.* TO 'roberto'@'localhost';
-- 4. Eliminar usuarios
DROP USER 'miguel'@'localhost';
DROP USER 'rocio'@'localhost';

FLUSH PRIVILEGES;

SELECT user FROM mysql.user;


