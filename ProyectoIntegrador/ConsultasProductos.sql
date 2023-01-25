USE laboratorio;

SELECT
	NombreCategoria, 
    MAX(PrecioUnidad) AS 'Precio Máximo'
FROM laboratorio.productos_neptuno
GROUP BY NombreCategoria;