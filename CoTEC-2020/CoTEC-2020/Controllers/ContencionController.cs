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
    public class ContencionController : ApiController
    {
        [HttpGet]
        [Route("api/GetContencion")]
        public HttpResponseMessage Get()
        {
            using (var db = new CoTECEntities())
            {
                var listaPacientes = db.Database.SqlQuery<vContencion>("SELECT fechaInicio, nombre " +
                    "FROM viewMedidasContencionTomadas").ToList();

                return this.Request.CreateResponse(HttpStatusCode.OK, listaPacientes);
            }
        }
    }
}