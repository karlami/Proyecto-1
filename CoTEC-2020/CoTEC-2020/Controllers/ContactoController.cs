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
                var listaContactos = db.Database.SqlQuery<vContacto>("SELECT NombreCompleto, Cedula, " +
                    "Edad, Nacionalidad, Ubicacion, Patologias, Correo, IdContacto " +
                    "FROM viewContacto").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaContactos);
            }
        }

        [HttpGet]
        [Route("api/GetContacto/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                var contacto = db.Database.SqlQuery<Contacto>("SELECT NombreCompleto, Cedula, " +
                    "Edad, Nacionalidad, Ubicacion, Patologias, Correo, IdContacto " +
                    "FROM viewContacto" +
                    " WHERE idContacto = " + id).FirstOrDefault();

                return this.Request.CreateResponse(HttpStatusCode.OK, contacto);
            }
        }

        [HttpPost]
        [Route("api/PostContactos")]
        public HttpResponseMessage Post()
        {

            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyContacto " +
                    "@cedula = '" + "11111122" +
                    "' ,@nombre = '" + "Ruben" +
                    "' ,@primerApellido = '" + "Ruben" +
                    "' ,@segundoApellido = '" + "Ruben" +
                    "' ,@nacionalidad = '" + "117390700" +
                    "' ,@fechaNacimiento = '" + "2020-04-17" +
                    "' ,@idUbicacion = '" + 198 +
                    "' ,@idContacto = '" + 7 +
                    "' ,@correo = '" + "rubsalas@hotmail.com" +
                    "' ,@idPaciente = '" + 13 +
                    "' ,@statementType = '" + "Insert" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpPut]
        [Route("api/PutContactos/{cedula}")]
        public HttpResponseMessage Put()
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyContacto " +
                    "@cedula = '" + "1111111" +
                    "' ,@nombre = '" + "Ruben" +
                    "' ,@primerApellido = '" + "Cascodo" +
                    "' ,@segundoApellido = '" + "Verno" +
                    "' ,@nacionalidad = '" + "117390700" +
                    "' ,@fechaNacimiento = '" + "2020-04-17" +
                    "' ,@idUbicacion = '" + 198 +
                    "' ,@idContacto = '" + 7 +
                    "' ,@correo = '" + "rubsalas@hotmail.com" +
                    "' ,@idPaciente = '" + 13 +
                    "' ,@statementType = '" + "Update" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpDelete]
        [Route("api/DeleteContactos/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyContacto " +
                    "@cedula = '" + id +
                    "' ,@nombre = '" + "Ruben" +
                    "' ,@primerApellido = '" + "Ruben" +
                    "' ,@segundoApellido = '" + "Ruben" +
                    "' ,@nacionalidad = '" + "117390700" +
                    "' ,@fechaNacimiento = '" + "2020-04-17" +
                    "' ,@idUbicacion = '" + 198 +
                    "' ,@idContacto = '" + 7 +
                    "' ,@correo = '" + "rubsalas@hotmail.com" +
                    "' ,@idPaciente = '" + 13 +
                    "' ,@statementType = '" + "Delete" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }


        }
    }
}
