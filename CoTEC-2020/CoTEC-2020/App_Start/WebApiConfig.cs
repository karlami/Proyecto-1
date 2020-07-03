using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;
//using CoTEC-2020.Handlers;

namespace CoTEC_2020
{
    public static class WebApiConfig
    {

        public static void Register(HttpConfiguration config)
        {
            //Enable CORS
            config.EnableCors(new EnableCorsAttribute("http://localhost:4200", headers: "*", methods: "*"));

            // Configuración y servicios de API web

            // Rutas de API web
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional },
                constraints: new { id = new App_Start.CustomRegExConstraint(@"[A-Za-z]*") }
            //constraints: new { id = @"[A-Za-z]*" }
            );

            config.Routes.MapHttpRoute(
                 name: "AdminApi",
                 routeTemplate: "api/Administracion/{controller}/{id}",
                 defaults: new { id = RouteParameter.Optional },
                 constraints: new { id = new App_Start.CustomRegExConstraint(@"[A-Za-z]*") }
             //constraints: new { id = @"[A-Za-z]*" }
             );
        }
    }
}