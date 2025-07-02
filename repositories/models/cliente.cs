using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using static Mysqlx.Expect.Open.Types.Condition.Types;
using Dapper.Contrib.Extensions;

namespace Agroledger.repositories.models
{
    [Table("clientes")]
    public class cliente
    {

        [Dapper.Contrib.Extensions.KeyAttribute]
        public int id_cliente { get; set; }

        [StringLength(100)]
        public string Nombre { get; set; }


        [StringLength(100)]
        public string Apellido { get; set; }

        [StringLength(100)]
        public string Telefono { get; set; }


        [StringLength(20)]
        public string Direccion { get; set; }

        [StringLength(255)]
        public string Email { get; set; }



    }
}
