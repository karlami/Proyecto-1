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
                var listaPacientes = db.Database.SqlQuery<vPaciente>("SELECT *" +
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
                SqlParameter parametro = new SqlParameter("@id", id);
                var paciente = db.Database.SqlQuery<Paciente>("SELECT idPaciente, " +
                    "internado, uci, fechaIngreso, idCentroHospitalario, cedula " +
                    "FROM Paciente" +
                    " WHERE idPaciente = @id");

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
        public HttpResponseMessage Post([FromBody] Paciente value)
        {

            using (var db = new CoTECEntities())
            {
                db.Database.ExecuteSqlCommand("INSERT INTO Paciente " +
                   "(internado, uci, fechaIngreso, idCentroHospitalario, cedula)" +
                    " VALUES (" + value.internado + "," +
                    value.uci + "," + value.fechaIngreso + "," + value.idCentroHospitalario + 
                    value.cedula + ")");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        /*
        Update de un Paciente
        Recibe toda la información del Paciente a modificar
        Actualiza la tupla que el idPaciente indique
        */
        [HttpPut]
        [Route("api/PutPacientes")]
        public HttpResponseMessage Put([FromBody] Paciente value)
        {
            using (var db = new CoTECEntities())
            {
                db.Database.ExecuteSqlCommand("UPDATE Paciente" +
                    " SET internado = " + value.internado +
                    ", uci = " + value.uci +
                    ", fechaIngreso = " + value.fechaIngreso +
                    ", idCentroHospitalario = " + value.idCentroHospitalario +
                    ", cedula = " + value.cedula +
                    " WHERE idPaciente = " + value.idPaciente);

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        /*
        Delete de un Paciente
        Recibe el id del Paciente a eliminar
        Elimina la tupla con el id indicado
        */
        [HttpDelete]
        [Route("api/DeletePacientes/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                db.Database.ExecuteSqlCommand("DELETE" +
                    " FROM Paciente " +
                    " WHERE idPaciente = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }


        }
    }
}