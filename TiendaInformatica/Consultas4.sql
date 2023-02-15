-- 1.1.7.1
-- 1
SELECT 
    Nombre
FROM
    tienda.producto
WHERE
    id_fabricante = (SELECT 
            id
        FROM
            tienda.fabricante
        WHERE
            nombre LIKE '%Lenovo%');	
-- 2
SELECT 
    *
FROM
    tienda.producto
WHERE
    precio = (SELECT 
            MAX(precio)
        FROM
            tienda.producto
        WHERE
            id_fabricante = (SELECT 
                    id
                FROM
                    tienda.fabricante
                WHERE
                    nombre LIKE '%lenovo%'));
-- 3
SELECT 
    Nombre, MAX(precio) AS Precio
FROM
    tienda.producto
WHERE
    id_fabricante = (SELECT 
            id
        FROM
            tienda.fabricante
        WHERE
            nombre = 'Lenovo');
-- 4
SELECT 
    nombre, MIN(precio)
FROM
    tienda.producto
WHERE
    id_fabricante = (SELECT 
            id
        FROM
            tienda.fabricante
        WHERE
            nombre = 'Hewlett-Packard');
-- 5
SELECT 
    *
FROM
    tienda.producto
WHERE
    precio >= (SELECT 
            MAX(precio)
        FROM
            tienda.producto
        WHERE
            id_fabricante = (SELECT 
                    id
                FROM
                    tienda.fabricante
                WHERE
                    nombre = 'Lenovo'));
-- 6
SELECT 
    *
FROM
    tienda.producto
WHERE
    id_fabricante = (SELECT 
            id
        FROM
            tienda.fabricante
        WHERE
            nombre = 'asus')
        AND precio > (SELECT 
            AVG(precio)
        FROM
            tienda.producto
        WHERE
            id_fabricante = (SELECT 
                    id
                FROM
                    tienda.fabricante
                WHERE
                    nombre = 'asus'));
-- 1.1.7.2
-- 8
SELECT 
    *
FROM
    tienda.producto
WHERE
    precio >= ALL (SELECT 
            precio
        FROM
            tienda.producto);
-- 9
SELECT 
    *
FROM
    tienda.producto
WHERE
    precio <= ALL (SELECT 
            precio
        FROM
            tienda.producto);
-- 10
SELECT 
    nombre
FROM
    tienda.fabricante
WHERE
    id = ANY (SELECT 
            id_fabricante
        FROM
            tienda.producto);
-- 11
SELECT 
    nombre
FROM
    tienda.fabricante
WHERE
    id <> ALL (SELECT 
            id_fabricante
        FROM
            tienda.producto);

-- 1.1.7.3
-- 12
SELECT 
    nombre
FROM
    tienda.fabricante
WHERE
    id IN (SELECT 
            id_fabricante
        FROM
            tienda.producto);
-- 13
SELECT 
    nombre
FROM
    tienda.fabricante
WHERE
    id NOT IN (SELECT 
            id_fabricante
        FROM
            tienda.producto);

-- 1.1.7.4
-- 14
SELECT 
    nombre
FROM
    tienda.fabricante as f
WHERE
    EXISTS( SELECT 
           id_fabricante
        FROM
            tienda.producto AS pr
        WHERE
            f.id = pr.id_fabricante);
-- 15
SELECT 
    nombre
FROM
    tienda.fabricante as f
WHERE
    NOT EXISTS( SELECT 
           id_fabricante
        FROM
            tienda.producto AS pr
        WHERE
            f.id = pr.id_fabricante);


