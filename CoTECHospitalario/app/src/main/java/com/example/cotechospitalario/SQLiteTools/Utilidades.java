package com.example.cotechospitalario.SQLiteTools;

import android.database.sqlite.SQLiteDatabase;
import androidx.appcompat.app.AppCompatActivity;


public class Utilidades extends AppCompatActivity {
    //Constantes para la tabla Ubicacion de la base de datos
    public static final String NOMBRE_TABLA_UBICACION = "Ubicacion";
    public static final String UBICACION_CAMPO_ID = "idUbicacion";
    public static final String UBICACION_CAMPO_CONTINENTE = "continente";
    public static final String UBICACION_CAMPO_PAIS = "pais";
    public static final String UBICACION_CAMPO_REGION = "region";

    public static final String TABLA_UBICACION = "CREATE TABLE "+NOMBRE_TABLA_UBICACION+"(" +
            UBICACION_CAMPO_ID + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            UBICACION_CAMPO_CONTINENTE + " VARCHAR(75)  NOT NULL," +
            UBICACION_CAMPO_PAIS + " VARCHAR(75)  NOT NULL," +
            UBICACION_CAMPO_REGION + " VARCHAR(75)  NOT NULL" +
            ")";

    //Constantes para la tabla MedidaSanitaria de la base de datos
    public static final String NOMBRE_TABLA_MEDIDA_SANITARIA = "Ubicacion";
    public static final String MEDIDA_SANITARIA_CAMPO_ID_MEDIDA = "idMedidaSanitaria";
    public static final String MEDIDA_SANITARIA_CAMPO_NOMBRE = "nombre";
    public static final String MEDIDA_SANITARIA_CAMPO_ESTADO = "estado";
    public static final String MEDIDA_SANITARIA_CAMPO_DESCRIPCION = "descripcion";
    public static final String MEDIDA_SANITARIA_CAMPO_FECHA_INICIO = "fechaInicio";
    public static final String MEDIDA_SANITARIA_CAMPO_FECHA_FINAL = "fechaFinal";

    public static final String TABLA_MEDIDA_SANITARIA = "CREATE TABLE "+NOMBRE_TABLA_MEDIDA_SANITARIA+"(" +
            MEDIDA_SANITARIA_CAMPO_ID_MEDIDA + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            MEDIDA_SANITARIA_CAMPO_NOMBRE + " VARCHAR(100) NOT NULL," +
            MEDIDA_SANITARIA_CAMPO_DESCRIPCION + " VARCHAR(300) NOT NULL," +
            MEDIDA_SANITARIA_CAMPO_ESTADO + " VARCHAR(20) NOT NULL," +
            MEDIDA_SANITARIA_CAMPO_FECHA_INICIO + " DATE NOT NULL," +
            MEDIDA_SANITARIA_CAMPO_FECHA_FINAL + " DATE NULL," +
            ")";

    //Constantes para la tabla Patologia de la base de datos
    public static final String NOMBRE_TABLA_PATOLOGIA = "Patologia";
    public static final String PATOLOGIA_CAMPO_ID = "idPatologia";
    public static final String PATOLOGIA_CAMPO_NOMBRE = "nombre";
    public static final String PATOLOGIA_CAMPO_DESCRIPCION = "descripcion";
    public static final String PATOLOGIA_CAMPO_SINTOMAS = "sintomas";
    public static final String PATOLOGIA_CAMPO_TRATAMIENTO = "tratamiento";

    public static final String TABLA_PATOLOGIA = "CREATE TABLE "+NOMBRE_TABLA_PATOLOGIA+"(" +
            PATOLOGIA_CAMPO_ID + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            PATOLOGIA_CAMPO_NOMBRE + "nombre VARCHAR(100) NOT NULL," +
            PATOLOGIA_CAMPO_DESCRIPCION + "descripcion VARCHAR(300) NOT NULL," +
            PATOLOGIA_CAMPO_SINTOMAS + "sintomas VARCHAR(300) NOT NULL," +
            PATOLOGIA_CAMPO_TRATAMIENTO + "tratamiento VARCHAR(300) NOT NULL," +
            ")";

    //Constantes para la tabla Medicamento de la base de datos
    public static final String NOMBRE_TABLA_MEDICAMENTO = "Medicamento";
    public static final String MEDICAMENTO_CAMPO_ID_MEDICAMENTO = "idMedicamento";
    public static final String MEDICAMENTO_CAMPO_NOMBRE = "nombre";
    public static final String MEDICAMENTO_CAMPO_DESCRIPCION = "descripcion";
    public static final String MEDICAMENTO_CAMPO_CASA_FARMACEUTICA = "casaFarmaceutica";

