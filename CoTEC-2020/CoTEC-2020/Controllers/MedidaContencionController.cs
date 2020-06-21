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
    public class MedidaContencionController : ApiController
    {
        [HttpGet]
        [Route("api/GetMedidaContenciones")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaMedidaContencions = db.Database.SqlQuery<MedidaContencion>("SELECT idMedidaContencion, medida, " +
                    "fechaInicio " +
                    "FROM MedidaContencion").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaMedidaContencions);
            }
        }

        [HttpGet]
        [Route("api/GetMedidaContencion/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var paciente = db.Database.SqlQuery<MedidaContencion>("SELECT idMedidaContencion, medida, " +
                    "fechaInicio " +
                    "FROM MedidaContencion" +
                    " WHERE idMedidaContencion = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, paciente);
            }
        }

        [HttpPost]
        [Route("api/PostMedidaContenciones")]
        public HttpResponseMessage Post([FromBody] MedidaContencion value)
        {

            using (var db = new CoTECEntities())
            {
                db.Database.ExecuteSqlCommand("INSERT INTO MedidaContencion" +
                   " (medida, fechaInicio)" +
                    " VALUES (" + value.medida + "," + value.fechaInicio + ")");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpPut]
        [Route("api/PutMedidaContenciones")]
        public HttpResponseMessage Put([FromBody] MedidaContencion value)
        {
            using (var db = new CoTECEntities())
            {
                db.Database.ExecuteSqlCommand("UPDATE MedidaContencion" +
                    " SET medida = " + value.medida +
                    ", fechaInicio = " + value.fechaInicio +
                    " WHERE idMedidaContencion = " + value.idMedidaContencion);

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpDelete]
        [Route("api/DeleteMedidaContenciones/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                db.Database.ExecuteSqlCommand("DELETE" +
                    " FROM MedidaContencion " +
                    " WHERE idMedidaContencion = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }


        }
    }
}