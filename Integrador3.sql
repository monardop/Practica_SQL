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

