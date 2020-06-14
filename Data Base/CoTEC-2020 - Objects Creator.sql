
/****** Object:  Database CoTEC-2020 ******/
CREATE DATABASE [CoTEC-2020]
GO

USE [CoTEC-2020]
GO 


/****** Object:  Table Ubicacion ******/
CREATE TABLE Ubicacion(
	idUbicacion					INT					NOT NULL,
	continente					VARCHAR(75)			NOT NULL,
	pais						VARCHAR(75)			NOT NULL,
	region						VARCHAR(75)			NOT NULL
	PRIMARY KEY(idUbicacion)
)
GO


/****** Object:  Table MedidaSanitaria ******/
CREATE TABLE MedidaSanitaria(
	idMedidaSanitaria			INT					NOT NULL,
	nombre						VARCHAR(100)		NOT NULL,
	descripcion					VARCHAR(300)		NOT NULL,
	estado						VARCHAR(20)			NOT NULL,
	fechaInicio					DATE				NOT NULL,
	fechaFinal					DATE				NULL,
	PRIMARY KEY(idMedidaSanitaria)
)
GO


/****** Object:  Table Patologia ******/
CREATE TABLE Patologia(
	idPatologia					INT					NOT NULL,
	nombre						VARCHAR(100)		NOT NULL,
	descripcion					VARCHAR(300)		NOT NULL,
	sintomas					VARCHAR(300)		NOT NULL,
	tratamiento					VARCHAR(300)		NOT NULL,
	PRIMARY KEY(idPatologia)
)
GO


/****** Object:  Table Medicamento ******/
CREATE TABLE Medicamento(
	idMedicamento				INT					NOT NULL,
	nombre						VARCHAR(100)		NOT NULL,
	descripcion					VARCHAR(300)		NOT NULL,
	casaFarmaceutica			VARCHAR(100)		NOT NULL,
	PRIMARY KEY(idMedicamento)
)
GO


/****** Object:  Table Persona ******/
CREATE TABLE Persona(
	cedula						VARCHAR(30)			NOT NULL,
	nombre						VARCHAR(75)			NOT NULL,
	primerApellido				VARCHAR(75)			NOT NULL,
	segundoApellido				VARCHAR(75)			NOT NULL,
	nacionalidad				VARCHAR(50)			NOT NULL,
	fechaNacimiento				DATE				NOT NULL,
	idUbicacion					INT					NOT NULL,
	PRIMARY KEY(cedula),
	FOREIGN KEY(idUbicacion)						REFERENCES Ubicacion(idUbicacion)
)
GO


/****** Object:  Table CentroHospitalario ******/
CREATE TABLE CentroHospitalario(
	idCentroHospitalario		INT					NOT NULL,
	nombre						VARCHAR(100)		NOT NULL,
	capacidad					INT					NOT NULL,
	capacidadUci				INT					NOT NULL,
	director					VARCHAR(30)			NOT NULL,
	contacto					VARCHAR(50)			NOT NULL,
	idUbicacion					INT					NOT NULL,
	PRIMARY KEY(idCentroHospitalario),
	FOREIGN KEY(idUbicacion)						REFERENCES Ubicacion(idUbicacion)
)
GO


/****** Object:  Table Contacto ******/
CREATE TABLE Contacto(
	idContacto					INT					NOT NULL,
	correo						VARCHAR(100)		NOT NULL,
	idPaciente					INT					NOT NULL,
	cedula						VARCHAR(30)			NOT NULL,
	PRIMARY KEY(idContacto),
	FOREIGN KEY(cedula)								REFERENCES Persona(cedula)
)
GO


/****** Object:  Table Paciente ******/
CREATE TABLE Paciente(
	idPaciente					INT					NOT NULL,
	estado						VARCHAR(100)		NOT NULL,
	internado					VARCHAR(10)			NOT NULL,
	uci							VARCHAR(10)			NOT NULL,
	fechaIngreso				DATE				NOT NULL,
	idCentroHospitalario		INT					NOT NULL,
	cedula						VARCHAR(30)			NOT NULL,
	PRIMARY KEY(idPaciente),
	FOREIGN KEY(idCentroHospitalario)				REFERENCES CentroHospitalario(idCentroHospitalario),
	FOREIGN KEY(cedula)								REFERENCES Persona(cedula)
)
GO


/****** Object:  Table PersonaPatologia ******/
CREATE TABLE PersonaPatologia(
	idPersonaPatologia			INT					NOT NULL,
	cedula						VARCHAR(30)			NOT NULL,
	idPatologia					INT					NOT NULL,
	PRIMARY KEY(idPersonaPatologia),
	FOREIGN KEY(cedula)								REFERENCES Persona(cedula),
	FOREIGN KEY(idPatologia)						REFERENCES Patologia(idPatologia)
)
GO


/****** Object:  Table PacienteMedicamento ******/
CREATE TABLE PacienteMedicamento(
	idPacienteMedicamento		INT					NOT NULL,
	idMedicamento				INT					NOT NULL,
	idPaciente					INT					NOT NULL,
	PRIMARY KEY(idPacienteMedicamento),
	FOREIGN KEY(idMedicamento)						REFERENCES Medicamento(idMedicamento),
	FOREIGN KEY(idPaciente)							REFERENCES Paciente(idPaciente)
)
GO


/****** Object:  Table UbicacionMedidaSanitaria ******/
CREATE TABLE UbicacionMedidaSanitaria(
	idUbicacionMedidaSanitaria	INT					NOT NULL,
	idUbicacion					INT					NOT NULL,
	idMedidaSanitaria			INT					NOT NULL,
	PRIMARY KEY(idUbicacionMedidaSanitaria),
	FOREIGN KEY(idUbicacion)						REFERENCES Ubicacion(idUbicacion),
	FOREIGN KEY(idMedidaSanitaria)					REFERENCES MedidaSanitaria(idMedidaSanitaria)
)
GO

