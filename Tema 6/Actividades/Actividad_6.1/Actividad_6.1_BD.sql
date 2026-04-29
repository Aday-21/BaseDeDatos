-- Actividad 6.1
-- Tema 6 
-- Base de Datos 25/26
-- Alumno; Aday

-- Descripción; mina de datos de la bbdd futbol

-- Usar futbol
USE futbol;

-- Tabla equipos
INSERT INTO equipos VALUES
(6, 'Athletic Club', 'San Mamés', 53289, 1898, 'Bilbao'),
(7, 'Real Sociedad', 'Reale Arena', 39500, 1909, 'San Sebastián'),
(8, 'Valencia CF', 'Mestalla', 49430, 1919, 'Valencia'),
(9, 'Villarreal CF', 'Estadio de la Cerámica', 23500, 1923, 'Villarreal'),
(10, 'Girona FC', 'Montilivi', 13500, 1930, 'Girona');

-- Tabla jugadores
INSERT INTO jugadores VALUES
(16, 'Nico Williams', '2002-07-12', 6),
(17, 'Iñaki Williams', '1994-06-15', 6),
(18, 'Mikel Oyarzabal', '1997-04-21', 7),
(19, 'Takefusa Kubo', '2001-06-04', 7),
(20, 'Artem Dovbyk', '1997-06-21', 10);


-- Tabla partidos
INSERT INTO partidos VALUES
(7, 6, 7, '2024-04-20 18:30:00', 2, 1, 'Derbi vasco muy disputado'),
(8, 10, 8, '2024-04-22 21:00:00', 3, 1, 'Gran actuación ofensiva del Girona'),
(9, 9, 6, '2024-04-27 16:15:00', 1, 1, 'Empate con pocas ocasiones'),
(10, 7, 10, '2024-05-04 18:30:00', 0, 2, 'Girona sorprende a domicilio'),
(11, 8, 9, '2024-05-06 21:00:00', 2, 0, 'Valencia se hace fuerte en Mestalla');



-- Tabla goles
INSERT INTO goles VALUES
(NULL, 7, 35, 'Nico Williams marca tras una contra rápida', 16),
(NULL, 7, 70, 'Oyarzabal empata de penalti', 18),
(NULL, 8, 25, 'Dovbyk remata de cabeza en el área', 20),
(NULL, 8, 60, 'Segundo gol de Dovbyk tras un rechace', 20),
(NULL, 11, 80, 'Gol de falta directa para cerrar el partido', 19);



