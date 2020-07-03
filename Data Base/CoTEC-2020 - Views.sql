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
CoTEC-2020 - Views
--------------------------------------------------------------------
*/


Use [CoTEC-2020];
Go


/*
Vista para Paciente
Obtiene la siguiente información de los Pacientes:
Nombre Completo, Cédula, Edad, Nacionalidad, Región, Patologías, Estado, Medicamentos, Internado y UCI.
*/
CREATE VIEW viewPaciente WITH ENCRYPTION AS
SELECT
		dbo.getNombreCompleto(pr.cedula) AS NombreCompleto,
		pr.cedula AS Cedula, 
		dbo.getEdad(fechaNacimiento) AS Edad,
		nacionalidad AS Nacionalidad,
		region AS Region,
		dbo.getPatologias(pr.cedula) AS Patologias,
		estado as Estado,
		dbo.getMedicamentos(pa.idPaciente) as Medicamentos,
		internado as Internado,
		uci as UCI,
		pa.idPaciente as IdPaciente
	FROM 
		Persona as pr
		JOIN Paciente as pa ON pa.cedula = pr.cedula
		JOIN Ubicacion as u ON pr.idUbicacion=u.idUbicacion
		JOIN EstadoPaciente as ep ON pa.idEstadoPaciente=ep.idEstadoPaciente
GO


/*
Vista para Contacto
Obtiene la siguiente información de los Pacientes:
Nombre Completo, Cédula, Edad, Nacionalidad, Ubicación, Patologías, Estado y Correo
*/
CREATE VIEW viewContacto WITH ENCRYPTION AS
	SELECT
		dbo.getNombreCompleto(pr.cedula) AS NombreCompleto,
		pr.cedula AS Cedula, 
		dbo.getEdad(fechaNacimiento) AS Edad,
		nacionalidad AS Nacionalidad,
		dbo.getUbicacionCompleta(pr.idUbicacion) AS Ubicacion,
		dbo.getPatologias(pr.cedula) AS Patologias,
		correo as Correo,
		c.idContacto as IdContacto
		FROM 
		Persona as pr
		INNER JOIN Contacto as c ON c.cedula = pr.cedula
		JOIN Ubicacion as u ON pr.idUbicacion=u.idUbicacion
GO


/*
Vista para CentroHospitalario
Obtiene la siguiente información de los Centros Hospitalarios:
Ubicación, Nombre, Capacidad, Capacidad UCI, Director, Contacto
*/
CREATE VIEW viewCentroHospitalario WITH ENCRYPTION AS
	SELECT
		dbo.getRegionPais(ch.idUbicacion) AS Ubicacion,
		ch.nombre AS Nombre,
		ch.capacidad AS Capacidad,
		ch.capacidadUci AS CapacidadUCI,
		dbo.getNombreCompleto(ch.director) AS Director,
		ch.contacto AS Contacto,
		ch.idCentroHospitalario as IdCentroHospitalario
		FROM
			CentroHospitalario as ch
GO


/*
Vista para MedidaSanitaria
Obtiene la siguiente información de las Medidas Sanitarias:
Nombre, Descripcion, Estado, Ubicacion, FechaInicial y FechaFinal
*/
CREATE VIEW viewMedidaSanitaria WITH ENCRYPTION AS
	SELECT
		ms.nombre as Nombre,
		ms.descripcion as Descripcion,
		ums.estado as Estado,
		dbo.getUbicacionCompleta(ums.idUbicacion) AS Ubicacion,
		ums.fechaInicio as FechaInicio,
		ums.fechaFinal as FechaFinal
	FROM
		MedidaSanitaria as ms
		JOIN UbicacionMedidaSanitaria as ums ON ms.idMedidaSanitaria = ums.idMedidaSanitaria
GO


/*
Vista para MedidaContencion
Obtiene la siguiente información de las Medidas de Contencion:
Nombre, Descripcion, Estado, Ubicacion, FechaInicial y FechaFinal
*/
CREATE VIEW viewMedidaContencion WITH ENCRYPTION AS
	SELECT
		mc.nombre as Nombre,
		mc.descripcion as Descripcion,
		dbo.getUbicacionCompleta(umc.idUbicacion) AS Ubicacion,
		umc.fechaInicio as FechaInicio
	FROM
		MedidaContencion as mc
		JOIN UbicacionMedidaContencion as umc ON mc.idMedidaContencion = umc.idMedidaContencion
GO


/*
Vista para Requerimiento de Software: Acumulado de casos confirmados
Obtiene la siguiente información del Acumulado de casos confirmados
FechaInicio, Pais, y Nombre de Medida Contencion
*/
CREATE VIEW viewAcumuladoCasos WITH ENCRYPTION AS
	SELECT
		umc.fechaInicio as FechaInicio,
		u.pais as Pais,
		mc.nombre as Nombre
	FROM
		MedidaContencion as mc
		JOIN UbicacionMedidaContencion as umc ON mc.idMedidaContencion = umc.idMedidaContencion
		JOIN Ubicacion as u ON umc.idUbicacion = u.idUbicacion
	WHERE umc.fechaInicio BETWEEN GETDATE() AND DATEADD(week, 1, GETDATE())
GO

/*
Para correrlo para que cumpla lo establecido en especificación:

SELECT FechaInicio, Nombre
FROM viewAcumuladoCasos
WHERE Pais='__pais_-'
ORDER BY FechaInicio
*/

