

/*
--------------------------------------------------------------------
Proyecto #1 - CoTEC-2020
--------------------------------------------------------------------
Instituto Técnológico de Costa Rica
Área Académica de Ingeniería en Computadores
Bases de Datos (CE3101) 
I Semestre 2020
Prof. Luis Diego Noguera Mena
Cristhofer Azofeifa, Fiorella Delgado, Karla Rivera & Rubén Salas
--------------------------------------------------------------------
CoTEC-2020 - Stored Procedures
--------------------------------------------------------------------
*/


USE [CoTEC-2020];
GO


/*
Proceso para actualizar datos de CentroHospitalario
*/
CREATE PROCEDURE modifyCentroHospitalario(
	-- Atributos de CentroHospitalario
	@idCentroHospitalario INT,
	@nombre VARCHAR(200),
	@capacidad INT,
	@capacidadUci INT, 
	@contacto VARCHAR(50),
	@director VARCHAR(30),
	@idUbicacion INT,
	-- Atributos de Ubicacion
	@continente VARCHAR(75),
	@pais VARCHAR(75),
	@region VARCHAR(75),
	-- Atributo para tipo de declaracion
	@statementType VARCHAR(20) ) 
AS
BEGIN

	IF @statementType = 'Insert'
		BEGIN
			--Genera una nueva ubicacion solo si no esta ya antes creada
			IF ((dbo.getIdUbicacion(@continente, @pais, @region) != @idUbicacion) AND ((dbo.getIdUbicacion(@continente, @pais, @region) = 0)) )
			BEGIN
				INSERT INTO Ubicacion (
					continente, 
					pais,
					region )
				VALUES (
					 @continente,
					 @pais,
					 @region )
			END

			INSERT INTO CentroHospitalario (
				nombre,
				capacidad,
				capacidadUci,
				contacto,
				director,
				idUbicacion )
			VALUES (
				@nombre,
				@capacidad, 
				@capacidadUci,
				@contacto,
				@director,
				dbo.getIdUbicacion(@continente, @pais, @region) )
		END

	ELSE IF @statementType = 'Update'
		BEGIN
			--Genera una nueva ubicacion solo si no esta ya antes creada
			IF ((dbo.getIdUbicacion(@continente, @pais, @region) != @idUbicacion) AND ((dbo.getIdUbicacion(@continente, @pais, @region) = 0)) )
			BEGIN
				INSERT INTO Ubicacion (
					continente, 
					pais,
					region )
				VALUES (
					 @continente,
					 @pais,
					 @region )
			END

			UPDATE CentroHospitalario  
			SET nombre = @nombre,  
				capacidad = @capacidad,  
				capacidadUci = @capacidadUci,
				contacto = @contacto,
				director = @director,
				idUbicacion = dbo.getIdUbicacion(@continente, @pais, @region)
			--Verifica que este actualizando el idCentroHospitalario que es
			WHERE idCentroHospitalario = @idCentroHospitalario 
				AND @capacidadUci <= @capacidad --Verifica que las capacidades coincidan
				IF (@capacidadUci > @capacidad)
						THROW 50001, 'No se permite que la capacidad UCI sea mayor a la capacidad general',1;
		END

	ELSE IF @statementType = 'Delete'
		BEGIN
		--Actualiza el idCentroHospitalario que se borra del Paciente y le asigna uno random
		UPDATE Paciente  
			SET idCentroHospitalario = (SELECT TOP 1 idCentroHospitalario From CentroHospitalario ORDER BY NEWID())
			--Verifica que este actualizando el idCentroHospitalario que es
			WHERE idCentroHospitalario = (SELECT idCentroHospitalario FROM CentroHospitalario WHERE idCentroHospitalario = @idCentroHospitalario)
		--Elimina el centroHospitalario
		DELETE FROM CentroHospitalario WHERE idCentroHospitalario = @idCentroHospitalario
		END

	ELSE
		BEGIN
		PRINT 'Error en modifyCentroHospitalario'
		END

