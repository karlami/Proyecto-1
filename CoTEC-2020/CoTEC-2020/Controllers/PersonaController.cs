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
    public class PersonaController : ApiController
    {
        [HttpGet]
        [Route("api/GetPersonas")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaPersonas = db.Database.SqlQuery<Persona>("SELECT cedula, nombre, " +
                    "primerApellido, segundoApellido, nacionalidad, fechaNacimiento, idUbicacion " +
                    "FROM Persona").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaPersonas);
            }
        }

        [HttpGet]
        [Route("api/GetPersona/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var persona = db.Database.SqlQuery<Persona>("SELECT cedula, nombre, " +
                    "primerApellido, segundoApellido, nacionalidad, fechaNacimiento, idUbicacion " +
                    "FROM Persona" +
                    " WHERE cedula = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, persona);
            }
        }

        [HttpPost]
        [Route("api/PostPersonas")]
        public HttpResponseMessage Post([FromBody] Persona value)
        {

            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("INSERT INTO Persona" +
                   " (cedula, nombre, primerApellido, segundoApellido, nacionalidad, fechaNacimiento, idUbicacion)" +
                    " VALUES ('" + value.cedula + "','" + value.nombre + "','" + value.primerApellido + "','" +
                    value.segundoApellido + "','" + value.nacionalidad + "','" + value.fechaNacimiento + "','" + value.idUbicacion + "')");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpPut]
        [Route("api/PutPersonas")]
        public HttpResponseMessage Put([FromBody] Persona value)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("UPDATE Persona" +
                    " SET nombre = '" + value.nombre +
                    "', primerApellido = '" + value.primerApellido +
                    "', segundoApellido = '" + value.segundoApellido +
                    "', nacionalidad = '" + value.nacionalidad +
                    "', fechaNacimiento = '" + value.fechaNacimiento +
                    "', idUbicacion = '" + value.idUbicacion +
                    "' WHERE cedula = ('" + value.cedula + "')");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpDelete]
        [Route("api/DeletePersonas/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var status = db.Database.ExecuteSqlCommand("DELETE" +
                    " FROM Persona " +
                    " WHERE cedula = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }


        }
    }
}