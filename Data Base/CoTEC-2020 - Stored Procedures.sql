

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
Proceso para modificar datos de CentroHospitalario
*/
CREATE PROCEDURE modifyCentroHospitalario(
	-- Atributos de CentroHospitalario
	@idCentroHospitalario INT,
	@nombre VARCHAR(200),
	@capacidad INT,
	@capacidadUci INT, 
	@contacto VARCHAR(50),
	@director VARCHAR(30),
	--@idUbicacion INT,
	-- Atributos de Ubicacion
	--@continente VARCHAR(75),
	@pais VARCHAR(75),
	@region VARCHAR(75),
	-- Atributo para tipo de declaracion
	@statementType VARCHAR(20) ) 
AS
BEGIN

	IF @statementType = 'Insert'
		BEGIN
			----Genera una nueva ubicacion solo si no esta ya antes creada
			--IF ((dbo.getIdUbicacion(@continente, @pais, @region) != @idUbicacion) AND ((dbo.getIdUbicacion(@continente, @pais, @region) = 0)) )
			--BEGIN
			--	INSERT INTO Ubicacion (
			--		continente, 
			--		pais,
			--		region )
			--	VALUES (
			--		 @continente,
			--		 @pais,
			--		 @region )
			--END

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
				dbo.getIdUbicacionFromRegionPais(@region, @pais) )
		END

	ELSE IF @statementType = 'Update'
		BEGIN
			----Genera una nueva ubicacion solo si no esta ya antes creada
			--IF ((dbo.getIdUbicacion(@continente, @pais, @region) != @idUbicacion) AND ((dbo.getIdUbicacion(@continente, @pais, @region) = 0)) )
			--BEGIN
			--	INSERT INTO Ubicacion (
			--		continente, 
			--		pais,
			--		region )
			--	VALUES (
			--		 @continente,
			--		 @pais,
			--		 @region )
			--END

			UPDATE CentroHospitalario  
			SET nombre = @nombre,  
				capacidad = @capacidad,  
				capacidadUci = @capacidadUci,
				contacto = @contacto,
				director = @director,
				idUbicacion = dbo.getIdUbicacionFromRegionPais(@region, @pais)
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

--Para ejecutar modifyCentroHospitalario:

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
Proceso para modificar datos de Paciente
*/
CREATE PROCEDURE modifyPaciente(
	-- Atributos de Persona
	@cedula VARCHAR(30),
	@nombre	VARCHAR(75),
	@primerApellido	VARCHAR(75),
	@segundoApellido VARCHAR(75),
	@nacionalidad VARCHAR(50),
	@fechaNacimiento DATE,
	--@idUbicacion INT,
	-- Atributos de Ubicacion
	--@continente VARCHAR(75),
	--@pais VARCHAR(75),
	@region VARCHAR(75),
	--Atributos de Paciente
	@idPaciente INT,
	@internado VARCHAR(10),
	@uci VARCHAR(10),
	@fechaIngreso DATE,
	@idEstadoPaciente INT, --estado como?
	@idCentroHospitalario INT,
	-- Atributo para tipo de declaracion
	@statementType VARCHAR(20) )
