USE laboratorio;

-- Pedidos del 98'
SELECT * FROM laboratorio.pedidos_neptuno 
WHERE YEAR(FechaPedido) = 1998;

-- Pedidos entre agosto y septiempre del 97
SELECT * FROM laboratorio.pedidos_neptuno 
WHERE FechaPedido BETWEEN '1997-8-1' AND '1997-9-30';