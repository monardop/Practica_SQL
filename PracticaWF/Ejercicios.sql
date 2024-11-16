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

/*
Realizar una comparación de salarios entre empleados (del ejercicio anterior) para analizar la 
diferencia de salario entre el empleado actual y el siguiente, así como el salario del empleado 
anterior, dentro de un mismo departamento. 
Generar una consulta que muestre, para cada empleado, su salario actual, el salario del 
empleado anterior en orden ascendente de salarios dentro del mismo departamento, y el salario 
del empleado siguiente en el mismo orden de salarios. Esta comparación permitirá visualizar 
cómo varían los salarios entre los empleados, mostrando la relación de los salarios con respecto 
al empleado anterior y posterior en términos de monto.
*/
SELECT EmpleadoID, Nombre, Departamento, Salario,
    LAG(Salario,1,0.0) OVER (
		PARTITION BY departamento
        ORDER BY Salario
    )AS SalarioAnterior,
    LEAD(Salario, 1, 0.0) OVER (
        PARTITION BY departamento
        ORDER BY Salario
    )AS SiguienteSalario
FROM tablaswf.Empleados
GO