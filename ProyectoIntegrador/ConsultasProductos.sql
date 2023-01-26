USE laboratorio;

SELECT
	NombreCategoria, 
    MAX(PrecioUnidad) AS 'Precio Máximo'
FROM laboratorio.productos_neptuno
GROUP BY NombreCategoria;

SELECT 
	Seccion,
	COUNT(Cod_producto) as Cantidad
FROM laboratorio.productos
GROUP BY Seccion
ORDER BY Cantidad;

-- Precios mas caros que la media
SELECT * FROM laboratorio.productos_neptuno
WHERE PrecioUnidad > (SELECT AVG(PrecioUnidad) FROM laboratorio.productos_neptuno)
ORDER BY NombreProducto;

-- Precios mas caros que productos suspendidos
SELECT * FROM productos_neptuno
WHERE PrecioUnidad > (SELECT MAX(PrecioUnidad) FROM ProductoSuspendido);