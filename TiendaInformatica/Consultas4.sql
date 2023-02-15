-- 1.1.7.1
-- 1
SELECT Nombre
FROM tienda.producto
WHERE id_fabricante = 
	(
		SELECT id
		FROM tienda.fabricante
		WHERE nombre LIKE "%Lenovo%"
    );	
-- 2
SELECT * 
FROM tienda.producto
WHERE precio = 
	(
		SELECT MAX(precio)
        FROM tienda.producto
        WHERE id_fabricante = 
			(
				SELECT id
                FROM tienda.fabricante
                WHERE nombre LIKE "%lenovo%"
			)
		);
-- 3
SELECT 
	Nombre,
    MAX(precio) AS Precio
FROM tienda.producto
WHERE id_fabricante = 
	(
		SELECT id
        FROM tienda.fabricante
        WHERE nombre = "Lenovo"
	);
-- 4
SELECT nombre,
	MIN(precio)
FROM tienda.producto
WHERE id_fabricante = 
	( 
		SELECT id
        FROM tienda.fabricante
        WHERE nombre = "Hewlett-Packard"
	);
-- 5
SELECT *
FROM tienda.producto
WHERE precio >= 
	(
		SELECT MAX(precio)
        from tienda.producto
        where id_fabricante = 
        (
			SELECT id
			FROM tienda.fabricante
			WHERE nombre = "Lenovo"
		)
	);
-- 6
SELECT * 
from tienda.producto
where id_fabricante = 
	(
		select id
        from tienda.fabricante
        where nombre = "asus"
	)
    and precio > 
    (
		select avg(precio)
        from tienda.producto
        where id_fabricante = 
			(
				select id
                from tienda.fabricante
                where nombre = "asus"
			)
		);
