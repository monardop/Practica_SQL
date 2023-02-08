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