USE [CoTEC-2020];
GO

CREATE PROCEDURE UpdateCentroHospitalario(
@idCentroHospitalario INT,
@nombre VARCHAR(200),
@capacidad INT,
@capacidadUci INT, 
@contacto VARCHAR(50),
@director VARCHAR(30),
@idUbicacion INT
)                                
AS
BEGIN  
UPDATE CentroHospitalario  
SET 
nombre = @nombre,  
capacidad = @capacidad,  
capacidadUci = @capacidadUci,
contacto = @contacto,
director = @director,
idUbicacion = @idUbicacion
WHERE  idCentroHospitalario = @idCentroHospitalario AND @capacidadUci <= @capacidad
IF @capacidadUci > @capacidad
    BEGIN
		THROW 50001, 'No se permite que la capacidad UCI sea mayor a la capacidad general',1;
	END  
END;



/*
EXEC UpdateCentroHospitalario4
@idCentroHospitalario = 1,  
@nombre = 'Scripps Memorial Hospital of La Jolla',
@capacidad = 173,
@capacidadUci = 177, 
@contacto = '(506) 123456',
@director = '759815361',
@idUbicacion = 2298; */