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
    
    public partial class MedidaSanitaria
    {
        public MedidaSanitaria()
        {
            this.UbicacionMedidaSanitarias = new HashSet<UbicacionMedidaSanitaria>();
        }
    
        public int idMedidaSanitaria { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string estado { get; set; }
        public System.DateTime fechaInicio { get; set; }
        public Nullable<System.DateTime> fechaFinal { get; set; }
    
        public virtual ICollection<UbicacionMedidaSanitaria> UbicacionMedidaSanitarias { get; set; }
    }
}
