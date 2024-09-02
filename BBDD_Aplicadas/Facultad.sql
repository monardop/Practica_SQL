USE master;

GO
USE pablo_monardo;
GO
GO
    CREATE  TABLE [pablo_monardo].[ddbba].[materia]
    (
        id INT IDENTITY(1,1),
        nombre CHAR(50) NOT NULL,
        CONSTRAINT PK_id_materia PRIMARY KEY(id)
    );

    CREATE  TABLE [pablo_monardo].[ddbba].[curso]
    (
        id_materia INT,
        comision INT,
        CONSTRAINT PK_curso    
            PRIMARY KEY(id_materia, comision),
        CONSTRAINT FK_Comision 
            FOREIGN KEY(id_materia) 
            REFERENCES [pablo_monardo].[ddbba].[materia](id)
    );

    CREATE  TABLE [pablo_monardo].[ddbba].[Tipo_Vehiculo]
    (
        id INT IDENTITY(1,1),
        nombre CHAR(20),
        CONSTRAINT PK_id_tipo_vehiculo PRIMARY KEY(id)
    );

    CREATE  TABLE [pablo_monardo].[ddbba].[Vehiculo]
    (
        id INT IDENTITY(1,1),
        patente CHAR(7) NOT NULL,
        tipo_vehiculo INT,
        CONSTRAINT PK_id_vehiculo PRIMARY KEY(id),
        CONSTRAINT FK_tipo_de_vehiculo
            FOREIGN KEY(tipo_vehiculo)
            REFERENCES [pablo_monardo].[ddbba].[Tipo_Vehiculo](id)
    );

    CREATE  TABLE [pablo_monardo].[ddbba].[Nombre]
    (
        id INT IDENTITY(1,1) PRIMARY KEY,
        nombre CHAR(30)
    );

    CREATE  TABLE [pablo_monardo].[ddbba].[Apellido]
    (
        id INT IDENTITY(1,1) PRIMARY KEY,
        nombre CHAR(30)
    );
    CREATE  TABLE [pablo_monardo].[ddbba].[Localidad]
    (
        id INT IDENTITY(1,1) PRIMARY KEY,
        nombre CHAR(30)
    );

    CREATE  TABLE [pablo_monardo].[ddbba].[Persona_Nombre]
    (
        id_nombre INT,
        id_persona INT,
        CONSTRAINT PK_Nombre_persona PRIMARY KEY(id_nombre, id_persona),
        CONSTRAINT FK_nombre FOREIGN KEY(id_nombre)
            REFERENCES [pablo_monardo].[ddbba].[Nombre](id),
        CONSTRAINT FK_Persona_Nombre FOREIGN KEY(id_persona)
            REFERENCES [pablo_monardo].[ddbba].[Persona](id)
    );

    CREATE  TABLE [pablo_monardo].[ddbba].[Persona]
    (
        id INT IDENTITY(1,1),
        DNI BIGINT NOT NULL,
        telefono CHAR(10),
        nacimiento DATE,
        id_localidad INT,
        id_apellido INT,
        id_patente INT,

        CONSTRAINT PK_id_persona PRIMARY KEY(id),
        CONSTRAINT FK_Apellido FOREIGN KEY(id_apellido)
            REFERENCES [pablo_monardo].[ddbba].[Apellido](id),
        CONSTRAINT FK_Vehiculo FOREIGN KEY(id_patente)
            REFERENCES [pablo_monardo].[ddbba].[Vehiculo](id),
        CONSTRAINT FK_localidad FOREIGN KEY(id_localidad)
            REFERENCES [pablo_monardo].[ddbba].[Localidad](id),
    );

    CREATE  TABLE [pablo_monardo].[ddbba].[Rol]
    (
        id INT IDENTITY(1,1) PRIMARY KEY,
        nombre CHAR(30)
    );

    CREATE  TABLE [pablo_monardo].[ddbba].[Persona_curso]
    (
        id_materia INT,
        id_comision INT,
        id_persona INT,
        id_rol INT,

        CONSTRAINT PK_curso_persona PRIMARY KEY(id_materia, id_comision, id_persona),

        CONSTRAINT FK_Curso FOREIGN KEY(id_materia, id_comision)
            REFERENCES [pablo_monardo].[ddbba].[curso](id_materia, comision),
        CONSTRAINT FK_Persona_materia FOREIGN KEY(id_persona)
            REFERENCES [pablo_monardo].[ddbba].[Persona](id),
        CONSTRAINT FK_Persona_Rol FOREIGN KEY(id_rol)
            REFERENCES [pablo_monardo].[ddbba].[Rol](id)
    );
GO
