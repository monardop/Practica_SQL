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
