using Agroledger.repositories.interfaces;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Agroledger.repositories
{
    public class LoginRepository : ILoginRepository
    {
        private readonly string _connStr;

        public LoginRepository()
        {
            _connStr = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
        }

        public bool HayUsuariosRegistrados()
        {
            using (var conn = new MySqlConnection(_connStr))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM usuarios";
                using (var cmd = new MySqlCommand(query, conn))
                {
                    int total = Convert.ToInt32(cmd.ExecuteScalar());
                    return total > 0;
                }
            }
        }

        public int ObtenerRolUsuario(string usuario, string clave)
        {
            using (var conn = new MySqlConnection(_connStr))
            {
                conn.Open();
                string query = "SELECT rol FROM usuarios WHERE nombre_usuario = @nombre AND contrasena = @contrasena";
                using (var cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@nombre", usuario);
                    cmd.Parameters.AddWithValue("@contrasena", clave);
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return reader.GetInt32("rol");
                        }
                        else
                        {
                            return -1; // Usuario no encontrado
                        }
                    }
                }
            }
        }

        public bool VerificarCorreoExiste(string correo)
        {
            using (var conn = new MySqlConnection(_connStr))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM usuarios WHERE email = @correo";
                using (var cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@correo", correo);
                    int existe = Convert.ToInt32(cmd.ExecuteScalar());
                    return existe > 0;
                }
            }
        }
    }
}
