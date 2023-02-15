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
