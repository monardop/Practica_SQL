USE master
GO

IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'PracticaWF')
BEGIN
    CREATE DATABASE PracticaWF
    COLLATE Latin1_General_CI_AI
END
GO

USE PracticaWF
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name="tablasWF")
BEGIN 
    EXEC('CREATE SCHEMA tablasWF')
END 
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE
TABLE_SCHEMA = 'tablasWF' AND TABLE_NAME = 'Empleados')
BEGIN
    CREATE TABLE tablasWF.Empleados (
        EmpleadoID      INT     IDENTITY(1,1)   PRIMARY KEY,
        Nombre          VARCHAR(50),
        Departamento    VARCHAR(50),
        Salario         DECIMAL(10,2)
    )
END
GO

INSERT INTO tablaswf.Empleados (Nombre, Departamento, Salario)
VALUES
    ('Juan', 'Ventas', 3000.00),
    ('María', 'Ventas', 2800.00),
    ('Pedro', 'Marketing', 3200.00),
    ('Laura', 'Marketing', 3500.00),
    ('Carlos', 'IT', 4000.00);