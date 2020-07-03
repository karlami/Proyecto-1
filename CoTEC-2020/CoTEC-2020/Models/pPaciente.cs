using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CoTEC_2020.Models
{
    public class pPaciente
    {
        public string NombreCompleto { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public string Cedula { get; set; }
        public int Edad { get; set; }
        public string Nacionalidad { get; set; }
        public string Region { get; set; }
        public string Patologias { get; set; }
        public string Estado { get; set; }
        public string Medicamentos { get; set; }
        public string Internado { get; set; }
        public string UCI { get; set; }
        public int IdPaciente { get; set; }
    }
}