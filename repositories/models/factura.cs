using Mysqlx.Cursor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Dapper.Contrib.Extensions;

namespace Agroledger.repositories.models
{
    [Table("facturas")]
    public class factura
    {
        [Dapper.Contrib.Extensions.KeyAttribute]
        public int id_factura { get; set; }

        public int id_cliente { get; set; }

        public DateTime fecha { get; set; }

        public decimal total { get; set; }


    }
}