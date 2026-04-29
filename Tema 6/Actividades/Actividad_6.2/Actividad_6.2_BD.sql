-- Actividad 6.2
-- Tema 6 
-- Base de Datos 25/26
-- Alumno; Aday

USE futbol;

-- Cambiar el nombre del equipo "Girona FC"
UPDATE equipos
SET nombre = 'Girona Futbol Club'
WHERE id = 10;

-- Actualizar la ciudad de Villarreal CF
UPDATE equipos
SET ciudad = 'Vila-real'
WHERE id = 7;

-- Incrementar en 1.000 el aforo de estadios con más de 50.000
UPDATE equipos 
SET 
    aforo = aforo + 1000
WHERE
    aforo > 50000;

-- Mover a Hugo Duro al Villarreal CF (id = 7)
UPDATE jugadores 
SET 
    equipo_id = 7
WHERE
    nombre = 'Hugo Duro';

-- Corregir fecha de nacimiento de Takefusa Kubo
UPDATE jugadores 
SET 
    fecha_nac = '2001-06-05'
WHERE
    nombre = 'Takefusa Kubo';

-- Ajustar goles del partido id = 7 a 2-1
UPDATE partidos 
SET 
    goles_casa = 2,
    goles_fuera = 1
WHERE
    id = 7;

-- Añadir "(actualizado)" a los 3 últimos partidos
UPDATE partidos 
SET 
    observaciones = CONCAT_WS(' ', observaciones, '(actualizado)')
ORDER BY fecha DESC LIMIT 3;

-- Retrasar 1 minuto los goles por penalti
UPDATE goles 
SET 
    minuto = minuto + 1
WHERE
    descripcion LIKE '%penalti%';

-- Cambiar los goles del partido 13 al jugador Gerard Moreno (id=18)
--     solo los goles del equipo de casa
UPDATE goles g
        JOIN
    partidos p ON g.partido_id = p.id
        JOIN
    jugadores j ON g.jugador_id = j.id 
SET 
    g.jugador_id = 18
WHERE
    g.partido_id = 13
        AND j.equipo_id = p.equipo_casa_id;

-- Sumar 1 minuto a los 2 primeros goles de Iñaki Williams
UPDATE goles 
SET 
    minuto = minuto + 1
WHERE
    jugador_id = 20 ORDER BY minuto LIMIT 2;

-- Cambiar el estadio de la Real Sociedad
UPDATE equipos 
SET 
    estadio = 'Reale Arena Nuevo'
WHERE
    id = 9 LIMIT 1;

-- Mover jugadores del Girona Futbol Club al Athletic Club (id=8)
UPDATE jugadores 
SET 
    equipo_id = 8
WHERE
    equipo_id = 10;

--  Sumar 1 gol al equipo local cuando Valencia CF juega en casa
UPDATE partidos 
SET 
    goles_casa = goles_casa + 1
WHERE
    equipo_casa_id = 6;

-- Restar 2 minutos a los goles con minuto mayor a 80
UPDATE goles 
SET 
    minuto = minuto - 2
WHERE
    minuto > 80;

-- Renombrar a José Luis Gayà
UPDATE jugadores
SET nombre = 'José Gayà'
WHERE nombre = 'José Luis Gayà';
