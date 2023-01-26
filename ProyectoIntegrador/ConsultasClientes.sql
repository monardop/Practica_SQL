USE  laboratorio;

-- Clientes neptuno

SELECT NombreCompania, Ciudad, Pais 
FROM laboratorio.clientes_neptuno
ORDER BY Pais, Ciudad
LIMIT 5 OFFSET 10;

-- Datos clientes argentinos
SELECT * FROM laboratorio.clientes_neptuno
WHERE Pais LIKE '%Argentina%';

-- Clientes por fuera de argentina
SELECT * FROM laboratorio.clientes_neptuno 
WHERE Pais NOT LIKE '%Argentina%'
ORDER BY Pais;

-- Clientes sudamericanos
SELECT * FROM laboratorio.clientes_neptuno
WHERE PAIS IN('Argentina', 'Venezuela', 'Brasil')
ORDER BY Pais, Ciudad;

-- ID de cliente empieza con la C
SELECT * FROM laboratorio.clientes_neptuno
WHERE IDCliente LIKE 'C%';

-- ID de cliente que comienza con B y tiene 5 chars
SELECT * FROM laboratorio.clientes_neptuno
WHERE IDCliente LIKE 'B____';

SELECT LOWER(IDCliente) AS Codigo, 
	UPPER(NombreCompania) AS Empresa,
	CONCAT_WS(' - ',Direccion, ciudad, pais) AS Ubicacion
FROM laboratorio.clientes_neptuno;

SELECT *, 
	UPPER(CONCAT(LEFT(ciudad,1), LEFT(pais,1), RIGHT(pais, 2))) AS CODIGO
FROM laboratorio.clientes_neptuno;

-- Clientes que gastaron mas de 500 dls
SELECT cn.NombreCompania, 
	cn.ciudad, cn.pais, 
    CONCAT('DLS $', pn.Cargo) AS Gasto
FROM clientes_neptuno as cn
INNER JOIN pedidos_neptuno as pn
ON cn.NombreCompania = pn.NombreCompania
WHERE pn.Cargo > 500;

-- Clientes por continente
SELECT cn.IDCliente, cn.NombreCompania, 
	cn.Ciudad, cn.Pais,
    CASE WHEN cn.Pais IN('Mexico', 'USA', 'Canada') THEN 'América del Norte'
	WHEN cn.Pais IN('Argentina', 'Brasil', 'Venezuela') THEN 'America del Sur'
    ELSE 'Europa'
	END AS Continente
FROM laboratorio.clientes_neptuno as cn
ORDER BY Continente, cn.Pais;

-- Evaluación de clientes
SELECT pn.IdPedido, pn.NombreCompania, 
	pn.FechaPedido, pn.Cargo,
    CASE
		WHEN pn.Cargo > 700 THEN 'EXCELENTE'
        WHEN pn.Cargo BETWEEN 500 AND 700 THEN 'MUY BUENO'
        WHEN pn.Cargo BETWEEN 250 AND 500 THEN 'BUENO'
        WHEN pn.Cargo BETWEEN 50 AND 250 THEN 'REGULAR'
        ELSE 'MALO'
	END AS Evaluación
FROM laboratorio.pedidos_neptuno as pn;
    
