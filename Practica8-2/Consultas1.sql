USE tienda;

SELECT nombre FROM tienda.producto;
SELECT nombre, precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT nombre as "Nombre de producto",
	CONCAT(precio, " USD") AS Dolar,
    CONCAT(precio, " EUR") AS Euro
FROM tienda.producto;

SELECT UPPER(nombre), precio FROM tienda.producto;

-- 8
SELECT nombre, 	
	UPPER(LEFT(nombre, 2)) as Iniciales
FROM tienda.fabricante;

-- 9
SELECT nombre, ROUND(precio, 1) as precio
FROM tienda.producto;
-- 10
SELECT nombre, TRUNCATE(precio, 0) as precio
FROM tienda.producto;
-- 11
SELECT id_fabricante, nombre
FROM tienda.producto
ORDER BY id_fabricante;
-- 12
SELECT id_fabricante, nombre
FROM tienda.producto
GROUP BY id_fabricante;
-- 13
SELECT nombre FROM tienda.fabricante ORDER BY nombre;
-- 14
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
-- 15
SELECT nombre FROM tienda.producto 
ORDER BY nombre ASC, precio DESC;
-- 16
SELECT * FROM tienda.fabricante LIMIT 5;
-- 17
SELECT * FROM tienda.fabricante LIMIT 2 OFFSET 3;
-- 18
SELECT nombre, precio FROM tienda.producto 
ORDER BY precio LIMIT 1;
-- 19
SELECT nombre, precio 
FROM tienda.producto
ORDER BY precio DESC LIMIT 1;
-- 20
SELECT nombre 
FROM tienda.producto
WHERE id_fabricante = 2;
-- 21
SELECT nombre
FROM tienda.producto
WHERE precio <= 120;
-- 22
SELECT nombre
FROM tienda.producto
WHERE precio >= 400;
-- 23
SELECT nombre
FROM tienda.producto
WHERE precio < 400;
-- 24
SELECT *
FROM tienda.producto
WHERE precio > 80 AND precio < 300;
-- 25
SELECT * 
FROM tienda.producto
WHERE precio BETWEEN 60 AND 200;
-- 26
SELECT * 
FROM tienda.producto
WHERE precio > 200 AND id_fabricante = 6;
-- 27
SELECT * 
FROM tienda.producto
WHERE id_fabricante = 1 
	OR id_fabricante = 3
    or id_fabricante = 5;
-- 28
SELECT *
FROM tienda.producto
WHERE id_fabricante IN(1,3,5);
-- 29
SELECT nombre,
	precio*100 as Centimo
FROM tienda.producto;
-- 30
SELECT nombre 
FROM tienda.fabricante 
WHERE nombre LIKE "S%";
-- 31
SELECT nombre
FROM tienda.fabricante
WHERE nombre LIKE "%e";
-- 32
SELECT nombre
FROM tienda.fabricante
WHERE nombre LIKE "%w%";
-- 33
SELECT nombre
FROM tienda.fabricante
WHERE LENGTH(nombre) = 4;
-- 34
SELECT * 
FROM tienda.producto
WHERE nombre LIKE "%Portatil%";
-- 35
SELECT *
FROM tienda.producto
WHERE nombre LIKE "%Monitor%"
	AND precio < 215;
-- 36
SELECT nombre, precio
FROM tienda.producto
WHERE precio >= 180
ORDER BY precio DESC,
	nombre ASC;