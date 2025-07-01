using Agroledger.repositories;
using Agroledger.repositories.interfaces;
using MySqlConnector;
using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agroledger

{
    public partial class Dashboard : System.Web.UI.Page
    {
        private IFacturaRepository facturaRepo;

        protected void Page_Load(object sender, EventArgs e)
        {
            // ✅ Puedes cambiar la implementación fácilmente aquí si necesitas
            facturaRepo = new FacturaRepository();

            if (!IsPostBack)
            {
                CargarFacturas();
            }
        }

        private void CargarFacturas()
        {
            DataTable dt = facturaRepo.ObtenerFacturas();
            gvFacturas.DataSource = dt;
            gvFacturas.DataBind();
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

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            // Aquí puedes redirigir a una página si quieres
            // Por ahora déjalo vacío si no sabes qué va ahí
        }
    }
}
