-- practica_710_13
-- Aday Trandafir Garcia

-- 1 accede usuarioroot a modo consola
mysql -h localhost -u root

-- 2 comandos sql
show databases;
use geslibros;
show tables;
select host, user, password from mysql.user;
show grants for root@localhost;
show grants for current_user();

-- 3 crear usuario
create user lopez@localhost identified by '123456';
grant create, alter, update on maratoon.corredores to lopez@localhost;

-- 4 cambiar password usuario anterior
alter user lopez@localhost identified by '654321';

-- 5 transaccion en geslibros
use geslibros;
start transaction;

update libros
set precio = precio * 1.10;

-- comprobar actualizacion
select * from libros;

-- terminar transaccion de forma no satisfactoria
rollback;

-- 6 bloqueo de tablas
use geslibros;

lock tables libros read;

-- este comando no se ejecuta
-- select * from autores;

unlock tables;

-- ahora si se ejecuta
select * from autores;

-- 7 transaccion con bloqueo por condicion
start transaction;

select * from clientes
where provincia = 'Cádiz'
for share;

select * from clientes
where provincia <> 'Cádiz';

commit;

-- 8 operaciones en maratoon
use maratoon;

update corredores
set edad = edad + 1;

select id, apellidos, nombre, edad, club, categoria
from corredores;

select *
from corredores
where localidad = 'Villamartín'
into outfile '/tmp/corredores_villamartin.csv'
fields terminated by ','
enclosed by '"'
lines terminated by '\n';

-- 9 fichero con formato csv
-- exportar
SELECT *
FROM corredores
WHERE localidad = 'Villamartín'
INTO OUTFILE 'C:/Users/09_1DAW_Alum/Documents/Base de Datos 25-26/Actividades/Tema7/corredores_villamartin.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- 10 salir de mysql
exit;

-- 11 copia de seguridad maratoon
mysqldump -u root -p maratoon > maratoon.sql

-- 12 copia de todas las bases de datos
mysqldump -u root -p --all-databases > alldatabases.sql

-- 13 exportar empresa a xml
mysqldump -u root -p --xml empresa > empresa.xml