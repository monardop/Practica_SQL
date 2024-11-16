USE master
GO

USE PracticaWF
GO
-- Ejercicio 1: ordenar en torno al mejor salario
SELECT EmpleadoID, Nombre, Departamento, Salario,
    RANK() OVER (ORDER BY Salario DESC) AS OrdenEmpleadosSalario
FROM tablaswf.Empleados
GO


-- Ejercicio 2: ordenar en torno al mejor salario por depto
SELECT EmpleadoID, Nombre, Departamento, Salario,
    RANK() OVER (
        PARTITION BY Departamento 
        ORDER BY Salario DESC
    ) AS Ranking
FROM tablaswf.Empleados
GO

-- Ejercicio 3: dividir a los empleados en 4 grupos basados en los salarios.
SELECT EmpleadoID, Nombre, Departamento, Salario,
    NTILE(4) OVER (
        ORDER BY Salario DESC
    ) AS GrupoSalario
FROM tablaswf.Empleados
GO