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
    public class PatologiaController : ApiController
    {
        [HttpGet]
        [Route("api/GetPatologias")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaPatologias = db.Database.SqlQuery<Patologia>("SELECT idPatologia, nombre, " +
                    "descripcion, tratamiento " +
                    "FROM Patologia").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaPatologias);
            }
        }

        [HttpGet]
        [Route("api/GetPatologia/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var contacto = db.Database.SqlQuery<Patologia>("UPDATE Patologia" +
                    "SET idPatologia, nombre, descripcion, tratamiento" +
                    "FROM Patologia" +
                    "WHERE idPatologia = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK, contacto);
            }
        }

        [HttpPost]
        [Route("api/PostPatologias")]
        public HttpResponseMessage Post([FromBody] Patologia value)
        {

            using (var db = new CoTECEntities())
            {
                db.Database.SqlQuery<Patologia>("INSERT INTO Patologia" +
                   "idPatologia, nombre, descripcion, tratamiento" +
                    "VALUES (" + value.idPatologia + "," + value.nombre + "," + value.descripcion + "," + value.tratamiento + ")");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpPut]
        [Route("api/PutPatologias")]
        public HttpResponseMessage Put([FromBody] Patologia value)
        {
            using (var db = new CoTECEntities())
            {
                db.Database.SqlQuery<Patologia>("UPDATE Patologia" +
                    "SET idPatologia = " value.idPatologia +
                    ", nombre = " value.nombre +
                    ", descripcion = " value.descripcion +
                    ", tratamiento = " value.tratamiento +
                    "WHERE idPatologia = " value.idPatologia);

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }
        }

        [HttpDelete]
        [Route("api/DeletePatologias/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                db.Database.SqlQuery<Patologia>("DELETE" +
                    "FROM Patologia " +
                    "WHERE idPatologia = @id");

                return this.Request.CreateResponse(HttpStatusCode.OK);
            }


        }
    }
}
