﻿using CoTEC_2020.Models;
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
    public class MedicamentoController : ApiController
    {
        [HttpGet]
        [Route("api/GetMedicamentos")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaMedicamentos = db.Database.SqlQuery<Medicamento>("SELECT idMedicamento, nombre, " +
                    "descripcion, casaFarmaceutica " +
                    "FROM Medicamento").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaMedicamentos);
            }
        }

        [HttpGet]
        [Route("api/GetMedicamento/{id}")]
        public HttpResponseMessage Get(int id)
        {
            using (var db = new CoTECEntities())
            {
                //SqlParameter parametro = new SqlParameter("@id", id);
                var contacto = db.Database.SqlQuery<Medicamento>("SELECT idMedicamento, nombre, descripcion," +
                    " casaFarmaceutica " +
                    "FROM Medicamento " +
                    "WHERE idMedicamento = " + id).FirstOrDefault();


                return this.Request.CreateResponse(HttpStatusCode.OK, contacto);
            }
        }

        [HttpPost]
        [Route("api/PostMedicamentos")]
        public HttpResponseMessage Post([FromBody] Medicamento value)
        {

            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("INSERT INTO Medicamento" +
                   " (nombre, descripcion, casaFarmaceutica)" +
                    " VALUES ('" + value.nombre + "','" + value.descripcion + "','" + value.casaFarmaceutica + "')");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpPut]
        [Route("api/PutMedicamentos")]
        public HttpResponseMessage Put([FromBody] Medicamento value)
        {
            using (var db = new CoTECEntities())
            {
                var status = db.Database.ExecuteSqlCommand("UPDATE Medicamento" +
                    " SET nombre = '" + value.nombre +"', descripcion = '" + value.descripcion +
                    "', casaFarmaceutica = '" + value.casaFarmaceutica +
                    "' WHERE idMedicamento = ('" + value.idMedicamento + "')");

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }
        }

        [HttpDelete]
        [Route("api/DeleteMedicamentos/{id}")]
        public HttpResponseMessage Delete(string id)
        {
            using (var db = new CoTECEntities())
            {
                SqlParameter parametro = new SqlParameter("@id", id);
                var status = db.Database.ExecuteSqlCommand("DELETE" +
                    " FROM Medicamento " +
                    " WHERE idMedicamento = @id", parametro);

                return this.Request.CreateResponse(HttpStatusCode.OK, status);
            }


        }
    }
}
