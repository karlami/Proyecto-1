

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
CoTEC-2020 - Triggers
--------------------------------------------------------------------
*/


Use [CoTEC-2020];
Go


/*
Trigger Estados Predefinidos en EstadoPaciente
No permite que se eliminen los estados predefinidos de los pacientes (Primeros 4 ids).
*/
CREATE TRIGGER predefinedEstadoPaciente
ON EstadoPaciente
FOR DELETE
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (
		SELECT *
		FROM deleted
		WHERE idEstadoPaciente <= 4
	)
	BEGIN
		ROLLBACK;
		THROW 50001, 'No se puede eliminar, es un estado predefinido',1;
	END
END
GO


/*
Trigger para CentroHospitalario
*/
CREATE TRIGGER triggerCentroHospitalario
ON CentroHospitalario
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON;
	IF ( (SELECT capacidad FROM inserted) < (SELECT capacidadUci FROM inserted) ) 
		BEGIN
			ROLLBACK;
			THROW 50001, 'No se puede insertar, capacidadUci es mayor a capacidad',1;
		END
END
GO

