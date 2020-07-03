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
    public class CentroHospitalarioController : ApiController
    {
        [HttpGet]
        [Route("api/GetCentroHospitalarios")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaCentroHospitalarios = db.Database.SqlQuery<vCentroHospitalario>("SELECT Ubicacion, Nombre," +
                    " Capacidad, CapacidadUCI, Director, Contacto, IdCentroHospitalario " +
                    "FROM viewCentroHospitalario").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaCentroHospitalarios);
            }
        }

        [HttpGet]
        [Route("api/GetCentroHospitalario/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                var centro = db.Database.SqlQuery<vCentroHospitalario>("SELECT Ubicacion, Nombre," +
                    " Capacidad, CapacidadUCI, Director, Contacto, IdCentroHospitalario " +
                    "FROM viewCentroHospitalario " +
                    "WHERE idCentroHospitalario = " + id).FirstOrDefault();

                return this.Request.CreateResponse(HttpStatusCode.OK, centro);
            }
        }

        [HttpPost]
        [Route("api/PostCentroHospitalarios")]
        public HttpResponseMessage Post([FromBody] pCentroHospitalario value)
        {

            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyCentroHospitalario " +
                    "@idCentroHospitalario = '" + value.idCentroHospitalario +
                    "' ,@nombre = '" + value.nombre +
                    "' ,@capacidad = '" + value.capacidad +
                    "' ,@capacidadUci = '" + value.capacidadUci +
                    "' ,@contacto = '" + value.contacto +
                    "' ,@director = '" + value.director +
                    "' ,@pais = '" + value.pais +
                    "' ,@region = '" + value.region +
                    "' ,@statementType = '" + "Insert" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpPut]
        [Route("api/PutCentroHospitalarios")]
        public HttpResponseMessage Put([FromBody] pCentroHospitalario value)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyCentroHospitalario " +
                    "@idCentroHospitalario = '" + value.idCentroHospitalario +
                    "' ,@nombre = '" + value.nombre +
                    "' ,@capacidad = '" + value.capacidad +
                    "' ,@capacidadUci = '" + value.capacidadUci +
                    "' ,@contacto = '" + value.contacto +
                    "' ,@director = '" + value.director +
                    "' ,@pais = '" + value.pais +
                    "' ,@region = '" + value.region +
                    "' ,@statementType = '" + "Update" + "'; ");


                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpDelete]
        [Route("api/DeleteCentroHospitalarios/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyCentroHospitalario " +
                    "@idCentroHospitalario = '" + id +
                    "' ,@nombre = '" + "" +
                    "' ,@capacidad = '" + 0 +
                    "' ,@capacidadUci = '" + 0 +
                    "' ,@contacto = '" + 0 +
                    "' ,@director = '" + "" +
                    "' ,@pais = '" + "" +
                    "' ,@region = '" + "" +
                    "' ,@statementType = '" + "Delete" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }


        }
    }
}