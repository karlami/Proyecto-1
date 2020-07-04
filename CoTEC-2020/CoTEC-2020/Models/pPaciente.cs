using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CoTEC_2020.Models
{
    public class pPaciente
    {
        public int idPaciente { get; set; }
        public string cedula { get; set; }
        public System.DateTime fechaNacimiento { get; set; }
        public string region { get; set; }
        public string medicacion { get; set; }
        public string patologias { get; set; }
        public string nacionalidad { get; set; }
        public string nombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public int estado { get; set; }
        public string internado { get; set; }
        public string uci { get; set; }
        public System.DateTime fechaIngreso { get; set; }
        public int idCentroHospitalario { get; set; }
    }
}