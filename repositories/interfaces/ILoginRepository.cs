using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Agroledger.repositories.models;

namespace Agroledger.repositories.interfaces
{
    public interface  ILoginRepository
    {
        Usuario ValidarCredenciales(string nombreUsuario, string contraseña);
        bool ExisteCorreo(string correo);
    }
}