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
    
    public partial class Medida_Sanitaria
    {
        public Medida_Sanitaria()
        {
            this.Ubicacion_Medida_Sanitaria = new HashSet<Ubicacion_Medida_Sanitaria>();
        }
    
        public int Id_Medida_Sanitaria { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Estado { get; set; }
        public Nullable<System.DateTime> Fecha_Inicio { get; set; }
        public Nullable<System.DateTime> Fecha_Final { get; set; }
    
        public virtual ICollection<Ubicacion_Medida_Sanitaria> Ubicacion_Medida_Sanitaria { get; set; }
    }
}
