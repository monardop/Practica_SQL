CREATE TABLE Equipo
(
	Equipo VARCHAR(20),
    CONSTRAINT PK_Equipo PRIMARY KEY(Equipo)
);
INSERT INTO laboratorio.equipo VALUES
	('Argentina'),
    ('Brasil'),
    ('Paraguay'),
    ('Chile'),
    ('Uruguay'),
    ('Colombia'),
    ('Ecuador'),
    ('Peru'),
    ('Bolivia'),
    ('Venezuela');

-- Creo fixture
SELECT * FROM equipo as a
INNER JOIN equipo as b
ON a.Equipo <> b.Equipo ;