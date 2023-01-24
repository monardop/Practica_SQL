USE bonus_track;
-- Artista-Titulo y genero, ordenados alfabeticamente
SELECT CONCAT(ARTISTA, ' - ' , TITULO) AS CANCION, GENERO
FROM TOP_SPOTIFY
ORDER BY CANCION;
-- Alternativa a lo anterior
SELECT CONCAT_WS(' - ' ,ARTISTA, TITULO) AS CANCION, GENERO
FROM TOP_SPOTIFY
ORDER BY CANCION;
-- Generos en mayuscula
SELECT CONCAT(ARTISTA, ' - ' , TITULO) AS CANCION, UPPER(GENERO)
FROM TOP_SPOTIFY
ORDER BY CANCION;
-- Lo anterior, pero con una columna que calcule cuanto tiempo tiene la cancion
SELECT CONCAT(ts.ARTISTA, ' - ' , ts.TITULO) AS CANCION, 
	ts.GENERO,
    YEAR(curdate()) - ts.ANO AS 'AÑOS'
FROM TOP_SPOTIFY as ts
ORDER BY CANCION;
-- Columna con cantidad de canciones
SELECT COUNT(ts.TITULO) AS CANCIONES
FROM Top_spotify as ts;
-- cantidad de canciones que salieron en cada año
SELECT COUNT(TS.TITULO) AS CantCanciones, ANO
FROM TOP_SPOTIFY AS ts
GROUP BY ANO;
-- lo anterior, pero solo los años con mas de 50 canciones
SELECT COUNT(TS.TITULO) AS CantCanciones, ANO
FROM TOP_SPOTIFY AS ts
GROUP BY ANO
HAVING CantCanciones > 50;

-- Ejercicio 2
USE LIBRERIA;

-- Apellido, nombre y provincia
SELECT CONCAT(autores.apellido, ', ', autores.nombre) AS NombreCompleto, 
	autores.provincia
FROM autores
ORDER BY NombreCompleto;

-- Variacion de lo anterior, con el nombre en mayuscula
SELECT CONCAT_WS(', ', autores.apellido, UPPER(autores.nombre)) AS NombreCompleto,
	autores.provincia
FROM autores
ORDER BY NombreCompleto;

-- Iniciales del autor, con su provincia
SELECT CONCAT(LEFT(autores.apellido, 1),LEFT(autores.nombre, 1)) as Iniciales,
	autores.provincia
FROM autores
ORDER BY Iniciales;

-- Lista de los empleados segun su tiempo de ingreso. Le añado su antiguedad
SELECT CONCAT(empleados.apellido, ', ', empleados.nombre, ' ', empleados.fecha_ingreso) AS Ingreso,
	CONCAT(TIMESTAMPDIFF(YEAR, empleados.fecha_ingreso, CURDATE()), ' años') AS Antiguedad
FROM libreria.empleados
ORDER BY empleados.apellido;

SELECT CONCAT(empleados.apellido, ', ', empleados.nombre) as NombreCompleto,
	YEAR(empleados.fecha_ingreso) as Ingreso
FROM libreria.empleados
ORDER BY Ingreso;

-- Libro más barato y más caro
SELECT MIN(libros.precio) as PrecioBarato, 
	MAX(libros.precio) as PrecioCaro,
	ROUND(AVG(libros.precio), 2) as PromedioPrecios
FROM libros;
-- Lo anterior pero agrupado por categorias
SELECT libros.categoria,
	MIN(libros.precio) as PrecioBarato, 
	MAX(libros.precio) as PrecioCaro,
	ROUND(AVG(libros.precio), 2) as PromedioPrecios
FROM libros
GROUP BY libros.categoria
HAVING libros.categoria NOT LIKE '%Sin asignar%';
