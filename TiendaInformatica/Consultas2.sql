-- 1
SELECT pr.nombre, 
	pr.precio,
    fab.nombre as NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE pr.id_fabricante = fab.id;
-- 2
SELECT pr.nombre, 
	pr.precio,
    fab.nombre as NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE pr.id_fabricante = fab.id
ORDER BY NombreFabricante;
-- 3
SELECT pr.id AS IDProducto,
	pr.nombre AS NombreProducto,
    fab.id AS IDFabricante,
    fab.nombre AS NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE fab.id = pr.id_fabricante;
-- 4
SELECT pr.nombre AS NombreProducto, 
	pr.precio AS PrecioProducto,
    fab.nombre as NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE pr.id_fabricante = fab.id
ORDER BY pr.precio
LIMIT 1;
-- 5
SELECT pr.nombre AS NombreProducto, 
	pr.precio AS PrecioProducto,
    fab.nombre as NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE pr.id_fabricante = fab.id
ORDER BY pr.precio DESC
LIMIT 1;
-- 6
SELECT pr.nombre AS NombreProducto, 
	pr.precio AS PrecioProducto,
    fab.nombre as NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE pr.id_fabricante = fab.id
	AND fab.nombre LIKE "%Lenovo%";
-- 7
SELECT pr.nombre AS NombreProducto, 
	pr.precio AS PrecioProducto,
    fab.nombre as NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE pr.id_fabricante = fab.id
	AND fab.nombre LIKE "%crucial%"
	AND pr.precio > 200;
-- 8 - 9
SELECT pr.nombre AS NombreProducto, 
	pr.precio AS PrecioProducto,
    fab.nombre as NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE pr.id_fabricante = fab.id
	AND fab.nombre IN("Asus", "Hewlett-Packard", "Seagate");
-- 10
SELECT pr.nombre AS NombreProducto, 
	pr.precio AS PrecioProducto,
    fab.nombre as NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE pr.id_fabricante = fab.id
	AND fab.nombre LIKE "%e";
-- 11
SELECT pr.nombre AS NombreProducto, 
	pr.precio AS PrecioProducto,
    fab.nombre as NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE pr.id_fabricante = fab.id
	AND fab.nombre LIKE "%w%";
-- 12
SELECT pr.nombre AS NombreProducto, 
	pr.precio AS PrecioProducto,
    fab.nombre as NombreFabricante
FROM tienda.producto as pr,
	tienda.fabricante as fab
WHERE pr.id_fabricante = fab.id
	AND pr.precio > 180
ORDER BY pr.precio DESC, 
	fab.nombre ASC;
-- 13
SELECT fab.id, fab.nombre
FROM tienda.fabricante as fab,
	tienda.producto as pr
WHERE pr.id_fabricante = fab.id;
