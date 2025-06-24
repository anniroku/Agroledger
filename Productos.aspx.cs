using System;
using System.Web.UI;


namespace Agroledger

{
    public partial class Productos : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Cargar proveedores dinámicamente si deseas
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Validar controles con la propiedad Page.IsValid (automático con validadores ASP.NET)
            if (!Page.IsValid)
            {
                // No continuar si los validadores no pasan
                return;
            }

            string nombre = txtNombre.Text.Trim();
            string descripcion = txtDescripcion.Text.Trim();

            if (!decimal.TryParse(txtPrecio.Text.Trim(), out decimal precio) || precio <= 0)
            {
                MostrarAlerta("Ingrese un precio válido mayor que cero.");
                return;
            }

            if (!int.TryParse(txtStock.Text.Trim(), out int stock) || stock < 0)
            {
                MostrarAlerta("Ingrese un stock válido (0 o más).");
                return;
            }

            if (string.IsNullOrEmpty(ddlProveedor.SelectedValue))
            {
                MostrarAlerta("Debe seleccionar un proveedor.");
                return;
            }

            // Aquí guardas el producto en la base de datos o tu lógica

            MostrarAlerta("Producto registrado exitosamente.");

            // Limpiar formulario
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "";
            ddlProveedor.SelectedIndex = 0;
        }

        private void MostrarAlerta(string mensaje)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alerta", $"alert('{mensaje}');", true);
        }
    }
}
