using Agroledger.repositories.interfaces;
using Agroledger.repositories.models;
using Agroledger.repositories.RepositoriesGeneric;
using Dapper;
using Dapper.Contrib.Extensions;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Agroledger.repositories
{
    public class LoginRepository : GenericRepository<Usuario>, ILoginRepository
    {
        public LoginRepository() : base() 
        {
        }

        public Usuario ValidarCredenciales(string nombre_usuario, string contraseña)
        {
            using (IDbConnection db = new MySqlConnection(connectionString))
            {
                string sql = @"SELECT * FROM usuarios   WHERE nombre_usuario = @nombre_usuario AND contraseña = @contraseña";

                return db.QueryFirstOrDefault<Usuario>(sql, new { nombre_usuario, contraseña });
            }
        }


        public bool ExisteCorreo(string correo)
        {
            using (IDbConnection db = new MySqlConnection(connectionString))
            {
                string sql = @"SELECT COUNT(*) FROM usuarios WHERE email = @correo";
                int cantidad = db.ExecuteScalar<int>(sql, new { correo });
                return cantidad > 0;
            }
        }
    }
}
