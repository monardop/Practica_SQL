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