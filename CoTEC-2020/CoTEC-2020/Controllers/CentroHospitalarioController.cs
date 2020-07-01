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
                    "capacidad, capacidadUci, contacto, director, region, pais " +
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
                    "capacidad, capacidadUci, contacto, director, region, pais " +
                    "FROM CentroHospitalario " +
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
                var status = db.Database.ExecuteSqlCommand("INSERT INTO CentroHospitalario " +
                   "(nombre, capacidad, capacidadUci, contacto, director, idUbicacion) " +
                    "VALUES ('" + value.nombre + "','" + value.capacidad + "','" +
                    value.capacidadUci + "','" + value.contacto + "','" + value.director + "','" +
                    value.region + "','" + value.pais + "')");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpPut]
        [Route("api/PutCentroHospitalarios")]
        public HttpResponseMessage Put([FromBody] CentroHospitalario value)
        {
            using (var db = new CoTECEntities())
            {
                db.Database.ExecuteSqlCommand("UPDATE CentroHospitalario " +
                    "SET nombre = " + value.nombre +
                    ", capacidad = " + value.capacidad +
                    ", capacidadUci = " + value.capacidadUci +
                    ", contacto = " + value.contacto +
                    ", director = " + value.director +
                    ", region = " + value.region +
                    ", pais = " + value.pais +
                    " WHERE idCentroHospitalario = " + value.idCentroHospitalario);

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
                db.Database.ExecuteSqlCommand("DELETE" +
                    " FROM CentroHospitalario " +
                    " WHERE idCentroHospitalario = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }


        }
    }
}