using CoTEC_2020.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CoTEC_2020.Controllers
{
    public class PacienteController : ApiController
    {
        /*
        Select para Paciente
        Obtiene la siguiente información de los Pacientes:
        idPaciente, internado, UCI, fechaIngreso, idCentroHospitalario, cedula.
        */
        [HttpGet]
        [Route("api/GetPacientes")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaPacientes = db.Database.SqlQuery<vPaciente>("SELECT NombreCompleto, Cedula, Edad, " +
                    "Nacionalidad, Region, Patologias, Estado, CentroHospitalario, Medicamentos, Internado, UCI, IdPaciente " +
                    "FROM viewPaciente").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaPacientes);
            }
        }

        /*
        Select para un Paciente en espcífico
        Recibe el idPaciente y lo usa en la cláusula WHERE
        Obtiene la siguiente información del Paciente:
        idPaciente, internado, UCI, fechaIngreso, idCentroHospitalario, cedula.
        */
        [HttpGet]
        [Route("api/GetPaciente/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                var paciente = db.Database.SqlQuery<vPaciente>("SELECT NombreCompleto, Cedula, Edad, " +
                    "Nacionalidad, Region, Patologias, Estado, CentroHospitalario, Medicamentos, Internado, UCI, IdPaciente " +
                    "FROM viewPaciente" +
                    " WHERE idPaciente = " + id).FirstOrDefault();

                return this.Request.CreateResponse(HttpStatusCode.OK, paciente);
            }
        }

        /*
        Insert de un Paciente
        Recibe toda la información del nuevo Paciente
        Crea una tupla en Paciente con los valores ingresados
        */
        [HttpPost]
        [Route("api/PostPacientes")]
        public HttpResponseMessage Post([FromBody] pPaciente value)
        {

            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyPaciente" +
                    " @cedula = '" + value.cedula +
                    "' ,@nombre = '" + value.nombre +
                    "' ,@primerApellido = '" + value.primerApellido +
                    "' ,@segundoApellido = '" + value.segundoApellido +
                    "' ,@nacionalidad = '" + value.nacionalidad +
                    "' ,@fechaNacimiento = '" + value.fechaNacimiento +
                    "' ,@region = '" + value.region +
                    "' ,@patologia = '" + value.patologias +
                    "' ,@idPaciente = '" + value.idPaciente +
                    "' ,@internado = '" + value.internado +
                    "' ,@uci = '" + value.uci +
                    "' ,@fechaIngreso = '" + value.fechaIngreso +
                    "' ,@idEstadoPaciente = '" + value.estado +
                    "' ,@idCentroHospitalario = '" + value.idCentroHospitalario +
                    "' ,@medicamento = '" + value.medicacion +
                    "' ,@statementType = '" + "Insert" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }
        

        /*
        Update de un Paciente
        Recibe toda la información del Paciente a modificar
        Actualiza la tupla que el idPaciente indique
        */
        [HttpPut]
        [Route("api/PutPacientes")]
        public HttpResponseMessage Put([FromBody] pPaciente value)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyPaciente" +
                    " @cedula = '" + value.cedula +
                    "' ,@nombre = '" + value.nombre +
                    "' ,@primerApellido = '" + value.primerApellido +
                    "' ,@segundoApellido = '" + value.segundoApellido +
                    "' ,@nacionalidad = '" + value.nacionalidad +
                    "' ,@fechaNacimiento = '" + value.fechaNacimiento +
                    "' ,@region = '" + value.region +
                    "' ,@patologia = '" + value.patologias +
                    "' ,@idPaciente = '" + value.idPaciente +
                    "' ,@internado = '" + value.internado +
                    "' ,@uci = '" + value.uci +
                    "' ,@fechaIngreso = '" + value.fechaIngreso +
                    "' ,@idEstadoPaciente = '" + value.estado +
                    "' ,@idCentroHospitalario = '" + value.idCentroHospitalario +
                    "' ,@medicamento = '" + value.medicacion +
                    "' ,@statementType = '" + "Update" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        /*
        Delete de un Paciente
        Recibe el id del Paciente a eliminar
        Elimina la tupla con el id indicado
        */
        [HttpDelete]
        [Route("api/DeletePacientes/{id}")]
        public HttpResponseMessage Delete(int id)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyPaciente" +
                    " @cedula = '" + "" +
                    "' ,@nombre = '" + "" +
                    "' ,@primerApellido = '" + "" +
                    "' ,@segundoApellido = '" + "" +
                    "' ,@nacionalidad = '" + "" +
                    "' ,@fechaNacimiento = '" + "" +
                    "' ,@region = '" + "" +
                    "' ,@patologia = '" + 0 +
                    "' ,@idPaciente = '" + id +
                    "' ,@internado = '" + "" +
                    "' ,@uci = '" + "" +
                    "' ,@fechaIngreso = '" + "" +
                    "' ,@idEstadoPaciente = '" + "" +
                    "' ,@idCentroHospitalario = '" + 0 +
                    "' ,@medicamento = '" + 0 +
                    "' ,@statementType = '" + "Delete" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }


        }
    }
}