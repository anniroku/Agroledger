using System;
using System.Web.UI;


namespace Agroledger

{
    public partial class DetallesVenta : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Corrige los errores antes de guardar.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string idVenta = txtIdVenta.Text.Trim();
            string producto = txtProducto.Text.Trim();
            int cantidad = int.TryParse(txtCantidad.Text, out int c) ? c : 0;
            decimal precio = decimal.TryParse(txtPrecioUnitario.Text, out decimal p) ? p : 0;
            decimal subtotal = cantidad * precio;

            // Aseguramos consistencia de subtotal
            txtSubtotal.Text = subtotal.ToString("F2");

            // Aquí podrías guardar en base de datos o lista temporal...

            lblMensaje.Visible = true;
            lblMensaje.Text = "Detalle guardado correctamente.";
            lblMensaje.ForeColor = System.Drawing.Color.Green;

            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            txtIdVenta.Text = "";
            txtProducto.Text = "";
            txtCantidad.Text = "";
            txtPrecioUnitario.Text = "";
            txtSubtotal.Text = "";
        }
    }
}

