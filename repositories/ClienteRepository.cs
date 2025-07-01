using Agroledger.repositories.models;
using Agroledger.repositories.interfaces;
using Dapper.Contrib.Extensions;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;


namespace Agroledger.repositories
{
    public class ClienteRepository : IClienteRepository
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        public bool InsertarCliente(cliente cliente)
        {
            using (var conexion = new MySqlConnection(connectionString))
            {
                var id = conexion.Insert(cliente); // Dapper.Contrib
                return id > 0;
            }
        }
    }
}