USE laboratorio;

-- Pedidos del 98'
SELECT * FROM laboratorio.pedidos_neptuno 
WHERE YEAR(FechaPedido) = 1998;

-- Pedidos entre agosto y septiempre del 97
SELECT * FROM laboratorio.pedidos_neptuno 
WHERE FechaPedido BETWEEN '1997-8-1' AND '1997-9-30';

-- Pedidos del dia 1 de cada mes
SELECT * FROM laboratorio.pedidos_neptuno 
WHERE DAY(FechaPedido) = 1;

-- Info detallada de los pedidos
SELECT *,
	TIMESTAMPDIFF(DAY, FechaPedido, CURDATE()) AS 'Días Transcurridos',
    DAYNAME(FechaPedido) AS 'Día',
    DAYOFYEAR(FechaPedido) AS 'Día del año',
    MONTHNAME(FechaPedido) AS 'Mes',
    ADDDATE(FechaPedido, INTERVAL 30 DAY) AS 'Primer vencimiento',
    ADDDATE(FechaPedido, INTERVAL 2 MONTH) AS 'Segundo vencimiento'
FROM laboratorio.pedidos_neptuno;

-- Precios con IVA
SELECT *,
	ROUND(Cargo * 0.21, 2) AS IVA,
    ROUND(Cargo * 1.21, 2) AS Neto,
    FLOOR(Cargo * 1.21) AS 'Redondeeo a favor del cliente',
    CEIL(Cargo * 1.21) AS 'Redondeo a favor de la empresa'
FROM laboratorio.pedidos_neptuno;

SELECT COUNT(FechaPedido) as 'Cantidad de pedidos' 
FROM laboratorio.pedidos_neptuno;

SELECT COUNT(Transportista) AS 'Entregas SPEEDY EXPRESS'
FROM laboratorio.pedidos_neptuno
WHERE Transportista LIKE '%SPEEDY EXPRESS%';

SELECT COUNT(Empleado) AS Ventas
FROM laboratorio.pedidos_neptuno
WHERE LEFT(Empleado, 1) LIKE '%C%';

SELECT 
	ROUND(AVG(Cargo), 2) AS 'Precio promedio',
	MIN(Cargo) AS 'Precio inferior',
    MAX(Cargo) AS 'Precio máximo'
FROM laboratorio.pedidos_neptuno;

-- Entregas por cada transportista
SELECT 
	COUNT(IdPedido) AS Entregas,
    Transportista
FROM laboratorio.pedidos_neptuno
GROUP BY Transportista;

-- Gasto por compania
SELECT 
	NombreCompania AS Cliente,
	ROUND(SUM(Cargo), 2) AS Gasto
FROM laboratorio.pedidos_neptuno
GROUP BY NombreCompania;

