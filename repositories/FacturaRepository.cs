using Agroledger.repositories.interfaces;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace Agroledger.repositories
{
    public class FacturaRepository : IFacturaRepository
    {
        private string conexion = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        public DataTable ObtenerFacturas()
        {
            using (var conexion = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString))
            {
                var comando = new MySqlCommand("SELECT * FROM vista_reporte_facturas", conexion);
                var adaptador = new MySqlDataAdapter(comando);
                var tabla = new DataTable();
                adaptador.Fill(tabla);
                return tabla;
            }
        }
    }
}