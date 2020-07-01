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
    public class UbicacionController : ApiController
    {
        [HttpGet]
        [Route("api/GetUbicaciones")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaUbicaciones = db.Database.SqlQuery<Ubicacion>("SELECT idUbicacion, continente, " +
                    "pais, region " +
                    "FROM Ubicacion").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaUbicaciones);
            }
        }

        [HttpGet]
        [Route("api/GetUbicacion/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var contacto = db.Database.SqlQuery<Ubicacion>("SELECT idUbicacion, continente, " +
                    "pais, region " +
                    "FROM Ubicacion" +
                    " WHERE idUbicacion = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, contacto);
            }
        }

        [HttpPost]
        [Route("api/PostUbicaciones")]
        public HttpResponseMessage Post([FromBody] Ubicacion value)
        {

            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("INSERT INTO Ubicacion" +
                   " (continente, pais, region)" +
                    " VALUES ('" + value.continente + "','" + value.pais + "','" + value.region + "')");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpPut]
        [Route("api/PutUbicaciones")]
        public HttpResponseMessage Put([FromBody] Ubicacion value)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("UPDATE Ubicacion" +
                    " SET continente = '" + value.continente +
                    "', pais = '" + value.pais +
                    "', region = '" + value.region +
                    "' WHERE idUbicacion = ('" + value.idUbicacion + "')");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpDelete]
        [Route("api/DeleteUbicaciones/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var status = db.Database.ExecuteSqlCommand("DELETE" +
                    " FROM Ubicacion " +
                    " WHERE idUbicacion = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }


        }
    }
}