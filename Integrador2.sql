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
