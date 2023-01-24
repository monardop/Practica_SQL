CREATE DATABASE BONUS_TRACK;
-- Modulo 1, desafio integrador.
USE BONUS_TRACK;
CREATE TABLE AGENDA(
IDContacto INT PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Apellido VARCHAR(15) NOT NULL,
Domicilio VARCHAR(50),
Telefono INT NOT NULL
); -- Creación de la tabla agenda.
-- Se agrega una nueva columna
ALTER TABLE AGENDA ADD Mail VARCHAR(50) NOT NULL;
-- Agrego 4 registros
INSERT INTO AGENDA VALUES
(2207, 'Sergi', 'Roberto', 'Calle falsa 123', 75491743, 'algo@gmail.com'),
(2306, 'Juan', 'Guarnizo', 'Guadalajara 33', 84925462, 'algo@live.com'),
(1298, 'Gabriel', 'Rios', 'Corrientes 32', 92830457, 'algo@yahoo.com'),
(9482, 'Emiliano', 'Insua', 'Boca 3307', 02846192, 'algo@hotmail.com'); 

-- M1, Segunda parte 

CREATE DATABASE LIBRERIA;
USE LIBRERIA;
CREATE TABLE AUTORES (
autor_id VARCHAR(11) PRIMARY KEY,
apellido VARCHAR(40),
nombre VARCHAR(20),
telefono VARCHAR(12),
