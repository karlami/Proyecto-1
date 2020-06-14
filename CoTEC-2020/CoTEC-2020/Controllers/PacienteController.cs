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
        [HttpGet]
        [Route("api/GetPacientes")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaPacientes = db.Database.SqlQuery<Paciente>("SELECT idPaciente, estado, " +
                    "internado, uci, fechaIngreso, idCentroHospitalario, cedula " +
                    "FROM Paciente").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaPacientes);
            }
        }

        [HttpGet]
        [Route("api/GetPaciente/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var paciente = db.Database.SqlQuery<Paciente>("SELECT idPaciente, estado, " +
                    "internado, uci, fechaIngreso, idCentroHospitalario, cedula " +
                    "FROM Paciente" +
                    "WHERE idPaciente = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, paciente);
            }
        }

        [HttpPost]
        [Route("api/PostPacientes")]
        public HttpResponseMessage Post([FromBody] Paciente value)
        {

            using (var db = new CoTECEntities())
            {
                db.Database.SqlQuery<Paciente>("INSERT INTO Paciente" +
                   "idPaciente, estado, internado, uci, fechaIngreso, idCentroHospitalario, cedula" +
                    "VALUES (" + value.idPaciente + "," + value.estado + "," + value.internado + "," +
                    value.uci + "," + value.fechaIngreso + "," + value.idCentroHospitalario + 
                    value.cedula + ")");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpPut]
        [Route("api/PutPacientes")]
        public HttpResponseMessage Put([FromBody] Paciente value)
        {
            using (var db = new CoTECEntities())
            {
                db.Database.SqlQuery<Paciente>("UPDATE Paciente" +
                    "SET idPaciente = " + value.idPaciente +
                    ", estado= " + value.estado +
                    ", internado= " + value.internado +
                    ", uci= " + value.uci +
                    ", fechaIngreso= " + value.fechaIngreso +
                    ", idCentroHospitalario= " + value.idCentroHospitalario +
                    ", cedula= " + value.cedula +
                    "WHERE idPaciente = " + value.idPaciente);

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpDelete]
        [Route("api/DeletePacientes/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                db.Database.SqlQuery<Paciente>("DELETE" +
                    "FROM Paciente " +
                    "WHERE idPaciente = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }


        }
    }
}