USE bonus_track;
-- Artista-Titulo y genero, ordenados alfabeticamente
SELECT CONCAT(ARTISTA, ' - ' , TITULO) AS CANCION, GENERO
FROM TOP_SPOTIFY
ORDER BY CANCION;
-- 