AS
BEGIN
	
	IF @statementType = 'Insert'
		BEGIN
			----Genera una nueva ubicacion solo si no esta ya antes creada
			--IF ((dbo.getIdUbicacion(@continente, @pais, @region) != @idUbicacion) AND ((dbo.getIdUbicacion(@continente, @pais, @region) = 0)) )
			--	BEGIN
			--		INSERT INTO Ubicacion (
			--			continente, 
			--			pais,
			--			region )
			--		VALUES (
			--			 @continente,
			--			 @pais,
			--			 @region )
			--	END

			-- Genera una Persona solo si no esta ya antes creada
			IF NOT (@cedula IN (SELECT cedula FROM Persona WHERE cedula = @cedula) )
				BEGIN
					INSERT INTO Persona(
						cedula,
						nombre,
						primerApellido,
						segundoApellido,
						nacionalidad,
						fechaNacimiento,
						idUbicacion )
					VALUES (
						@cedula,
						@nombre,
						@primerApellido, 
						@segundoApellido,
						@nacionalidad,
						@fechaNacimiento,
						dbo.getIdUbicacionFromRegion(@region) )
				END

			-- Genera un Paciente solo si no esta ya antes creado
			IF NOT (@cedula IN (SELECT cedula FROM Paciente WHERE cedula = @cedula) )
				BEGIN
					INSERT INTO Paciente (
						internado,
						uci,
						fechaIngreso,
						idEstadoPaciente,
						idCentroHospitalario,
						cedula )
					VALUES (
						@internado,
						@uci, 
						@fechaIngreso,
						@idEstadoPaciente,
						@idCentroHospitalario,
						@cedula )
				END
		END

	ELSE IF @statementType = 'Update'
		BEGIN
			--Actualiza los datos de Persona
			UPDATE Persona  
			SET cedula = @cedula,
				nombre = @nombre,
				primerApellido = @primerApellido,
				segundoApellido = @segundoApellido,
				nacionalidad = @nacionalidad,
				fechaNacimiento = @fechaNacimiento,
				idUbicacion = dbo.getIdUbicacionFromRegion(@region)
			WHERE cedula = @cedula
				--Verifica que la persona exista
				IF NOT (@cedula IN (SELECT cedula FROM Persona))
						THROW 50001, 'No hay ninguna persona con esta cedula.',1;

			--Actualiza los datos de Paciente
			UPDATE Paciente
			SET internado = @internado,
				uci = @uci,
				fechaIngreso = @fechaIngreso,
				idEstadoPaciente = @idEstadoPaciente,
				idCentroHospitalario = @idCentroHospitalario,
				cedula = @cedula
			WHERE cedula = @cedula
			--Verifica que el paciente exista
				IF NOT (@cedula IN (SELECT cedula FROM Paciente))
						THROW 50001, 'No hay ningun paciente con esta cedula.',1;
		END

	ELSE IF @statementType = 'Delete'
		BEGIN
			--Verifica que el idPaciente ingresado exista
			IF NOT (@idPaciente IN (SELECT idPaciente FROM Paciente))
						THROW 50001, 'No existe ningun paciente por borrar con este idPaciente.',1;
			--Borra la asignacion de PacienteMedicamento asignado a este Paciente
			DELETE FROM PacienteMedicamento WHERE idPaciente = @idPaciente
			--Borra sus Contactos asignados
			DELETE FROM Contacto WHERE idPaciente = @idPaciente
			--Borra el Paciente
			DELETE FROM Paciente WHERE idPaciente = @idPaciente
		END

	ELSE
		BEGIN
		PRINT 'Error en modifyPaciente'
		END
END;
GO
/*

--Para ejecutar modifyPaciente:

EXEC modifyPaciente
@cedula = '117390700',
@nombre	='Ruben',
@primerApellido	= 'Salas',
@segundoApellido = 'Ramirez',
@nacionalidad = 'Costa Rica',
@fechaNacimiento = '1999-03-29',
@idUbicacion = 69,
-- Atributos de Ubicacion
@continente = 'Europe',
@pais = 'France',
@region = 'Paris',
--Atributos de Paciente
@idPaciente = 936,
@internado = 'false',
@uci = 'false',
@fechaIngreso = '2020-04-17',
@idEstadoPaciente = 3,
@idCentroHospitalario = 42,
-- Atributo para tipo de declaracion
@statementType = 'Delete';

*/






/*
Proceso para actualizar datos de Contacto
*/
CREATE PROCEDURE modifyContacto(
	-- Atributos de Persona
	@cedula VARCHAR(30),
	@nombre	VARCHAR(75),
	@primerApellido	VARCHAR(75),
	@segundoApellido VARCHAR(75),
	@nacionalidad VARCHAR(50),
	@fechaNacimiento DATE,
	@idUbicacion INT,
	---- Atributos de Ubicacion
	--@continente VARCHAR(75),
	--@pais VARCHAR(75),
	--@region VARCHAR(75),
	-- Atributos de Contacto
	@idContacto INT,
	@correo	varchar(100),
	@idPaciente INT,
	-- Atributo para tipo de declaracion
	@statementType VARCHAR(20) )
