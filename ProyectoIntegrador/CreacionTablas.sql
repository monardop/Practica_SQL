CREATE DATABASE Laboratorio;

CREATE TABLE Laboratorio.Articulo(
	ArticuloID INT,
    Nombre VARCHAR(50),
    Precio DOUBLE,
    Stock INT,
    PRIMARY KEY(ArticuloID)
);

CREATE TABLE Laboratorio.Factura(
	Letra CHAR,
    Numero INT,
    ClienteID INT,
    ArticuloID INT,
    Fecha DATE,
    Monto DOUBLE,
    PRIMARY KEY(Letra, Numero)
);

CREATE TABLE Laboratorio.Cliente(
	ClienteID INT,
    Nombre VARCHAR(25),
    Apellido VARCHAR(25),
    CUIT CHAR(16),
    Direccion VARCHAR(50),
    Comentarios VARCHAR(50),
    PRIMARY KEY(ClienteID)
);

-- Parte 1.2 Modificaciones
USE Laboratorio;

-- En factura.
ALTER TABLE Laboratorio.Factura 
CHANGE ClienteID IDCliente INT,
CHANGE ArticuloID IDArticulo INT,
MODIFY Monto double unsigned;

-- En Articulo
ALTER TABLE Laboratorio.Articulo
CHANGE ArticuloID IDArticulo INT,
MODIFY Nombre VARCHAR(75),
MODIFY Precio DOUBLE UNSIGNED NOT NULL,
MODIFY Stock INT UNSIGNED NOT NULL;

-- En clientes
ALTER TABLE laboratorio.cliente
CHANGE ClienteID IDCliente INT,
MODIFY Nombre VARCHAR(30) NOT NULL,
MODIFY Apellido VARCHAR(35) NOT NULL,
CHANGE Comentarios Observaciones VARCHAR(255);

-- Cargar datos:
INSERT INTO laboratorio.factura VALUES
	('A', 28, 14, 335, '2021-03-18', 1589.50),
	('A', 39, 26, 157, '2021-04-12', 979.75),
    ('B', 8, 17, 95, '2021-04-25', 513.35),
    ('B', 12, 5, 411, '2021-05-03', 2385.70),
    ('B', 19, 50, 157, '2021-05-26', 979.75);
INSERT INTO laboratorio.articulo VALUES
	(95, 'Webcam con Micrófono Plug & Play', 513.35, 39),
    (157, 'Apple AirPods Pro', 979.75, 15),
    (335, 'Lavasecarropas Automático Samsung', 1589.50, 12),
    (411, 'Gloria Trevi / Gloria / CD+DVD', 2385.70, 2);
INSERT INTO laboratorio.cliente VALUES
	(5, 'Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7ºA', 'VIP'),
    (14, 'Gloria', 'Fernándedz', '23-35965852-5', 'Constitución 323', 'GBA'),
    (17, 'Gonzalo', 'López', '23-33587416-0', 'Arias 2624', 'GBA'),
    (26, 'Carlos', 'García', '23-42321230-9', 'Pasteur 322 - 2ºC', 'VIP'),
    (50, 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA');

-- Importo tabla desde descargas/Clientes_Neptuno.csv

ALTER TABLE laboratorio.clientes_neptuno
MODIFY IDCliente VARCHAR(5) PRIMARY KEY,
MODIFY NombreCompania VARCHAR(100) NOT NULL,
MODIFY Pais VARCHAR(15) NOT NULL;

ALTER TABLE Cliente RENAME Contacto;

-- Importo la tabla Clientes desde un csv ubicado en descargas/clientes.csv
ALTER TABLE laboratorio.clientes
MODIFY Cod_Cliente VARCHAR(7) PRIMARY KEY,
MODIFY Empresa VARCHAR(100) NOT NULL,
MODIFY ciudad VARCHAR(25) NOT NULL,
MODIFY telefono INT UNSIGNED,
MODIFY responsable VARCHAR(30);

-- importo el csv pedidos en descargas/pedidos.csv
ALTER TABLE laboratorio.pedidos 
MODIFY Numero_pedido INT UNSIGNED PRIMARY KEY,
MODIFY codigo_cliente VARCHAR(7) NOT NULL,
MODIFY fecha_pedido DATE,
MODIFY forma_pago ENUM('APLAZADO', 'CONTADO', 'TARJETA'),
MODIFY enviado ENUM('SI', 'NO');

