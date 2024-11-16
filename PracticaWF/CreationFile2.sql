USE master
GO
USE PracticaWF
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE
TABLE_SCHEMA = 'tablasWF' AND TABLE_NAME= 'Clientes')
BEGIN 
    CREATE TABLE tablaswf.Clientes (
        id_cliente INT IDENTITY(1,1) PRIMARY KEY,
        nombre VARCHAR(50),
        pais VARCHAR(50)
    )
END
GO


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE
TABLE_SCHEMA = 'tablasWF' AND TABLE_NAME= 'Pedidos')
BEGIN
    CREATE TABLE tablaswf.Pedidos (
        id_pedido INT PRIMARY KEY,
        id_cliente INT,
        fecha_pedido DATE,
        monto DECIMAL(10,2),
        FOREIGN KEY (id_cliente)
            REFERENCES tablaswf.Clientes(id_cliente)
    )
END 
GO

INSERT INTO tablaswf.Clientes (nombre, pais)
VALUES 
    ('John Doe', 'Argentina'), ('Jane Smith', 'Australia'), 
    ('Juan García', 'Brasil'), ('Maria Hernandez', 'Canadá'), 
    ('Michael Johnson', 'China'), ('Sophie Martin', 'Dinamarca'), 
    ('Ahmad Khan', 'Egipto'), ('Emily Brown', 'Francia'), 
    ('Hans Müller', 'Alemania'), ('Sofia Rossi', 'Italia'), 
    ('Takeshi Yamada', 'Japón'), ('Javier López', 'México'), 
    ('Eva Novak', 'Países Bajos'), ('Rafael Silva', 'Portugal'), 
    ('Olga Petrova', 'Rusia'), ('Fernanda Gonzalez', 'España'), 
    ('Mohammed Ali', 'Egipto'), ('Lena Schmidt', 'Alemania'), 
    ('Yuki Tanaka', 'Japón'), ('Lucas Costa', 'Brasil');

/*
Para insertar datos en la tabla pedidos, vamos a ver una forma de generar datos aleatorios.
El siguiente script inserta 100 registros en la tabla Pedidos, asignando aleatoriamente cada pedido 
a uno de los 20 clientes creados anteriormente en la tabla Clientes. Los montos de los pedidos se 
generarán de forma aleatoria entre 1000 y 6000, y las fechas de los pedidos estarán dentro del 
rango de tiempo definido de 2023
*/

DECLARE @startDate DATE = '2023-01-01';
DECLARE @endDate DATE = '2023-12-31'
DECLARE @orderID INT = 1;

WHILE @orderID <= 100
BEGIN   
    INSERT INTO tablaswf.Pedidos(id_pedido, id_cliente, fecha_pedido, monto)
    VALUES (
        @orderID,
        ((@orderID - 1) % 20) + 1,
        DATEADD(DAY, ABS(CHECKSUM(NEWID())) % (DATEDIFF(DAY, @startDate, @endDate) + 1), @startDate),
        ROUND(RAND(CHECKSUM(NEWID())) * 5000 + 1000, 2)
    );
    SET @orderID = @orderID + 1;
END