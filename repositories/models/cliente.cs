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
        public string nombre { get; set; }


        [StringLength(100)]
        public string apellido { get; set; }


        [StringLength(20)]
        public string numero { get; set; }

        [StringLength(255)]
        public string email { get; set; }


    }
}
