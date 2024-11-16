USE master
GO

USE PracticaWF
GO

SELECT EmpleadoID, Nombre, Departamento, Salario,
    RANK() OVER (ORDER BY Salario) AS OrdenEmpleadosSalario
FROM tablaswf.Empleados
GO