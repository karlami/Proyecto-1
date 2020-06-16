/*
--------------------------------------------------------------------
Proyecto #1 - CoTEC-2020
--------------------------------------------------------------------
Instituto T�cnol�gico de Costa Rica
�rea Acad�mica de Ingenier�a en Computadores
Bases de Datos (CE3101) 
I Semestre 2020
Prof. Luis Diego Noguera Mena
Cristhofer Azofeifa, Fiorella Delgado, Karla Rivera & Rub�n Salas
--------------------------------------------------------------------
CoTEC-2020 - Views
--------------------------------------------------------------------
*/


Use [CoTEC-2020];
Go


/*
Vista para Paciente
Obtiene la siguiente informaci�n de los Pacientes:
Nombre Completo, C�dula, Edad, Nacionalidad, Regi�n, Patolog�as, Estado, Medicamentos, Internado y UCI.
*/
CREATE VIEW viewPaciente WITH ENCRYPTION AS
SELECT
		dbo.getNombreCompleto(pr.cedula) AS [Nombre Completo],
		pr.cedula AS C�dula, 
		dbo.getEdad(fechaNacimiento) AS Edad,
		nacionalidad AS Nacionalidad,
		region AS Regi�n,
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
Obtiene la siguiente informaci�n de los Pacientes:
Nombre Completo, C�dula, Edad, Nacionalidad, Ubicaci�n, Patolog�as, Estado y Correo
*/
CREATE VIEW viewContacto WITH ENCRYPTION AS
	SELECT
		dbo.getNombreCompleto(pr.cedula) AS [Nombre Completo],
		pr.cedula AS C�dula, 
		dbo.getEdad(fechaNacimiento) AS Edad,
		nacionalidad AS Nacionalidad,
		dbo.getUbicacionCompleta(pr.idUbicacion) AS Ubicaci�n,
		dbo.getPatologias(pr.cedula) AS Patologias,
		correo as Correo
		FROM 
		Persona as pr
		INNER JOIN Contacto as c ON c.cedula = pr.cedula
		JOIN Ubicacion as u ON pr.idUbicacion=u.idUbicacion
GO


/*
Vista para CentroHospitalario
Obtiene la siguiente informaci�n de los Centros Hospitalarios:
Ubicaci�n, Nombre, Capacidad, Capacidad UCI, Director, Contacto
*/
CREATE VIEW viewCentroHospitalario WITH ENCRYPTION AS
	SELECT
		dbo.getRegionPais(ch.idUbicacion) AS Ubicaci�n,
		ch.nombre AS Nombre,
		ch.capacidad AS Capacidad,
		ch.capacidadUci AS [Capacidad UCI],
		dbo.getNombreCompleto(ch.director) AS Director,
		ch.contacto AS Contacto
		FROM
			CentroHospitalario as ch
GO

