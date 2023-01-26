USE laboratorio;
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE laboratorio.empleados
ADD COLUMN NombreEmpleado VARCHAR(30) AFTER IDEmpleado;

UPDATE laboratorio.empleados
SET NombreEmpleado = CONCAT(Apellidos, ', ', Nombre);

ALTER TABLE laboratorio.empleados
DROP Apellidos,
DROP Nombre;

UPDATE laboratorio.clientes_neptuno
SET Pais = 'USA' WHERE Pais = 'Estados Unidos';

UPDATE laboratorio.clientes_neptuno
SET NombreCompania = UPPER(NombreCompania);

UPDATE laboratorio.clientes_neptuno
SET 
	Ciudad = UPPER(ciudad),
    Pais = UPPER(Pais);

ALTER TABLE laboratorio.clientes
ADD COLUMN Tipo VARCHAR(3);

UPDATE laboratorio.clientes
SET Tipo = 'VIP' 
WHERE ciudad LIKE '%Madrid%';
SELECT * FROM clientes;

ALTER TABLE laboratorio.clientes
MODIFY telefono VARCHAR(20);

UPDATE laboratorio.clientes
SET telefono = CONCAT('+34-', telefono)
WHERE telefono IS NOT NULL;

ALTER TABLE laboratorio.productos 
ADD COLUMN fecha DATE;

UPDATE laboratorio.productos
SET fecha = CONCAT_WS('-', ano, mes, dia);
UPDATE laboratorio.productos
SET origen = 'ESPAÑA' WHERE origen LIKE '%espana%';

ALTER TABLE laboratorio.productos
DROP dia, 
DROP mes,
DROP ano;

select * from productos;

