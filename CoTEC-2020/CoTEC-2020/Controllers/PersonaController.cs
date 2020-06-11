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
        public HttpResponseMessage GetPersonas()
        {
            using (var db = new CoTECEntities())
            {
                var listaPersonas = db.Database.SqlQuery<Persona>("SELECT cedula, nombre, " +
                    "primerApellido, segundoApellido, fechaNacimiento, idUbicacion FROM Persona").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaPersonas);
            }
        }

        [HttpGet]
        [Route("api/GetPersona/{id}")]
        public HttpResponseMessage GetPersonas(int id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var persona = db.Database.SqlQuery<Persona>("SELECT cedula, nombre, " +
                    "primerApellido, segundoApellido, fechaNacimiento, idUbicacion " +
                    "FROM Persona" +
                    "WHERE cedula = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, persona);
            }
        }


    }
}
