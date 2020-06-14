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
                var listaCentroHospitalarios = db.Database.SqlQuery<CentroHospitalario>("SELECT idCentroHospitalario, nombre, " +
                    "capacidad, capacidadUci, director, idCentroHospitalario, idUbicacion " +
                    "FROM CentroHospitalario").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaCentroHospitalarios);
            }
        }

        [HttpGet]
        [Route("api/GetCentroHospitalario/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var centro = db.Database.SqlQuery<CentroHospitalario>("SELECT idCentroHospitalario, nombre, " +
                    "capacidad, capacidadUci, director, contacto, idUbicacion " +
                    "FROM CentroHospitalario" +
                    "WHERE idCentroHospitalario = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, centro);
            }
        }

        [HttpPost]
        [Route("api/PostCentroHospitalarios")]
        public HttpResponseMessage Post([FromBody] CentroHospitalario value)
        {

            using (var db = new CoTECEntities())
            {
                db.Database.SqlQuery<CentroHospitalario>("INSERT INTO CentroHospitalario" +
                   "idCentroHospitalario, nombre, capacidad, capacidadUci, director, contacto, idUbicacion" +
                    "VALUES (" + value.idCentroHospitalario + "," + value.nombre + "," + value.capacidad + "," +
                    value.capacidadUci + "," + value.director + "," + value.contacto +
                    value.idUbicacion + ")");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpPut]
        [Route("api/PutCentroHospitalarios")]
        public HttpResponseMessage Put([FromBody] CentroHospitalario value)
        {
            using (var db = new CoTECEntities())
            {
                db.Database.SqlQuery<CentroHospitalario>("UPDATE CentroHospitalario" +
                    "SET idCentroHospitalario = " + value.idCentroHospitalario +
                    ", nombre= " + value.nombre +
                    ", capacidad= " + value.capacidad +
                    ", capacidadUci= " + value.capacidadUci +
                    ", director= " + value.director +
                    ", contacto= " + value.contacto +
                    ", idUbicacion= " + value.idUbicacion +
                    "WHERE idCentroHospitalario = " + value.idCentroHospitalario);

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpDelete]
        [Route("api/DeleteCentroHospitalarios/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                db.Database.SqlQuery<CentroHospitalario>("DELETE" +
                    "FROM CentroHospitalario " +
                    "WHERE idCentroHospitalario = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }


        }
    }
}