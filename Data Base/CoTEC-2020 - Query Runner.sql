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
CoTEC-2020 - Query Runner
--------------------------------------------------------------------
*/


Use [CoTEC-2020];
Go

/* Esa funcion obtiene la ubicacion completa, con los 3 valores */
/*
CREATE FUNCTION getUbicacionCompleta(@idUbicacion INT) RETURNS VARCHAR(60)
AS
BEGIN
	DECLARE @UbicacionCompleta VARCHAR(50)
	SET @UbicacionCompleta=CONCAT((SELECT Ubicacion.Region FROM Ubicacion 
		WHERE @idUbicacion=Ubicacion.idUbicacion),' ',(SELECT Ubicacion.Pais FROM Ubicacion 
		WHERE @idUbicacion=Ubicacion.idUbicacion),' ',(SELECT Ubicacion.Continente FROM Ubicacion 
		WHERE @idUbicacion=Ubicacion.idUbicacion))
	RETURN @UbicacionCompleta
END
GO*/


/* Testing */
--SELECT dbo.getUbicacionCompleta(idUbicacion) AS UbicacionCompleta
--FROM Ubicacion;




/* Esa es solo con region y Pais */
/*
CREATE FUNCTION getRegionPais(@idUbicacion INT) RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @RegionPais VARCHAR(50)
	SET @RegionPais=CONCAT((SELECT Ubicacion.Region FROM Ubicacion 
		WHERE @idUbicacion=Ubicacion.idUbicacion),', ',(SELECT Ubicacion.Pais FROM Ubicacion 
		WHERE @idUbicacion=Ubicacion.idUbicacion))
	RETURN @RegionPais
END
GO*/


/*  */
--SELECT dbo.getRegionPais(idUbicacion) AS RegionPais
--FROM Ubicacion;




/* Obtiene el nombre completo de una persona */

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

--GO

--SELECT dbo.getNombreCompleto(cedula) AS NombreCompleto
--FROM Persona;



/* Obtiene lalista de patologias de la persona */
/*
CREATE FUNCTION getPatologias(@cedula INT) RETURNS VARCHAR(300)
AS
BEGIN
	DECLARE @Patologias VARCHAR(300)
	SET @Patologias=CONCAT()

	RETURN
END
GO*/



/*funcion que obtenga la fecha de nacimiento de la persona

SELECT FLOOR((CAST (GetDate() AS INTEGER) - CAST(Date_of_birth AS INTEGER)) / 365.25) AS Age
*/











/* ViewPaciente */

CREATE VIEW viewPaciente 
WITH ENCRYPTION
AS
	SELECT 
		dbo.getNombreCompleto(pr.cedula) AS [Nombre Completo],
		pr.cedula AS cedula, 
		FLOOR(DATEDIFF(DAY, fechaNacimiento, GETDATE()) / 365.25) AS Edad,
		nacionalidad AS Nacionalidad,
		region AS Region,
		pt.nombre as Patologia,
		estado as Estado,
		m.nombre as Medicamento,
		internado as Internado,
		uci as UCI
	FROM 
		Persona as pr
		JOIN Paciente as pa ON pa.cedula = pr.cedula
		JOIN Ubicacion as u ON pr.idUbicacion=u.idUbicacion
		JOIN PersonaPatologia as pp ON pr.cedula=pp.cedula
		JOIN Patologia as pt ON pp.idPatologia=pt.idPatologia
		JOIN PacienteEstado as pe ON pa.idPaciente=pe.idPaciente
		JOIN PacienteMedicamento as pm ON pa.idPaciente=pm.idPaciente
		JOIN Medicamento as m ON pm.idMedicamento=m.idMedicamento










/* ViewContacto */


/* ViewCentroHospitalario */