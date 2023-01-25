USE laboratorio;

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

-- Padres con mas de 10 hijos
SELECT EDAD_PADRE, NIVEL_PADRE, OCUPA_P, HIJOS_TOTAL
FROM laboratorio.nacimientos
WHERE HIJOS_TOTAL >= 10;

SELECT FECHA,
	LEFT(SEXO, 1) AS Sexo,
    LEFT(TIPO_PARTO, 1) AS Tipo
FROM laboratorio.nacimientos;
