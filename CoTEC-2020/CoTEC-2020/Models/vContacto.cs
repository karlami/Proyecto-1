using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CoTEC_2020.Models
{
    public class vContacto
    {
        public string NombreCompleto { get; set; }
        public string Cedula { get; set; }
        public int Edad { get; set; }
        public string Nacionalidad { get; set; }
        public string Ubicacion { get; set; }
        public string Patologias { get; set; }
        public string Correo { get; set; }
        public int IdContacto { get; set; }
    }
}