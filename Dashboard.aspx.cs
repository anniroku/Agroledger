using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySqlConnector;

namespace Agroledger

{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarFacturas();
            }
            // Puedes agregar validaciones aquí, por ejemplo:
            // if (Session["usuario"] == null) Response.Redirect("Login.aspx");
        }
        private void CargarFacturas()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

            using (var conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string query = @"
                SELECT f.id_factura, c.nombre AS nombre_cliente, f.fecha, f.total, f.forma_pago,  f.observaciones
                FROM factura f
                INNER JOIN clientes c ON f.id_cliente = c.id_cliente
                ORDER BY id_factura DESC";

                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvFacturas.DataSource = dt;
                    gvFacturas.DataBind();
                }
                catch (Exception ex)
                {
                    // Mostrar error si falla
                    Response.Write("Error al cargar facturas: " + ex.Message);
                }
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            // Cierra la sesión y redirige al login
            Session.Abandon();
            Response.Redirect("Login.aspx"); // Cambia por la página de inicio de sesión que tengas
        }

        protected void btnVentas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ventas.aspx");
        }

        protected void btnRegistroFacturas_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistroFacturas.aspx");
        }

        protected void btnClientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Clientes.aspx");
        }

        protected void grid_facturas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}