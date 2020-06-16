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
		dbo.getNombreCompleto(pr.cedula) AS [Nombre Completo],
		pr.cedula AS Cédula, 
		dbo.getEdad(fechaNacimiento) AS Edad,
		nacionalidad AS Nacionalidad,
		region AS Región,
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
		JOIN PacienteEstado as pe ON pa.idPaciente=pe.idPaciente
GO


/*
Vista para Contacto
Obtiene la siguiente información de los Pacientes:
Nombre Completo, Cédula, Edad, Nacionalidad, Ubicación, Patologías, Estado y Correo
*/
CREATE VIEW viewContacto WITH ENCRYPTION AS
	SELECT
		dbo.getNombreCompleto(pr.cedula) AS [Nombre Completo],
		pr.cedula AS Cédula, 
		dbo.getEdad(fechaNacimiento) AS Edad,
		nacionalidad AS Nacionalidad,
		dbo.getUbicacionCompleta(pr.idUbicacion) AS Ubicación,
		dbo.getPatologias(pr.cedula) AS Patologias,
		correo as Correo
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
		dbo.getRegionPais(ch.idUbicacion) AS Ubicación,
		ch.nombre AS Nombre,
		ch.capacidad AS Capacidad,
		ch.capacidadUci AS [Capacidad UCI],
		dbo.getNombreCompleto(ch.director) AS Director,
		ch.contacto AS Contacto
		FROM
			CentroHospitalario as ch
GO

