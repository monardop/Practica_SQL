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