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
-- 1.1.7.2
-- 8
select * 
from tienda.producto
where precio >= All 
	(
		select precio 	
        from tienda.producto
);
-- 9
SELECT * 
from tienda.producto
where precio <= ALL
	(
		select precio
        from tienda.producto
);
-- 10
select nombre
from tienda.fabricante
where id = ANY (
		select id_fabricante
        from tienda.producto
);
-- 11
select nombre
from tienda.fabricante
where id <> ALL (
	select id_fabricante
    from tienda.producto
);

-- 1.1.7.3
-- 12
select nombre
from tienda.fabricante
where id  IN(
	select id_fabricante
    from tienda.producto
);
-- 13
select nombre
from tienda.fabricante
where id  NOT IN(
	select id_fabricante
    from tienda.producto
)