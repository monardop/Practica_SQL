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
