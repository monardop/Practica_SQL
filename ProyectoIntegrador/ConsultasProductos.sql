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

SELECT * FROM productos_neptuno
WHERE LEFT(NombreProducto, 1) = (
	SELECT LEFT(NombreEmpleado, 1) 
    FROM empleados 
	WHERE IDEmpleado = 8)
ORDER BY NombreProducto;

SELECT NombreProducto FROM productos_neptuno
WHERE IdProveedor = (
	SELECT MAX(IDproveedor) 
    FROM productos_neptuno)
ORDER BY NombreProducto;

SELECT * FROM productos_neptuno 
WHERE NombreCategoria = 'BEBIDAS'
	AND PrecioUnidad > (
		SELECT MAX(PrecioUnidad) 
        FROM productos_neptuno
        WHERE NombreCategoria = 'CONDIMENTOS');

-- Categorizacion de productos
SELECT IdProducto, NombreProducto, 
	NombreCategoria, PrecioUnidad,
    CASE
		WHEN PrecioUnidad > 100 THEN 'DELUXE'
        WHEN PrecioUnidad BETWEEN 10 AND 100 THEN 'REGULAR'
        ELSE 'ECONOMICO'
	END AS Tipo
FROM laboratorio.productos_neptuno
ORDER BY PrecioUnidad;

-- Productos mayores a 80 dls
SELECT * FROM productos_neptuno WHERE PrecioUnidad > 80
UNION
SELECT * FROM ProductoSuspendido WHERE PrecioUnidad > 80
ORDER BY NombreProducto;

-- Ventas segun Empleado
SELECT IDProducto, NombreProducto, NombreEmpleado
FROM productos_neptuno as pn, empleados as emp
WHERE pn.IDProducto = emp.IDEmpleado;

-- Productos segun proveedor
SELECT pr.NombreContacto, pn.IdProducto,
	pn.NombreProducto, pn.PrecioUnidad
FROM laboratorio.proveedores AS pr, 
	laboratorio.productos_neptuno AS pn
WHERE pr.IdProveedor = pn.IdProveedor
ORDER BY pr.NombreContacto, pn.NombreProducto;
