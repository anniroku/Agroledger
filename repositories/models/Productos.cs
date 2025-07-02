using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Dapper.Contrib.Extensions;

namespace Agroledger.repositories.models
{
    [Table("productos")]
    public class producto
    {
        [Dapper.Contrib.Extensions.Key]
        public int id_producto { get; set; }

        public string nombre { get; set; }

        public decimal precio { get; set; }

        public int stock { get; set; }

        public string categoria { get; set; }
    }
}
