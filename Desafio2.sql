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


-- Ejercicio 3
USE libreria;
-- Lista de info de autores de Buenos Aires
SELECT * FROM autores WHERE ciudad = 'Buenos Aires';
-- Datos de libros de mayor a menor en base a su precio
SELECT * FROM libros WHERE precio > 30 ORDER BY precio DESC;
-- Autores que no sean de bs as, ordenados alfabeticamente
SELECT * FROM autores WHERE provincia NOT LIKE '%BA%' ORDER BY provincia;
-- Libros ordenados alfabeticamente, seleccion por precio y categoria
SELECT * FROM libros WHERE precio < 20 AND categoria LIKE '%cuento%' ORDER BY titulo;
-- Novelas o ensayos ordenadas alfabéticamente
SELECT *  FROM libros WHERE categoria LIKE '%novelas%' OR categoria LIKE '%ensayos%' order by titulo;
-- Libros entre 20 y 35 dls
SELECT * FROM libros WHERE precio BETWEEN 20 AND 35 ORDER BY precio;
-- Crear una lista que muestre todos los datosde los autores cuyo nombre sea Jorge Luis, Victoria, Ernesto o Adolfo
SELECT *
FROM autores
WHERE nombre IN
	('Jorge Luis', 'Victoria', 'Ernesto', 'Adolfo')
ORDER BY apellido;
-- Libros cuyo titulo contentga la palabra mundo
SELECT * FROM libros WHERE titulo LIKE '%mundo%';
-- Libros sin precio ordenados alfabeticamente
SELECT * FROM libros WHERE precio IS NULL ORDER BY titulo;
