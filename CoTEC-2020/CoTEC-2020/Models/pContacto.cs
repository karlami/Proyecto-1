using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CoTEC_2020.Models
{
    public class pContacto
    {
        public int idContacto { get; set; }
        public string cedula { get; set; }
        public System.DateTime fechaNacimiento { get; set; }
        public int idUbicacion { get; set; }
        public string patologias { get; set; }
        public string nacionalidad { get; set; }
        public string nombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public string correo { get; set; }
        public int idPaciente { get; set; }
    }
}