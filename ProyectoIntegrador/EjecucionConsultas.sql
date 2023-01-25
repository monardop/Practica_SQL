USE  laboratorio;

SELECT NombreCompania, Ciudad, Pais 
FROM laboratorio.clientes_neptuno
ORDER BY Pais, Ciudad
LIMIT 5 OFFSET 10;

-- Tabla de nacimientos
-- Bebes de madres extranjeras:
SELECT * FROM laboratorio.nacimientos
WHERE nacionalidad NOT LIKE '%Chilena%';

-- Madres menores de edad (18)
SELECT * FROM laboratorio.nacimientos
WHERE EDAD_MADRE < 18
ORDER BY EDAD_MADRE;

-- Padre y madre de la misma edad
SELECT * FROM laboratorio.nacimientos
WHERE EDAD_MADRE = EDAD_PADRE;