AS
BEGIN

	IF @statementType = 'Insert'
		BEGIN
			----Genera una nueva ubicacion solo si no esta ya antes creada
			--IF ((dbo.getIdUbicacion(@continente, @pais, @region) != @idUbicacion) AND ((dbo.getIdUbicacion(@continente, @pais, @region) = 0)) )
			--	BEGIN
			--		INSERT INTO Ubicacion (
			--			continente, 
			--			pais,
			--			region )
			--		VALUES (
			--			 @continente,
			--			 @pais,
			--			 @region )
			--	END

			-- Genera una Persona solo si no esta ya antes creada
			IF NOT (@cedula IN (SELECT cedula FROM Persona WHERE cedula = @cedula) )
				BEGIN
					INSERT INTO Persona(
						cedula,
						nombre,
						primerApellido,
						segundoApellido,
						nacionalidad,
						fechaNacimiento,
						idUbicacion )
					VALUES (
						@cedula,
						@nombre,
						@primerApellido, 
						@segundoApellido,
						@nacionalidad,
						@fechaNacimiento,
						@idUbicacion )
						--dbo.getIdUbicacion(@continente, @pais, @region) )
				END

			-- Genera un Contacto solo si no esta ya antes creado
			IF NOT (@cedula IN (SELECT cedula FROM Contacto WHERE cedula = @cedula) )
				BEGIN
					INSERT INTO Contacto (
						correo,
						idPaciente,
						cedula )
					VALUES (
						@correo,
						@idPaciente,
						@cedula )
				END
		END

	ELSE IF @statementType = 'Update'
		BEGIN
			----Genera una nueva ubicacion solo si no esta ya antes creada
			--IF ((dbo.getIdUbicacion(@continente, @pais, @region) != @idUbicacion) AND ((dbo.getIdUbicacion(@continente, @pais, @region) = 0)) )
			--	BEGIN
			--		INSERT INTO Ubicacion (
			--			continente, 
			--			pais,
			--			region )
			--		VALUES (
			--			 @continente,
			--			 @pais,
			--			 @region )
			--	END

			--Actualiza los datos de Persona
			UPDATE Persona  
			SET cedula = @cedula,
				nombre = @nombre,
				primerApellido = @primerApellido,
				segundoApellido = @segundoApellido,
				nacionalidad = @nacionalidad,
				fechaNacimiento = @fechaNacimiento,
				idUbicacion = @idUbicacion)        --dbo.getIdUbicacion(@continente, @pais, @region)
			WHERE cedula = @cedula
				--Verifica que la persona exista
				IF NOT (@cedula IN (SELECT cedula FROM Persona))
						THROW 50001, 'No hay ninguna persona con esta cedula.',1;

			--Actualiza los datos de Paciente
			UPDATE Contacto
			SET correo = @correo,
				idPaciente = @idPaciente,
				cedula = @cedula
			WHERE idContacto = @idContacto
			--Verifica que el contacto exista
				IF NOT (@idContacto IN (SELECT idContacto FROM Contacto))
						THROW 50001, 'No hay ningun contacto con este idContacto.',1;
		END

	ELSE IF @statementType = 'Delete'
		BEGIN
			--Verifica que el contacto exista
			IF NOT (@idContacto IN (SELECT idContacto FROM Contacto))
					THROW 50001, 'No hay ningun contacto con este idContacto.',1;
			--Borra el Contacto
			DELETE FROM Contacto WHERE idContacto = @idContacto
		END

	ELSE
		BEGIN
		PRINT 'Error en modifyContacto'
		END

END
GO
/*

--Para ejecutar modifyContacto:

EXEC modifyContacto
@cedula = '117390704',
@nombre	='Ruben',
@primerApellido	= 'Salas',
@segundoApellido = 'Ramirez',
@nacionalidad = 'Costa Rica',
@fechaNacimiento = '1999-03-29',
@idUbicacion = 69,
-- Atributos de Ubicacion
@continente = 'Europe',
@pais = 'Belgium',
@region = 'Boom',
--Atributos de Paciente
@idContacto = 5,
@correo = 'rubsalas@htomail.com',
@idPaciente = 10,
-- Atributo para tipo de declaracion
@statementType = 'Update';

*/








/*
Proceso para actualizar datos de BaseTable
*/
ALTER PROCEDURE modifyMedidaSanitaria(
	-- Atributos de MedidaSanitaria
	@idMedidaSanitaria INT,
	@nombre varchar(100),
	@descripcion varchar(500),
	-- Atributo para tipo de declaracion
	@statementType VARCHAR(20) ) 
