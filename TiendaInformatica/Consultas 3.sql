-- Consultas resumen
-- 1
SELECT COUNT(nombre) as "Cantidad de productos"
FROM tienda.producto;
-- 2
SELECT COUNT(nombre) as "Cantidad de fabricantes"
FROM tienda.fabricante;
-- 3
SELECT COUNT(DISTINCT id_fabricante) AS "Fabricantes distintos"
FROM tienda.producto;
-- 4
SELECT ROUND(AVG(precio), 2) AS "Promedio de precios"
FROM tienda.producto;
-- 5,7
SELECT nombre,
	MIN(precio) AS "Producto más barato"
FROM tienda.producto;
-- 6, 8
SELECT 
	nombre,
    MAX(precio) AS "Producto más barato"
FROM tienda.producto;
-- 9
SELECT SUM(precio) AS "Suma de precios"
FROM tienda.producto;
-- 10 al 14
SELECT 
	COUNT(producto.nombre) AS "Productos Asus",
    AVG(producto.precio) AS "Valor promedio",
    MIN(producto.precio) AS "Más barato",
    MAX(producto.precio) AS "Más caro",
    SUM(producto.precio) AS "Cantidad total"
FROM 
	tienda.producto,
	tienda.fabricante
WHERE 
	fabricante.id = producto.id_fabricante
	AND fabricante.nombre LIKE "%Asus%";

-- 15
SELECT 
	COUNT(producto.nombre) AS "Productos Crucial",
    MIN(producto.precio) AS "Más barato",
    AVG(producto.precio) AS "Valor medio",
    MAX(producto.precio) AS "Más caro"
FROM 
	tienda.producto,
	tienda.fabricante
WHERE 
	fabricante.id = producto.id_fabricante
	AND fabricante.nombre LIKE "%Crucial%";
-- 16
SELECT
	fabricante.nombre,
    COUNT(producto.nombre) AS 'Cantidad de productos'
FROM 
	tienda.fabricante,
    tienda.producto
WHERE 
	fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
ORDER BY COUNT(producto.nombre);

-- 17
SELECT
	fabricante.nombre,
    MAX(producto.precio) AS 'Precio Maximo',
    MIN(producto.precio) AS 'Precio Minimo',
    ROUND(AVG(producto.precio), 2) AS 'Media'
FROM 
	tienda.fabricante,
    tienda.producto
WHERE 
	fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre;

-- 18
SELECT
	fabricante.id,
    COUNT(producto.nombre) AS 'Cantidad de productos',
    MAX(producto.precio) AS 'Precio Maximo',
    MIN(producto.precio) AS 'Precio Minimo',
    ROUND(AVG(producto.precio), 2) AS 'Media'
FROM 
	tienda.fabricante,
    tienda.producto
WHERE 
	fabricante.id = producto.id_fabricante 
    AND producto.precio > 200
GROUP BY fabricante.id;

-- 19
SELECT
    fabricante.nombre,
    COUNT(producto.nombre) AS 'Cantidad de productos',
    MAX(producto.precio) AS 'Precio Maximo',
    MIN(producto.precio) AS 'Precio Minimo',
    ROUND(AVG(producto.precio), 2) AS 'Media'
FROM 
	tienda.fabricante,
    tienda.producto
WHERE 
	fabricante.id = producto.id_fabricante 
    AND producto.precio > 200
GROUP BY fabricante.id;
-- 20
SELECT COUNT(producto.nombre) AS 'Productos caros'
FROM 
	tienda.producto,
	tienda.fabricante
WHERE 
	producto.id_fabricante = fabricante.id
    AND producto.precio >= 180;
-- 21
SELECT
	fabricante.nombre,
	COUNT(producto.nombre) AS 'Productos caros'
FROM 
	tienda.producto,
	tienda.fabricante
WHERE 
	producto.id_fabricante = fabricante.id
    AND producto.precio >= 180
GROUP BY fabricante.nombre;
-- 22 y 23
SELECT
	fabricante.id,
	fabricante.nombre,
	AVG(producto.precio) AS 'Precio medio'
FROM 
	tienda.producto,
	tienda.fabricante
WHERE 
	producto.id_fabricante = fabricante.id
GROUP BY fabricante.nombre;
-- 24
SELECT
	fabricante.id,
	fabricante.nombre,
	AVG(producto.precio) Precio
FROM 
	tienda.producto,
	tienda.fabricante
WHERE 
	producto.id_fabricante = fabricante.id
    AND Precio >= 150
GROUP BY fabricante.nombre;
-- 25
SELECT
	fabricante.nombre,
	COUNT(producto.nombre) Cantidad
FROM 
	tienda.producto,
	tienda.fabricante
WHERE 
	producto.id_fabricante = fabricante.id
GROUP BY fabricante.nombre
HAVING COUNT(producto.nombre) >= 2;
-- 26
SELECT 
	fab.nombre NombreFabricante,
    COUNT(pr.nombre) AS Productos
FROM 
	tienda.producto AS pr,
	tienda.fabricante AS fab
WHERE 
	pr.precio >= 220 AND
	pr.id_fabricante = fab.id
GROUP BY fab.nombre;
-- 27
SELECT 
	fabricante.nombre,
    COUNT(producto.nombre) AS Productos
FROM tienda.fabricante
LEFT JOIN tienda.producto 
ON producto.id_fabricante = fabricante.id
WHERE producto.precio >= 220 
GROUP BY nombre;
-- 28
SELECT 
	fabricante.nombre,
	SUM(producto.precio) Total
FROM tienda.fabricante, tienda.producto
WHERE
	producto.id_fabricante = fabricante.id
GROUP BY fabricante.nombre
HAVING SUM(producto.precio) > 1000;
-- 29
SELECT 
	producto.nombre `Nombre Producto`,
	MAX(producto.precio) AS `Producto más caro`,
    fabricante.nombre `Nombre fabricante`
FROM tienda.producto, tienda.fabricante
WHERE producto.id_fabricante = fabricante.id
GROUP BY fabricante.nombre
ORDER BY fabricante.nombre;