    public static final String TABLA_MEDICAMENTO = "CREATE TABLE "+NOMBRE_TABLA_MEDICAMENTO+"(" +
            MEDICAMENTO_CAMPO_ID_MEDICAMENTO + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            MEDICAMENTO_CAMPO_NOMBRE + " VARCHAR(100) NOT NULL," +
            MEDICAMENTO_CAMPO_DESCRIPCION + " VARCHAR(300) NOT NULL," +
            MEDICAMENTO_CAMPO_CASA_FARMACEUTICA + " VARCHAR(100) NOT NULL," +
            ")";

    //Constantes para la tabla Persona de la base de datos
    public static final String NOMBRE_TABLA_PERSONA = "Persona";
    public static final String PERSONA_CAMPO_CEDULA = "cedula";
    public static final String PERSONA_CAMPO_NOMBRE = "nombre";
    public static final String PERSONA_CAMPO_PRIMER_APELLIDO = "primerApellido";
    public static final String PERSONA_CAMPO_SEGUNDO_APELLIDO = "segundoApellido";
    public static final String PERSONA_CAMPO_NACIONALIDAD = "nacionalidad";
    public static final String PERSONA_CAMPO_FECHA_NACIMIENTO = "fechaNacimiento";
    public static final String PERSONA_CAMPO_ID_UBICACION = "idUbicacion";

    public static final String TABLA_PERSONA = "CREATE TABLE "+NOMBRE_TABLA_PERSONA+"(" +
            PERSONA_CAMPO_CEDULA + " VARCHAR(30) PRIMARY KEY NOT NULL," +
            PERSONA_CAMPO_NOMBRE + " VARCHAR(75)  NOT NULL," +
            PERSONA_CAMPO_PRIMER_APELLIDO + " VARCHAR(75)  NOT NULL," +
            PERSONA_CAMPO_SEGUNDO_APELLIDO + " VARCHAR(75)  NOT NULL," +
            PERSONA_CAMPO_NACIONALIDAD +  " VARCHAR(50)  NOT NULL," +
            PERSONA_CAMPO_FECHA_NACIMIENTO +  " DATE  NOT NULL," +
            PERSONA_CAMPO_ID_UBICACION +  " INT  NOT NULL," +
            "FOREIGN KEY("+PERSONA_CAMPO_ID_UBICACION+") REFERENCES "+NOMBRE_TABLA_UBICACION+"("+UBICACION_CAMPO_ID+")" +
            ")";

    //Constantes para la tabla CentroHospitalario de la base de datos
    public static final String NOMBRE_TABLA_CENTRO_HOSPITALARIO = "CentroHospitalario";
    public static final String CENTRO_HOSPITALARIO_CAMPO_ID = "idCentroHospitalario";
    public static final String CENTRO_HOSPITALARIO_CAMPO_NOMBRE = "nombre";
    public static final String CENTRO_HOSPITALARIO_CAMPO_CAPACIDAD = "capacidad";
    public static final String CENTRO_HOSPITALARIO_CAMPO_CAPACIDAD_UCI = "capacidadUci";
    public static final String CENTRO_HOSPITALARIO_CAMPO_CONTACTO = "contacto";
    public static final String CENTRO_HOSPITALARIO_CAMPO_DIRECTOR = "director";
    public static final String CENTRO_HOSPITALARIO_CAMPO_ID_UBICACION = "idUbicacion";

    public static final String TABLA_CENTRO_HOSPITALARIO = "CREATE TABLE CentroHospitalario(" +
            CENTRO_HOSPITALARIO_CAMPO_ID + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            CENTRO_HOSPITALARIO_CAMPO_NOMBRE + " VARCHAR(200) NOT NULL," +
            CENTRO_HOSPITALARIO_CAMPO_CAPACIDAD + " INT  NOT NULL," +
            CENTRO_HOSPITALARIO_CAMPO_CAPACIDAD_UCI + " INT  NOT NULL," +
            CENTRO_HOSPITALARIO_CAMPO_CONTACTO +  " VARCHAR(50)  NOT NULL," +
            CENTRO_HOSPITALARIO_CAMPO_DIRECTOR + " VARCHAR(30)  NOT NULL," +
            CENTRO_HOSPITALARIO_CAMPO_ID_UBICACION + " INT  NOT NULL," +
            "FOREIGN KEY("+CENTRO_HOSPITALARIO_CAMPO_DIRECTOR+") REFERENCES Persona("+PERSONA_CAMPO_CEDULA+")," +
            "FOREIGN KEY("+CENTRO_HOSPITALARIO_CAMPO_ID_UBICACION+") REFERENCES "+NOMBRE_TABLA_UBICACION+"("+UBICACION_CAMPO_ID+")" +
            ")";

