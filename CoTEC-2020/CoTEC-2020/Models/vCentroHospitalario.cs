using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CoTEC_2020.Models
{
    public class vCentroHospitalario
    {
        public string Ubicacion { get; set; }
        public string Nombre { get; set; }
        public int Capacidad { get; set; }
        public int CapacidadUCI { get; set; }
        public string Director { get; set; }
        public string Contacto { get; set; }
        public int IdCentroHospitalario { get; set; }
    }
}