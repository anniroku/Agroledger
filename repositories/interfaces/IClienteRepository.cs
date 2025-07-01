using Agroledger.repositories.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agroledger.repositories.interfaces
{
    public interface IClienteRepository
    {
        bool InsertarCliente(cliente cliente);
    }
}