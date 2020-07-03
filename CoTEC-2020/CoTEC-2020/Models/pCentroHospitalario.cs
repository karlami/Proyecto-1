using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CoTEC_2020.Models
{
    public class pCentroHospitalario
    {
        public int idCentroHospitalario { get; set; }
        public int contacto { get; set; }
        public string director { get; set; }
        public int capacidad { get; set; }
        public string nombre { get; set; }
        public string region { get; set; }
        public string pais { get; set; }
        public int capacidadUci { get; set; }
    }
}