AS
BEGIN

	IF @statementType = 'Insert'
		BEGIN
		-- Genera una MedidaSanitaria solo si no esta ya antes creada
			IF NOT (@nombre IN (SELECT nombre FROM MedidaSanitaria WHERE nombre = @nombre) )
				BEGIN
					INSERT INTO MedidaSanitaria(
						nombre,
						descripcion )
					VALUES (
						@nombre,
						@descripcion )
				END
			ELSE
				THROW 50001, 'Ya existe una Medida Sanitaria con ese Nombre',1;
		END

	ELSE IF @statementType = 'Update'
		BEGIN

		-- Actualiza una MedidaSanitaria solo si esta existe
			IF (@idMedidaSanitaria IN (SELECT @idMedidaSanitaria FROM MedidaSanitaria WHERE @idMedidaSanitaria = @idMedidaSanitaria) )
				BEGIN
					UPDATE MedidaSanitaria
					SET nombre = @nombre,
						descripcion = @descripcion
					WHERE idMedidaSanitaria = @idMedidaSanitaria
				END
			ELSE
				THROW 50001, 'No existe una Medida Sanitaria con ese idMedidaSanitaria',1;
		END

	ELSE IF @statementType = 'Delete'
		BEGIN
		PRINT 'Delete'
		END

	ELSE
		BEGIN
		PRINT 'Error'
		END

END
GO




/*
Proceso para actualizar datos de BaseTable
*/
ALTER PROCEDURE modifyUbicacionMedidaSanitaria(
	-- Atributos de UbicacionMedidaSanitaria
	@idUbicacionMedidaSanitaria INT,
	@idUbicacion INT,
	@idMedidaSanitaria INT,
	@estado varchar(20),
	@fechaInicio date,
	@fechaFinal date,
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

			-- Genera una UbicacionMedidaSanitaria
			INSERT INTO UbicacionMedidaSanitaria(
				idUbicacion,
				idMedidaSanitaria,
				estado,
				fechaInicio,
				fechaFinal )
			VALUES (
				dbo.getIdUbicacion(@continente, @pais, @region),
				@idMedidaSanitaria,
				@estado,
				@fechaInicio,
				@fechaFinal )
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

			-- Actualiza una UbicacionMedidaSanitaria solo si esta existe
			IF (@idUbicacionMedidaSanitaria IN (SELECT idUbicacionMedidaSanitaria FROM UbicacionMedidaSanitaria WHERE idUbicacionMedidaSanitaria = @idUbicacionMedidaSanitaria) )
				BEGIN
					UPDATE UbicacionMedidaSanitaria
					SET idUbicacion = dbo.getIdUbicacion(@continente, @pais, @region),
						idMedidaSanitaria = @idMedidaSanitaria,
						estado = @estado,
						fechaInicio = @fechaInicio,
						fechaFinal = @fechaFinal
					WHERE idUbicacionMedidaSanitaria = @idUbicacionMedidaSanitaria
				END
			ELSE
				THROW 50001, 'No existe una Ubicacion Medida Sanitaria con ese idUbicacionMedidaSanitaria',1;
		END

	ELSE IF @statementType = 'Delete'
		BEGIN
			--Verifica que la UbicacionMedidaSanitaria exista
			IF NOT (@idUbicacionMedidaSanitaria IN (SELECT idUbicacionMedidaSanitaria FROM UbicacionMedidaSanitaria))
					THROW 50001, 'No hay ninguna UbicacionMedidaSanitaria con este idUbicacionMedidaSanitaria.',1;
			--Borra la UbicacionMedidaSanitaria
			DELETE FROM UbicacionMedidaSanitaria WHERE idUbicacionMedidaSanitaria = @idUbicacionMedidaSanitaria
		END

	ELSE
		BEGIN
		PRINT 'Error'
		END

END
GO











/******* BASE STORED PROCEDURE *******/
/*
Proceso para actualizar datos de BaseTable
*/
/*
CREATE PROCEDURE modifyBaseTable(
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

	ELSE
		BEGIN
		PRINT 'Error'
		END

END
GO
*/