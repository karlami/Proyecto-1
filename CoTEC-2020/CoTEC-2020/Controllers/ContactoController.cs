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
    public class ContactoController : ApiController
    {
        [HttpGet]
        [Route("api/GetContactos")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaContactos = db.Database.SqlQuery<Contacto>("SELECT idContacto, correo, " +
                    "idPaciente, cedula " +
                    "FROM Contacto").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaContactos);
            }
        }

        [HttpGet]
        [Route("api/GetContacto/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var contacto = db.Database.SqlQuery<Contacto>("UPDATE Contacto" +
                    "SET idContacto, correo, idPaciente, cedula" +
                    "FROM Contacto" +
                    "WHERE idContacto = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, contacto);
            }
        }

        [HttpPost]
        [Route("api/PostContactos")]
        public HttpResponseMessage Post([FromBody] Contacto value)
        {

            using (var db = new CoTECEntities())
            {
                db.Database.SqlQuery<Contacto>("INSERT INTO Contacto" +
                   "idContacto, correo, idPaciente, cedula" +
                    "VALUES (" + value.idContacto + "," + value.correo + "," + value.idPaciente + "," + value.cedula + ")");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpPut]
        [Route("api/PutContactos")]
        public HttpResponseMessage Put([FromBody] Contacto value)
        {
            using (var db = new CoTECEntities())
            {
                db.Database.SqlQuery<Contacto>("UPDATE Contacto" +
                    "SET idContacto = " + value.idContacto +
                    ", correo = " + value.correo +
                    ", idPaciente = " + value.idPaciente +
                    ", cedula = " + value.cedula +
                    "WHERE idContacto = " + value.idContacto);

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpDelete]
        [Route("api/DeleteContactos/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                db.Database.SqlQuery<Contacto>("DELETE" +
                    "FROM Contacto " +
                    "WHERE idContacto = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }


        }
    }
}
