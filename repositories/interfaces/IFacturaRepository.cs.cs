using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Agroledger.repositories.interfaces
{
    public interface IFacturaRepository
    {
        DataTable ObtenerFacturas();
    }
}