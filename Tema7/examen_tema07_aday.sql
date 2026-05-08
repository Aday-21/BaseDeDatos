-- Active: 1777278272534@@127.0.0.1@3306
-- examen
-- Aday Trandafir Garcia

-- 1. Crear Usuarios

/*
1.1 Crear el usuario estadio con password Est@dio25. 
Sin ningún privilegio, sólo podrá acceder a la base de datos de prueba test.
*/
SELECT PASSWORD(Est@dio25);
CREATE USER 'estadio'@'localhost' IDENTIFIED BY 'Est@dio25';
GRANT SELECT ON test.* TO 'estadio'@'localhost';

/*
1.2 Crear el usuario marcador con password Gol#2025. 
Sin ningún privilegio, sólo podrá acceder a la base de datos de prueba test.
*/
SELECT PASSWORD(Gol#2025);
CREATE USER	'marcador'@'localhost' IDENTIFIED BY 'Gol#2025';
GRANT SELECT ON test.* TO 'marcador'@'localhost';

/*
1.3 Crear el usuario cuyo nombre sea tu nombre seguido del primer apellido, 
todo junto y en minúsculas (por ejemplo: juanmoreno), con password Examen#07. Sin ningún privilegio inicial.
*/
SELECT PASSWORD(Examen#07);
CREATE USER 'adaytrandafir'@'localhost' IDENTIFIED BY 'Examen#07';
GRANT SELECT ON test.* TO 'adaytrandafir'@'localhost';

-- 2. Asignacion de privilegios

/*
2.1 Asignar al usuario estadio privilegios de superadministrador: todos los privilegios
 sobre todas las bases de datos, incluyendo el privilegio GRANT OPTION.
*/
GRANT ALL PRIVILEGES, GRANT OPTION ON *.* TO 'estadio'@'localhost';
/*
2.2 Asignar al usuario estadio todos los privilegios sobre la base de datos futbol.
*/
GRANT ALL PRIVILEGES ON futbol.* TO 'estadio'@'localhost';
/*
2.3 Asignar al usuario estadio todos los privilegios sobre las
 tablas equipos y jugadores de la base de datos futbol.
*/
GRANT ALL PRIVILEGES ON futbol.equipos TO 'estadio'@'localhost';
GRANT ALL PRIVILEGES ON futbol.jugadores TO 'estadio'@'localhost';
/*
2.4 Asignar al usuario marcador privilegios para sólo consultar
(SELECT) las tablas equipos, jugadores, partidos y goles 
de la base de datos futbol.
*/
GRANT SELECT ON futbol.equipos TO 'marcador'@'localhost';
GRANT SELECT ON futbol.jugadores TO 'marcador'@'localhost';
GRANT SELECT ON futbol.partidos TO 'marcador'@'localhost';
GRANT SELECT ON futbol.goles TO 'marcador'@'localhost';

/*
2.5 Asignar al usuario marcador privilegios para consultar y actualizar las
 columnas nombre, estadio, aforo y ciudad de la tabla equipos de la base de datos futbol.
*/
GRANT SELECT(nombre, estadio, aforo, ciudad),
      UPDATE(nombre, estadio, aforo, ciudad) 
      ON futbol TO 'marcador'@'localhost';
/*
2.6 Asignar al usuario marcador privilegios para sólo consultar las columnas id,
nombre y fecha_nac, y actualizar únicamente la columna equipo_id de la tabla
jugadores de la base de datos futbol.
*/
GRANT SELECT(id, nombre, fecha_nac),
      UPDATE(equipo_id)
      ON futbol TO 'marcador'@'localhost';

/*
2.7 Asignar al usuario con tu nombre todos los privilegios para 
acceder en modo consulta a todas las tablas de la base de 
datos futbol excepto a la tabla goles.
*/
GRANT ALL PRIVILEGES ON futbol.* TO 'adaytrandafir'@'localhost';
REVOKE ALL PRIVILEGES ON futbol.goles FROM 'adaytrandafir'@'localhost';


-- 3. Eliminiar privilegios

/*
3.1 Quitar al usuario estadio el privilegio GRANT OPTION.
*/
REVOKE GRANT OPTION FROM 'estadio'@'localhost';

/*
3.2 Quitar al usuario estadio todos los privilegios sobre todas las bases de datos.
*/
REVOKE ALL PRIVILEGES ON *.* FROM 'estadio'@'localhost';

/*
3.3 Quitar al usuario estadio todos los privilegios sobre la base de datos futbol.
*/
REVOKE ALL PRIVILEGES ON futbol.* FROM 'estadio'@'localhost';

/*
3.4 Quitar al usuario marcador el privilegio de inserción 
(INSERT) sobre la tabla partidos de la base de datos futbol.
*/
REVOKE INSERT ON futbol.partidos FROM 'estadio'@'localhost';

/*
3.5 Quitar al usuario marcador el privilegio de consulta sobre las columnas id, 
nombre y fecha_nac de la tabla jugadores de la base de datos futbol.
*/
REVOKE SELECT(id, nombre, fecha_nac) ON futbol.jugadores FROM 'marcador'@'localhost';

/*
3.6 Quitar al usuario marcador el privilegio de acceso a todas las tablas de la
base de datos futbol excepto a las tablas equipos y jugadores.
*/
REVOKE ALL PRIVILEGES ON futbol.* FROM 'marcador'@'localhost';
GRANT SELECT ON futbol.equipos TO 'marcador'@'localhost';
GRANT SELECT ON futbol.jugadores TO 'marcador'@'localhost';

/*
3.7 Quitar al usuario con tu nombre los privilegios de consulta, actualización y 
eliminación sobre las tablas equipos, jugadores y partidos de la base de datos futbol.
*/
REVOKE SELECT, UPDATE, DELETE ON futbol.equipos FROM 'adaytrandafir'@'localhost';
REVOKE SELECT, UPDATE, DELETE ON futbol.jugadores FROM 'adaytrandafir'@'localhost';
REVOKE SELECT, UPDATE, DELETE ON futbol.partidos FROM 'adaytrandafir'@'localhost';

-- 4. Renombrar usuarios, cambiar password

/*
4.1 Renombrar el usuario estadio a estadio_admin.
*/
ALTER USER 'estadio'@'localhost' RENAME TO 'estadio_admin'@'localhost';

/*
4.2 Renombrar el usuario marcador a marcador_ro (read-only).
*/
ALTER USER 'marcador'@'localhost' RENAME TO 'marcador_ro'@'localhost';

/*
4.3 Cambiar el password del usuario estadio_admin. El nuevo password 
será Admin#2026. Se ha de mostrar la obtención del password cifrado.
*/
SELECT PASSWORD(Admin#2026);
ALTER USER 'estadio_admin'@'localhost' IDENTIFIED BY 'Admin#2026';

/*
4.4 Cambiar el password del usuario marcador_ro. El nuevo password 
será ReadOnly#99. Se ha de mostrar la obtención del password cifrado.
*/
SELECT PASSWORD(ReadOnly#99);
ALTER USER 'marcador_ro'@'localhost' IDENTIFIED BY 'ReadOnly#99';

/*
4.5 Eliminar usuario con tu nombre
*/
DROP USER 'adaytrandafir'@'localhost';

-- 5. Transaccion con Savepoints

USE empresa;

/*
5.1 Iniciar Transaccion
*/
START TRANSACTION;

/*
5.2 Crear un SAVEPOINT llamado antes_subida.
*/
SAVEPOINT antes_subida;

/*
5.3 Insertar dos nuevos empleados con datos válidos 
a criterio del alumno en el departamento de 'Desarrollo' (id = 5).
*/
INSERT INTO empleados (nombre, fecha_nac, salario, departamento_id) VALUES
('Empleado1', '1990-01-01', 30000, 5),
('Empleado2', '1992-02-02', 32000, 5);

/*
5.4 Crear un SAVEPOINT llamado despues_insercion.
*/
SAVEPOINT despues_insercion;

/*
5.5 Incrementar en un 15% el salario de 
todos los empleados del departamento 'Investigación' (id = 1).
*/
UPDATE empleados SET salario = salario * 1.15 WHERE departamento_id = 1;

/*
5.6 Incrementar en un 10% el salario de todos los 
empleados del departamento 'Desarrollo' (id = 5).
*/
UPDATE empleados SET salario = salario * 1.10 WHERE departamento_id = 5;

/*
5.7 Si tras la subida algún empleado del departamento 'Investigación' 
superase un salario de 60.000 €, deshacer únicamente las actualizaciones 
de salario volviendo al SAVEPOINT despues_insercion, manteniendo así los 
dos empleados insertados.
*/
SELECT * FROM empleados WHERE departamento_id = 1 AND salario > 60000;
ROLLBACK TO despues_insercion;

/*
5.8 En caso contrario, confirmar la transacción completa con COMMIT.
*/
COMMIT;

-- 6. Funciones MySQL

USE empresa;

/*
6.1 Mostrar el nombre completo de cada empleado en mayúsculas 
(nombre + apellidos), junto con la longitud total del nombre completo y 
los 4 primeros caracteres de los apellidos como código abreviado.
*/
SELECT CONCAT(nombre, ' ', apellidos) AS nombre_completo,
       LENGTH(CONCAT(nombre, ' ', apellidos)) AS longitud_nombre,
       LEFT(apellidos, 4) AS codigo_abreviado
FROM empleados;

/*
6.2 Mostrar el nombre, los apellidos y el salario formateado con separador 
de miles y 2 decimales usando FORMAT. Ordenar de mayor a menor salario.
*/
SELECT nombre, apellidos, FORMAT(salario, 2) AS salario_formateado
FROM empleados
ORDER BY salario DESC;

/*
6.3 Mostrar el nombre, los apellidos y la edad actual de cada empleado. 
Calcular la edad usando TIMESTAMPDIFF(YEAR, fecha_nac, NOW()).
*/
SELECT nombre, apellidos, TIMESTAMPDIFF(YEAR, fecha_nac, NOW()) AS edad
FROM empleados;

/*
6.4 Mostrar los empleados que cumplen años este mes. Usar MONTH(fecha_nac) y MONTH(NOW()).
*/
SELECT nombre, apellidos, MONTH(fecha_nac)
FROM empleados
WHERE MONTH(fecha_nac) = MONTH(NOW());

/*
6.5 Mostrar el nombre, los apellidos y el número de años que llevan en la empresa, 
calculado desde fecha_nac hasta hoy. Usar DATEDIFF dividido entre 365. Ordenar de 
mayor a menor antigüedad.
*/
SELECT nombre, apellidos, DATEDIFF(NOW(), fecha_nac)/365 AS dias_en_empresa 
FROM empleados
ORDER BY dias_en_empresa DESC;

/*
6.6 Mostrar el nombre, los apellidos y la ciudad extraída de la columna direccion. 
La dirección tiene el formato 'número calle, ciudad, estado'; extraer la ciudad 
usando SUBSTRING_INDEX.
*/
SELECT nombre, apellidos, SUBSTRING_INDEX(direccion, ',', 2) AS ciudad
FROM empleados;

/*
6.7 Mostrar para cada empleado un código de empleado con el siguiente formato: 
3ULTIMOSNSS/2PRIMINICIALES_NOMBRE/2PRIMINICIALES_APELLIDOS. Usar RIGHT, LEFT, 
UPPER, CONCAT y SUBSTRING_INDEX.
*/
SELECT nombre, apellidos, nss, 
    CONCAT(RIGHT(nss, 3),
    '/',
    LEFT(UPPER(nombre), 2), 
    '/', 
    LEFT(UPPER(apellidos), 2)) 
    AS codigo_empleado
FROM empleados;


-- 7. Bloqueos de tablas

USE futbol;

/*
7.1 Bloquear la tabla equipos en modo lectura (READ).
*/
LOCK TABLES equipos READ;

/*
7.2 Comprobar que se puede consultar (SELECT) la tabla equipos (debe permitirlo).
*/
SELECT * FROM equipos; -- Este comando si se puede ejecutar porque el bloqueo es de lectura

/*
7.3 Intentar insertar un nuevo equipo (no debe permitirlo; indicar en un comentario el error obtenido).
*/
INSERT INTO equipos (6, 'Puerto Serrano Atletico', 'Luismi amarillo', 11659, 1547, 'Cádiz');
-- Da error porque la tabla esta bloqueada

/*
7.4 Desbloquea todas las tablas
*/
UNLOCK TABLES;

-- 8. Exportar e importar datos

USE empresa;

/*
8.1 Exportar al fichero empleados_houston.csv todos los empleados cuya dirección 
contenga la ciudad 'Houston'. El fichero ha de estar en formato CSV con las 
siguientes características:
Separador de campos: ;
Separador de registros: \n
Valores no numéricos entre comillas dobles ""
Columnas a exportar: id, nombre, apellidos, nss, fecha_nac, direccion, salario
*/
SELECT id, nombre, apellidos, nss, fecha_nac, direccion, salario
INTO OUTFILE 'C:/Users/09_1DAW_Alum/Documents/Base de Datos 25-26/Actividades/Tema7/empleados_houston.csv'
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
ºENCLOSED BY '"'
FROM empleados
WHERE direccion LIKE '%Houston%';

/*
8.2 Realizar una copia de seguridad completa (estructura y datos) de la base de 
datos empresa mediante mysqldump. Archivo de salida: empresa_backup.sql.
*/
-- Desde la terminal de comandos:
-- mysqldump -u root -p empresa > C:/Users/09_1DAW_Alum/Documents/Base de Datos 25-26/Actividades/Tema7/empresa_backup.sql




