USE  laboratorio;

-- Clientes neptuno

SELECT NombreCompania, Ciudad, Pais 
FROM laboratorio.clientes_neptuno
ORDER BY Pais, Ciudad
LIMIT 5 OFFSET 10;

-- Datos clientes argentinos
SELECT * FROM laboratorio.clientes_neptuno
WHERE Pais LIKE '%Argentina%';

-- Clientes por fuera de argentina
SELECT * FROM laboratorio.clientes_neptuno 
WHERE Pais NOT LIKE '%Argentina%'
ORDER BY Pais;

-- Clientes sudamericanos
SELECT * FROM laboratorio.clientes_neptuno
WHERE PAIS IN('Argentina', 'Venezuela', 'Brasil')
ORDER BY Pais, Ciudad;

-- ID de cliente empieza con la C
SELECT * FROM laboratorio.clientes_neptuno
WHERE IDCliente LIKE 'C%';

-- ID de cliente que comienza con B y tiene 5 chars
SELECT * FROM laboratorio.clientes_neptuno
WHERE IDCliente LIKE 'B____';


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

-- Gestacion temprana
SELECT * FROM laboratorio.nacimientos
WHERE SEMANAS BETWEEN 20 AND 25
ORDER BY SEMANAS;

-- Hijas de madres jovenes y solteras
SELECT * FROM laboratorio.nacimientos
WHERE SEXO LIKE '%Femenino%' AND
	NACIONALIDAD LIKE '%Extranjera%' AND
    ESTADO_CIVIL_MADRE LIKE '%Soltera%' and
    EDAD_MADRE > 40;

SELECT * FROM laboratorio.nacimientos
WHERE COMUNA IN(1101, 3201, 5605, 8108, 9204, 13120, 15202)
ORDER BY COMUNA;

SELECT EDAD_PADRE, NIVEL_PADRE, OCUPA_P, HIJOS_TOTAL
FROM laboratorio.nacimientos
WHERE HIJOS_TOTAL >= 10;

-- Padres con mas de 10 hijos
