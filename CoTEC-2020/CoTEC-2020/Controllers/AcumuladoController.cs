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
    public class AcumuladoController : ApiController
    {
        [HttpGet]
        [Route("api/GetAcumulado")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaPacientes = db.Database.SqlQuery<vAcumulado>("SELECT Pais, Contagiados, " +
                    "Activos, Muertos, Recuperados " +
                    "FROM viewMedidasContencionTomadas").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaPacientes);
            }
        }
    }
}