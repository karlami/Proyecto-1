//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CoTEC_2020.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Contacto
    {
        public int idContacto { get; set; }
        public string correo { get; set; }
        public int idPaciente { get; set; }
        public string cedula { get; set; }
    
        public virtual Persona Persona { get; set; }
    }
}
