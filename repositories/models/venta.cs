using System;
using System.ComponentModel.DataAnnotations;
using Dapper.Contrib.Extensions;

namespace Agroledger.repositories.models
{
    [Table("venta")]
    public class venta
    {
        [Dapper.Contrib.Extensions.KeyAttribute]
        public int id_venta { get; set; }

        public int id_cliente { get; set; }

        public DateTime fecha { get; set; }

        public decimal total { get; set; }

        public int metodo_id { get; set; }

        [StringLength(255)]
        public string ArchivoPdf { get; set; }
    


    }
}
