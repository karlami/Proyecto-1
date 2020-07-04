

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
CoTEC-2020 - Functions
--------------------------------------------------------------------
*/


Use [CoTEC-2020];
Go


/*
Obtiene el nombre completo de una persona al ingresar su cedula.
param: cedula INT
return: nombre completo concatenado
*/
CREATE FUNCTION getNombreCompleto(@cedula INT) RETURNS VARCHAR(60)
AS
BEGIN
	DECLARE @NombreCompleto VARCHAR(50)
	SET @NombreCompleto=CONCAT((SELECT Persona.nombre FROM Persona 
		WHERE @cedula=Persona.cedula),' ',(SELECT Persona.primerApellido FROM Persona 
		WHERE @cedula=Persona.cedula),' ',(SELECT Persona.segundoApellido FROM Persona 
		WHERE @cedula=Persona.cedula))
	RETURN @NombreCompleto
END
GO


/*
Obtiene la edad de la persona al ingresar la fecha de nacimiento
param: fechaNacimiento date
return: edad
*/
CREATE FUNCTION getEdad(@fechaNacimiento date) RETURNS INT
AS
BEGIN
	DECLARE @edad INT
	SET @edad=FLOOR(DATEDIFF(DAY, @fechaNacimiento, GETDATE()) / 365.25)
	RETURN @edad
END
GO


/*
Obtiene la lista de patologias que presenta la persona al ingresar su cedula
param: cedula INT
return: lista con patologias
*/
CREATE FUNCTION getPatologias(@cedula INT) RETURNS VARCHAR(1000)
AS
BEGIN
DECLARE @patologias VarChar(1000)
	SELECT @patologias = STRING_AGG(pt.nombre, ', ')
	FROM 
		PersonaPatologia as pp
		RIGHT JOIN Patologia as pt ON pp.idPatologia=pt.idPatologia
	WHERE
	pp.cedula=@cedula
	RETURN @patologias
END
GO


/*
Obtiene la lista de medicamentos que necesita el paciente al ingresar su idPaciente
param: idPaciente INT
return: lista con medicinas
*/
CREATE FUNCTION getMedicamentos(@idPaciente INT) RETURNS VARCHAR(1000)
AS
BEGIN
DECLARE @medicamentos VarChar(1000)
	SELECT @medicamentos = STRING_AGG(m.nombre, ', ')
	FROM
	PacienteMedicamento as pm
	RIGHT JOIN Medicamento as m ON pm.idMedicamento=m.idMedicamento
	WHERE
	pm.idPaciente=@idPaciente
	RETURN @medicamentos
END
GO


/*
Obtiene la ubicacion completa al ingresar el idUbicacion con el formato: [Región, País, Continente]
param: idUbicacion INT
return: Ubicación concatenada
*/
CREATE FUNCTION getUbicacionCompleta(@idUbicacion INT) RETURNS VARCHAR(225)
AS
BEGIN
	DECLARE @UbicacionCompleta VARCHAR(225)
	SET @UbicacionCompleta=CONCAT((SELECT Ubicacion.Region FROM Ubicacion 
		WHERE @idUbicacion=Ubicacion.idUbicacion),', ',(SELECT Ubicacion.Pais FROM Ubicacion 
		WHERE @idUbicacion=Ubicacion.idUbicacion),', ',(SELECT Ubicacion.Continente FROM Ubicacion 
		WHERE @idUbicacion=Ubicacion.idUbicacion))
	RETURN @UbicacionCompleta
END
GO


/*
Obtiene solo la Región y el País al ingresar el idUbicacion con el formato: [Región, País]
param: idUbicacion INT
return: región y país concatenados
*/
CREATE FUNCTION getRegionPais(@idUbicacion INT) RETURNS VARCHAR(150)
AS
BEGIN
	DECLARE @RegionPais VARCHAR(150)
	SET @RegionPais=CONCAT((SELECT Ubicacion.Region FROM Ubicacion 
		WHERE @idUbicacion=Ubicacion.idUbicacion),', ',(SELECT Ubicacion.Pais FROM Ubicacion 
		WHERE @idUbicacion=Ubicacion.idUbicacion))
	RETURN @RegionPais
END
GO


/*
Obtiene el id de la Ubicacion al ingresar el continente, pais y region
param: continente VARCHAR(75), pais VARCHAR(75) y region VARCHAR(75)
return: idUbicacion
*/
CREATE FUNCTION getIdUbicacion(@continente VARCHAR(75), @pais VARCHAR(75), @region VARCHAR(75)) RETURNS INT
AS
BEGIN
	DECLARE @IdUbicacion INT
	SET @IdUbicacion=(SELECT TOP 1 Ubicacion.idUbicacion FROM Ubicacion 
		WHERE @continente=Ubicacion.continente AND @pais=Ubicacion.pais AND @region=Ubicacion.region)
	IF (@IdUbicacion IS NULL)
	BEGIN
		SET @IdUbicacion = 0
	END
	RETURN @IdUbicacion
END
GO


/*
Obtiene el idUbicacion al ingresar la region y el pais de la ubicacion
param:  region VARCHAR(75) y pais VARCHAR(75)
return: idUbicacion
*/
CREATE FUNCTION getIdUbicacionFromRegionPais(@region VARCHAR(75), @pais VARCHAR(75)) RETURNS INT
AS
BEGIN
	DECLARE @IdUbicacion INT
	SET @IdUbicacion=(SELECT Ubicacion.idUbicacion FROM Ubicacion 
		WHERE @region=Ubicacion.region AND @pais=Ubicacion.pais)
	RETURN @IdUbicacion
END
GO


/*
Obtiene el idUbicacion al ingresar la region de la ubicacion
param: region VARCHAR(75)
return: idUbicacion
*/
CREATE FUNCTION getIdUbicacionFromRegion(@region VARCHAR(75)) RETURNS INT
AS
BEGIN
	DECLARE @IdUbicacion INT
	SET @IdUbicacion=(SELECT Ubicacion.idUbicacion FROM Ubicacion 
		WHERE @region=Ubicacion.region)
	RETURN @IdUbicacion
END
GO


/*
Obtiene el id de Patologia al ingresar el nombre de la patologia
param: nombre VARCHAR(100)
return: idPatologia
*/
CREATE FUNCTION getIdPatologia(@nombre VARCHAR(100)) RETURNS INT
AS
BEGIN
	DECLARE @IdPatologia INT
	SET @IdPatologia=(SELECT Patologia.idPatologia FROM Patologia 
		WHERE @nombre=Patologia.nombre)
	RETURN @IdPatologia
END
GO


/*
Obtiene el id del Medicamento al ingresar el nombre del medicamento
param: nombre VARCHAR(100)
return: idMedicamento
*/
CREATE FUNCTION getIdMedicamento(@nombre VARCHAR(100)) RETURNS INT
AS
BEGIN
	DECLARE @IdMedicamento INT
	SET @IdMedicamento=(SELECT Medicamento.idMedicamento FROM Medicamento 
		WHERE @nombre=Medicamento.nombre)
	RETURN @IdMedicamento
END
GO

