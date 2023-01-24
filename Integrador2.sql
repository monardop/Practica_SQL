-- Practica de filtrado de información
USE bonus_track;
-- Mostrar todo
SELECT * FROM top_spotify;
-- mostrar solo artista titulo y genero
SELECT ARTISTA, TITULO, GENERO FROM TOP_SPOTIFY;
-- Mostrar lo anterior, pero ordenado por genero musical
SELECT ARTISTA, TITULO, GENERO FROM TOP_SPOTIFY ORDER BY GENERO;
-- Lo mismo, en caso de repetirse genero ordenarlo en base al artista
SELECT ARTISTA, TITULO, GENERO FROM TOP_SPOTIFY ORDER BY GENERO, ARTISTA;

-- Segunda parte
-- 10 canciones, ordenadas alfabeticamente por artistas y titulo.
SELECT ARTISTA, TITULO, GENERO FROM TOP_SPOTIFY ORDER BY ARTISTA, TITULO LIMIT 10;
-- Lo mismo, pero desde la 11 a la 15
SELECT ARTISTA, TITULO, GENERO FROM TOP_SPOTIFY ORDER BY ARTISTA, TITULO LIMIT 4 OFFSET 10;
-- Canciones de madonna
SELECT * FROM TOP_SPOTIFY WHERE ARTISTA = 'Madonna';
-- Canciones de pop ordenadas en funcion al titulo
SELECT * FROM TOP_SPOTIFY WHERE GENERO = 'Pop' ORDER BY TITULO;
-- Canciones pop del 2015 ordenadas por titulo y artista
SELECT * FROM TOP_SPOTIFY WHERE ANO = 2015 ORDER BY ARTISTA, TITULO;
-- Genero dance pop anterior al 2011
SELECT * FROM TOP_SPOTIFY WHERE GENERO = 'Dance Pop' ORDER BY TITULO;