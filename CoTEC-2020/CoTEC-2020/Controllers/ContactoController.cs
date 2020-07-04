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
                var contacto = db.Database.SqlQuery<vContacto>("SELECT NombreCompleto, Cedula, " +
                    "Edad, Nacionalidad, Ubicacion, Patologias, Correo, IdContacto " +
                    "FROM viewContacto" +
                    " WHERE idContacto = " + id).FirstOrDefault();

                return this.Request.CreateResponse(HttpStatusCode.OK, contacto);
            }
        }

        [HttpPost]
        [Route("api/PostContactos")]
        public HttpResponseMessage Post([FromBody] pContacto value)
        {

            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyContacto " +
                    "@cedula = '" + value.cedula +
                    "' ,@nombre = '" + value.nombre +
                    "' ,@primerApellido = '" + value.primerApellido +
                    "' ,@segundoApellido = '" + value.segundoApellido +
                    "' ,@nacionalidad = '" + value.nacionalidad +
                    "' ,@fechaNacimiento = '" + value.fechaNacimiento +
                    "' ,@idUbicacion = '" + value.idUbicacion +
                    "' ,@patologia = '" + value.patologias +
                    "' ,@idContacto = '" + value.idContacto +
                    "' ,@correo = '" + value.correo +
                    "' ,@idPaciente = '" + value.idPaciente +
                    "' ,@statementType = '" + "Insert" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpPut]
        [Route("api/PutContactos")]
        public HttpResponseMessage Put([FromBody] pContacto value)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyContacto " +
                    "@cedula = '" + value.cedula +
                    "' ,@nombre = '" + value.nombre +
                    "' ,@primerApellido = '" + value.primerApellido +
                    "' ,@segundoApellido = '" + value.segundoApellido +
                    "' ,@nacionalidad = '" + value.nacionalidad +
                    "' ,@fechaNacimiento = '" + value.fechaNacimiento +
                    "' ,@idUbicacion = '" + value.idUbicacion +
                    "' ,@patologia = '" + value.patologias +
                    "' ,@idContacto = '" + value.idContacto +
                    "' ,@correo = '" + value.correo +
                    "' ,@idPaciente = '" + value.idPaciente +
                    "' ,@statementType = '" + "Update" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpDelete]
        [Route("api/DeleteContactos/{id}")]
        public HttpResponseMessage Delete(int id)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("EXEC modifyContacto " +
                    "@cedula = '" + "" +
                    "' ,@nombre = '" + "" +
                    "' ,@primerApellido = '" + "" +
                    "' ,@segundoApellido = '" + "" +
                    "' ,@nacionalidad = '" + "" +
                    "' ,@fechaNacimiento = '" + "" +
                    "' ,@idUbicacion = '" + 0 +
                    "' ,@patologia = '" + 0 +
                    "' ,@idContacto = '" + id +
                    "' ,@correo = '" + "" +
                    "' ,@idPaciente = '" + 0 +
                    "' ,@statementType = '" + "Delete" + "'; ");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }


        }
    }
}
