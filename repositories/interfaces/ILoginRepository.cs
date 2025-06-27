using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Agroledger.repositories.interfaces
{
    public interface  ILoginRepository
    {
        int ObtenerRolUsuario(string usuario, string clave);
        bool VerificarCorreoExiste(string correo);
        bool HayUsuariosRegistrados();
    }
}