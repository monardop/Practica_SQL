USE master;

GO
CREATE DATABASE pablo_monardo;

GO 
USE pablo_monardo;

go
	CREATE SCHEMA ddbba;

GO
	CREATE TABLE ddbba.registro(
		id INT IDENTITY PRIMARY KEY,
		fecha_hora DATETIME NOT NULL DEFAULT(CURRENT_TIMESTAMP),
		texto VARCHAR(50),
		modulo CHAR(10)
	);

GO
	CREATE OR ALTER PROCEDURE ddbba.insertarLog
		@modulo CHAR(10),
		@texto VARCHAR(50)
	AS
	BEGIN
		IF @modulo = '' 
		BEGIN
			SET @modulo = 'N/A';
		END

		INSERT INTO ddbba.registro(modulo, texto)
		VALUES(@modulo, @texto);
	END
GO

CREATE OR ALTER TRIGGER ddbba.trg_insert_registros
ON ddbba.registro
AFTER INSERT
AS
BEGIN
	DECLARE @modulo CHAR(10), @texto VARCHAR(50);

	SELECT @modulo = inserted.modulo, @texto = 'Registro insertado'
	FROM inserted;

	EXEC insertarLog @modulo, @texto;
END
GO