USE  laboratorio;

SELECT NombreCompania, Ciudad, Pais 
FROM laboratorio.clientes_neptuno
ORDER BY Pais, Ciudad
LIMIT 5 OFFSET 10;

SELECT * FROM laboratorio.clientes_neptuno
WHERE Pais LIKE '%Argentina%';

SELECT * FROM laboratorio.clientes_neptuno 
WHERE Pais NOT LIKE '%Argentina%'
ORDER BY Pais;

SELECT * FROM laboratorio.clientes_neptuno
WHERE PAIS IN('Argentina', 'Venezuela', 'Brasil')
ORDER BY Pais, Ciudad;

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

-- Madres 40 años menor al padre
SELECT * FROM laboratorio.nacimientos
WHERE EDAD_PADRE - EDAD_MADRE >= 40
ORDER BY EDAD_PADRE DESC;

SELECT * FROM laboratorio.nacimientos
WHERE SEMANAS < 20
ORDER BY SEMANAS;

SELECT * FROM laboratorio.nacimientos
WHERE SEXO LIKE '%Femenino%' AND
	NACIONALIDAD LIKE '%Extranjera%' AND
    ESTADO_CIVIL_MADRE LIKE '%Soltera%' and
    EDAD_MADRE > 40;