    //Constantes para la tabla Contacto de la base de datos
    public static final String NOMBRE_TABLA_CONTACTO = "Contacto";
    public static final String TABLA_CONTACTO_CAMPO_ID_CONTACTO = "idContacto";
    public static final String TABLA_CONTACTO_CAMPO_CORREO = "correo";
    public static final String TABLA_CONTACTO_CAMPO_ID_PACIENTE = "idPaciente";
    public static final String TABLA_CONTACTO_CAMPO_CEDULA = "cedula";

    public static final String TABLA_CONTACTO = "CREATE TABLE "+NOMBRE_TABLA_CONTACTO+"(" +
            TABLA_CONTACTO_CAMPO_ID_CONTACTO + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            TABLA_CONTACTO_CAMPO_CORREO + " VARCHAR(100) NOT NULL," +
            TABLA_CONTACTO_CAMPO_ID_PACIENTE + " INT  NOT NULL," +
            TABLA_CONTACTO_CAMPO_CEDULA + " VARCHAR(30)  NOT NULL," +
            "FOREIGN KEY("+TABLA_CONTACTO_CAMPO_CEDULA+")  REFERENCES "+NOMBRE_TABLA_PERSONA+"("+PERSONA_CAMPO_CEDULA+")" +
            ")";

    //Constantes para la tabla Paciente de la base de datos
    public static final String NOMBRE_TABLA_PACIENTE = "Paciente";
    public static final String TABLA_PACIENTE_CAMPO_ID_PACIENTE = "idPaciente";
    public static final String TABLA_PACIENTE_CAMPO_INTERNADO = "internado";
    public static final String TABLA_PACIENTE_CAMPO_UCI = "uci";
    public static final String TABLA_PACIENTE_CAMPO_FECHA_INGRES = "fechaIngreso";
    public static final String TABLA_PACIENTE_CAMPO_ID_CENTRO_HOSPI = "idCentroHospitalario";
    public static final String TABLA_PACIENTE_CAMPO_CEDULA = "cedula";

    public static final String TABLA_PACIENTE = "CREATE TABLE "+NOMBRE_TABLA_PACIENTE+"(" +
            TABLA_PACIENTE_CAMPO_ID_PACIENTE + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            TABLA_PACIENTE_CAMPO_INTERNADO + " VARCHAR(10)  NOT NULL," +
            TABLA_PACIENTE_CAMPO_UCI + " VARCHAR(10)  NOT NULL," +
            TABLA_PACIENTE_CAMPO_FECHA_INGRES + " DATE  NOT NULL," +
            TABLA_PACIENTE_CAMPO_ID_CENTRO_HOSPI + " INT  NOT NULL," +
            TABLA_PACIENTE_CAMPO_CEDULA + " VARCHAR(30)  NOT NULL," +
            "FOREIGN KEY("+TABLA_PACIENTE_CAMPO_ID_CENTRO_HOSPI+") REFERENCES " +
            "CentroHospitalario("+CENTRO_HOSPITALARIO_CAMPO_ID+")," +
            "FOREIGN KEY("+TABLA_PACIENTE_CAMPO_CEDULA+")  REFERENCES "+NOMBRE_TABLA_PERSONA+"("+PERSONA_CAMPO_CEDULA+")" +
            ")";

    //Constantes para la tabla PacienteEstado de la base de datos
    public static final String NOMBRE_TABLA_PACIENTE_ESTADO = "PacienteEstado";
    public static final String PACIENTE_ESTADO_CAMPO_ID_PACIENTE_ESTADO = "idPacienteEstado";
    public static final String PACIENTE_ESTADO_CAMPO_ID_PACIENTE = "idPaciente";
    public static final String PACIENTE_ESTADO_CAMPO_ID_ESTADO = "estado";

    public static final String TABLA_PACIENTE_ESTADO = "CREATE TABLE "+NOMBRE_TABLA_PACIENTE_ESTADO+"(" +
            PACIENTE_ESTADO_CAMPO_ID_PACIENTE_ESTADO + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            PACIENTE_ESTADO_CAMPO_ID_PACIENTE +   " INT  NOT NULL," +
            PACIENTE_ESTADO_CAMPO_ID_ESTADO + "  VARCHAR(30)  NOT NULL," +
            "FOREIGN KEY("+PACIENTE_ESTADO_CAMPO_ID_PACIENTE+") REFERENCES "+NOMBRE_TABLA_PACIENTE+"("+TABLA_PACIENTE_CAMPO_ID_PACIENTE+")," +
            ")";

