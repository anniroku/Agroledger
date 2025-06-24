using System;
using System.Web.UI;


namespace Agroledger

{
    public partial class Ventas : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegistrarVenta_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Corrige los errores antes de registrar la venta.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Validación manual adicional si deseas verificar el producto HTML
            string productoSeleccionado = Request.Form["ddlProducto"];
            if (string.IsNullOrEmpty(productoSeleccionado))
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Seleccione un producto.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string cliente = ddlCliente.SelectedValue;
            string cantidad = txtCantidad.Text;
            string precio = txtPrecio.Text;
            string total = txtTotal.Text;

            // Aquí podrías guardar en la base de datos

            lblMensaje.Visible = true;
            lblMensaje.Text = "Venta registrada exitosamente.";
            lblMensaje.ForeColor = System.Drawing.Color.Green;

            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            ddlCliente.SelectedIndex = 0;
            txtCantidad.Text = "";
            txtPrecio.Text = "";
            txtTotal.Text = "";
        }
    }
}
