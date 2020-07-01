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
    public class MedidaSanitariaController : ApiController
    {
        [HttpGet]
        [Route("api/GetMedidaSanitarias")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaMedidaSanitarias = db.Database.SqlQuery<MedidaSanitaria>("SELECT idMedidaSanitaria, nombre, " +
                    "descripcion, estado, fechaInicio, fechaFinal " +
                    "FROM MedidaSanitaria").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaMedidaSanitarias);
            }
        }

        [HttpGet]
        [Route("api/GetMedidaSanitaria/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var paciente = db.Database.SqlQuery<MedidaSanitaria>("SELECT idMedidaSanitaria, nombre, " +
                    "descripcion, estado, fechaInicio, fechaFinal " +
                    "FROM MedidaSanitaria" +
                    " WHERE idMedidaSanitaria = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, paciente);
            }
        }

        [HttpPost]
        [Route("api/PostMedidaSanitarias")]
        public HttpResponseMessage Post([FromBody] MedidaSanitaria value)
        {

            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("INSERT INTO MedidaSanitaria" +
                   " (nombre, descripcion, estado, fechaInicio, fechaFinal)" +
                    " VALUES ('" + value.nombre + "','" + value.descripcion + "','" +
                    value.estado + "','" + value.fechaInicio + "','" + value.fechaFinal + "')");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpPut]
        [Route("api/PutMedidaSanitarias")]
        public HttpResponseMessage Put([FromBody] MedidaSanitaria value)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("UPDATE MedidaSanitaria" +
                    " SET nombre = '" + value.nombre +
                    "', descripcion = '" + value.descripcion +
                    "', estado = '" + value.estado +
                    "', fechaInicio = '" + value.fechaInicio +
                    "', fechaFinal = '" + value.fechaFinal +
                    "' WHERE idMedidaSanitaria = ('" + value.idMedidaSanitaria + "')");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpDelete]
        [Route("api/DeleteMedidaSanitarias/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var status = db.Database.ExecuteSqlCommand("DELETE" +
                    " FROM MedidaSanitaria " +
                    " WHERE idMedidaSanitaria = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }


        }
    }
}