END
GO

/*
EXEC modifyCentroHospitalario
@idCentroHospitalario = 202,  
@nombre = 'Vicente de Paul',
@capacidad = 176,
@capacidadUci = 175, 
@contacto = '(506) 123456',
@director = '100397538',
@idUbicacion = 1,
@continente = 'America',
@pais = 'Costa Rica',
@region = 'Heredia',
@statementType = 'Insert'; 
*/




/*
Proceso para actualizar datos de Paciente
*/
/*
CREATE PROCEDURE UpdatePaciente(
	-- Atributos de Persona
	@cedula VARCHAR(30),
	@nombre	VARCHAR(75),
	@primerApellido	VARCHAR(75),
	@segundoApellido VARCHAR(75),
	@nacionalidad VARCHAR(50),
	@fechaNacimiento date,
	-- Atributos de Ubicacion
	@continente VARCHAR(75),
	@pais VARCHAR(75),
	@region VARCHAR(75),
	--Atributos de Paciente
	@internado VARCHAR(10),
	@uci VARCHAR(10),
	@fechaIngreso DATE,
	@idEstadoPaciente INT, --estado como?
	@idCentroHospitalario INT,
	@cedula	VARCHAR(30) )
AS
BEGIN
	UPDATE Ubicacion
	SET	continente = @continente
		pais = @pais
		region = @region

	UPDATE Persona  
	SET cedula = @cedula,
		nombre = @nombre,
		primerApellido = @primerApellido
		segundoApellido = @segundoApellido
		nacionalidad = @nacionalidad
		fechaNacimiento = @fechaNacimiento
		--idUbicacion = getUbicacionPorContinente,RegionyPais()

	UPDATE Paciente
	SET internado = @internado,
		uci = @uci,
		fechaIngreso = @fechaIngreso,
		idEstadoPaciente = @idEstadoPaciente,
		idCentroHospitalario = @idCentroHospitalario,
		cedula = @cedula

END;
GO
*/



/*
Proceso para actualizar datos de Contacto
*/
/*
CREATE PROCEDURE UpdateContacto(
	-- Atributos de Persona
	@cedula varchar(30),
	@nombre	varchar(75),
	@primerApellido	varchar(75),
	@segundoApellido varchar(75),
	@nacionalidad varchar(50),
	@fechaNacimiento DATE,
	-- Atributos de Ubicacion
	@continente varchar(75),
	@pais varchar(75),
	@region varchar(75),
	-- Atributos de Contacto
	@correo	varchar(100),
	@idPaciente INT )
AS
BEGIN 
	UPDATE Ubicacion
	SET	continente = @continente
		pais = @pais
		region = @region

	UPDATE Persona  
	SET cedula = @cedula,
		nombre = @nombre,
		primerApellido = @primerApellido
		segundoApellido = @segundoApellido
		nacionalidad = @nacionalidad
		fechaNacimiento = @fechaNacimiento
		--idUbicacion = getUbicacionPorContinente,RegionyPais()

	UPDATE Contacto
	SET correo = @correo,
		idPaciente = @idPaciente,
		cedula = @cedula

END
*/







/******* BASE STORED PROCEDURE *******/
/*
Proceso para actualizar datos de BaseTable
*/
/*
CREATE PROCEDURE UpdateBaseTable(
	-- Atributos
	--@
	-- Atributo para tipo de declaracion
	@statementType VARCHAR(20) ) 
AS
BEGIN

	IF @statementType = 'Insert'
		BEGIN
		PRINT 'Insert'
		END

	IF @statementType = 'Update'
		BEGIN
		PRINT 'Update'
		END

	IF @statementType = 'Delete'
		BEGIN
		PRINT 'Delete'
		END

	IF @statementType = 'Select'
		BEGIN
		PRINT 'Select'
		END

	ELSE
		BEGIN
		PRINT 'Else'
		END

END
GO
*/