    //Constantes para la tabla PersonaPatologia de la base de datos
    public static final String NOMBRE_TABLA_PERSONA_PATOLOGIA = "PersonaPatologia";
    public static final String TABLA_PERSONA_PATOLOGIA_CAMPO_ID_PERSONA_PATOLOGIA = "idPersonaPatologia";
    public static final String TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA = "cedula";
    public static final String TABLA_PERSONA_PATOLOGIA_CAMPO_ID_PATOLOGIA = "idPatologia";

    public static final String TABLA_PERSONA_PATOLOGIA = "CREATE TABLE "+NOMBRE_TABLA_PERSONA_PATOLOGIA+"(" +
            TABLA_PERSONA_PATOLOGIA_CAMPO_ID_PERSONA_PATOLOGIA + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA + " VARCHAR(30)  NOT NULL," +
            TABLA_PERSONA_PATOLOGIA_CAMPO_ID_PATOLOGIA + " INT  NOT NULL," +
            "FOREIGN KEY("+TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA+")  REFERENCES "+NOMBRE_TABLA_PERSONA+"("+PERSONA_CAMPO_CEDULA+")," +
            "FOREIGN KEY("+TABLA_PERSONA_PATOLOGIA_CAMPO_ID_PATOLOGIA+") REFERENCES "+NOMBRE_TABLA_PATOLOGIA+"("+PATOLOGIA_CAMPO_ID+")" +
            ")";

    //Constantes para la tabla PacienteMedicamento de la base de datos
    public static final String NOMBRE_TABLA_PACIENTE_MEDICAMENTO = "PacienteMedicamento";
    public static final String PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE_MEDICAMENTO = "idPacienteMedicamento";
    public static final String PACIENTE_MEDICAMENTO_CAMPO_ID_MEDICAMENTO = "idMedicamento";
    public static final String PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE = "idPaciente";

    public static final String TABLA_PACIENTE_MEDICAMENTO = "CREATE TABLE "+NOMBRE_TABLA_PACIENTE_MEDICAMENTO+"(" +
            PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE_MEDICAMENTO + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            PACIENTE_MEDICAMENTO_CAMPO_ID_MEDICAMENTO + " INT  NOT NULL," +
            PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE + " INT  NOT NULL," +
            "FOREIGN KEY("+PACIENTE_MEDICAMENTO_CAMPO_ID_MEDICAMENTO+") REFERENCES "+
            NOMBRE_TABLA_MEDICAMENTO+"("+MEDICAMENTO_CAMPO_ID_MEDICAMENTO+")," +
            "FOREIGN KEY("+PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE+") REFERENCES "+
            NOMBRE_TABLA_PACIENTE+"("+PACIENTE_ESTADO_CAMPO_ID_PACIENTE+")" +
            ")";


    //Constantes para la tabla UbicacionMedidaSanitaria de la base de datos
    public static final String NOMBRE_TABLA_UBICACION_MEDIDA_SANITARIA = "UbicacionMedidaSanitaria";
    public static final String UBICACION_MEDIDA_SANITARIA_CAMPO_ID = "idUbicacionMedidaSanitaria";
    public static final String UBICACION_MEDIDA_SANITARIA_CAMPO_ID_UBICACION = "idUbicacion";
    public static final String UBICACION_MEDIDA_SANITARIA_CAMPO_ID_MEDIDA = "idMedidaSanitaria";

    public static final String TABLA_UBICACION_MEDIDA_SANITARIA = "CREATE TABLE UbicacionMedidaSanitaria(" +
            UBICACION_MEDIDA_SANITARIA_CAMPO_ID + " INT IDENTITY (1, 1) PRIMARY KEY NOT NULL," +
            UBICACION_MEDIDA_SANITARIA_CAMPO_ID_UBICACION + " INT  NOT NULL," +
            UBICACION_MEDIDA_SANITARIA_CAMPO_ID_MEDIDA + " INT  NOT NULL," +
            "FOREIGN KEY("+UBICACION_MEDIDA_SANITARIA_CAMPO_ID_UBICACION+") REFERENCES "+
            NOMBRE_TABLA_UBICACION+"("+UBICACION_CAMPO_ID+")," +
            "FOREIGN KEY("+UBICACION_MEDIDA_SANITARIA_CAMPO_ID_MEDIDA+") REFERENCES "+
            NOMBRE_TABLA_MEDIDA_SANITARIA+"("+MEDIDA_SANITARIA_CAMPO_ID_MEDIDA+")" +
            ")";


}
