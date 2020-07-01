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
CoTEC-2020 - Objects Creator
--------------------------------------------------------------------
*/

/****** Object:  Database CoTEC-2020 ******/
CREATE DATABASE [CoTEC-2020]
GO

USE [CoTEC-2020]
GO 


/****** Object:  Table Ubicacion ******/
CREATE TABLE Ubicacion(
	idUbicacion					INT	IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	continente					VARCHAR(75)								NOT NULL,
	pais						VARCHAR(75)								NOT NULL,
	region						VARCHAR(75)								NOT NULL
)
GO


/****** Object:  Table MedidaSanitaria ******/
CREATE TABLE MedidaSanitaria(
	idMedidaSanitaria			INT IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	nombre						VARCHAR(100)							NOT NULL,
	descripcion					VARCHAR(500)							NOT NULL,
)
GO


/****** Object:  Table MedidaContencion ******/
CREATE TABLE MedidaContencion(
	idMedidaContencion			INT IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	nombre						VARCHAR(100)							NOT NULL,
	descripcion					VARCHAR(500)							NOT NULL,
)
GO


/****** Object:  Table Patologia ******/
CREATE TABLE Patologia(
	idPatologia					INT IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	nombre						VARCHAR(100)							NOT NULL,
	descripcion					VARCHAR(500)							NOT NULL,
	sintomas					VARCHAR(500)							NOT NULL,
	tratamiento					VARCHAR(500)							NOT NULL
)
GO


/****** Object:  Table Medicamento ******/
CREATE TABLE Medicamento(
	idMedicamento				INT	IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	nombre						VARCHAR(100)							NOT NULL,
	descripcion					VARCHAR(500)							NOT NULL,
	casaFarmaceutica			VARCHAR(100)							NOT NULL
)
GO


/****** Object:  Table Persona ******/
CREATE TABLE Persona(
	cedula						VARCHAR(30) PRIMARY KEY					NOT NULL,
	nombre						VARCHAR(75)								NOT NULL,
	primerApellido				VARCHAR(75)								NOT NULL,
	segundoApellido				VARCHAR(75)								NOT NULL,
	nacionalidad				VARCHAR(50)								NOT NULL,
	fechaNacimiento				DATE									NOT NULL,
	idUbicacion					INT										NOT NULL,
	FOREIGN KEY(idUbicacion)						REFERENCES Ubicacion(idUbicacion)
)
GO


/****** Object:  Table CentroHospitalario ******/
CREATE TABLE CentroHospitalario(
	idCentroHospitalario		INT IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	nombre						VARCHAR(200)							NOT NULL,
	capacidad					INT										NOT NULL,
	capacidadUci				INT										NOT NULL,
	contacto					VARCHAR(50)								NOT NULL,
	director					VARCHAR(30)								NOT NULL,
	idUbicacion					INT										NOT NULL,
	FOREIGN KEY(director)							REFERENCES Persona(cedula),
	FOREIGN KEY(idUbicacion)						REFERENCES Ubicacion(idUbicacion)
)
GO


/****** Object:  Table Contacto ******/
CREATE TABLE Contacto(
	idContacto					INT IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	correo						VARCHAR(100)							NOT NULL,
	idPaciente					INT										NOT NULL,
	cedula						VARCHAR(30)								NOT NULL,
	FOREIGN KEY(cedula)								REFERENCES Persona(cedula)
)
GO


/****** Object:  Table Paciente ******/
CREATE TABLE Paciente(
	idPaciente					INT	IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	internado					VARCHAR(10)								NOT NULL,
	uci							VARCHAR(10)								NOT NULL,
	fechaIngreso				DATE									NOT NULL,
	idCentroHospitalario		INT										NOT NULL,
	cedula						VARCHAR(30)								NOT NULL,
	FOREIGN KEY(idCentroHospitalario)				REFERENCES CentroHospitalario(idCentroHospitalario),
	FOREIGN KEY(cedula)								REFERENCES Persona(cedula)
)
GO


/****** Object:  Table PacienteEstado ******/
CREATE TABLE PacienteEstado(
	idPacienteEstado					INT	IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	idPaciente							INT										NOT NULL,
	estado								VARCHAR(30)								NOT NULL,
	FOREIGN KEY(idPaciente)				REFERENCES Paciente(idPaciente),
)
GO


/****** Object:  Table PersonaPatologia ******/
CREATE TABLE PersonaPatologia(
	idPersonaPatologia			INT IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	cedula						VARCHAR(30)								NOT NULL,
	idPatologia					INT										NOT NULL,
	FOREIGN KEY(cedula)								REFERENCES Persona(cedula),
	FOREIGN KEY(idPatologia)						REFERENCES Patologia(idPatologia)
)
GO


/****** Object:  Table PacienteMedicamento ******/
CREATE TABLE PacienteMedicamento(
	idPacienteMedicamento		INT IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	idMedicamento				INT										NOT NULL,
	idPaciente					INT										NOT NULL,
	FOREIGN KEY(idMedicamento)						REFERENCES Medicamento(idMedicamento),
	FOREIGN KEY(idPaciente)							REFERENCES Paciente(idPaciente)
)
GO


/****** Object:  Table UbicacionMedidaContencion ******/
CREATE TABLE UbicacionMedidaContencion(
	idUbicacionMedidaContencion	INT	IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	idUbicacion					INT										NOT NULL,
	idMedidaContencion			INT										NOT NULL,
	fechaInicio					DATE									NOT NULL,
	FOREIGN KEY(idUbicacion)						REFERENCES Ubicacion(idUbicacion),
	FOREIGN KEY(idMedidaContencion)					REFERENCES MedidaContencion(idMedidaContencion)
)
GO


/****** Object:  Table UbicacionMedidaSanitaria ******/
CREATE TABLE UbicacionMedidaSanitaria(
	idUbicacionMedidaSanitaria	INT	IDENTITY (1, 1) PRIMARY KEY			NOT NULL,
	idUbicacion					INT										NOT NULL,
	idMedidaSanitaria			INT										NOT NULL,
	estado						VARCHAR(20)								NOT NULL,
	fechaInicio					DATE									NOT NULL,
	fechaFinal					DATE									NULL,
	FOREIGN KEY(idUbicacion)						REFERENCES Ubicacion(idUbicacion),
	FOREIGN KEY(idMedidaSanitaria)					REFERENCES MedidaSanitaria(idMedidaSanitaria)
)
GO

