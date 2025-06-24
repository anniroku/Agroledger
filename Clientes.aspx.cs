using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Agroledger

{
    public partial class Clientes : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Corrige los errores antes de continuar.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Obtener los datos
            string nombre = txtNombre.Text.Trim();
            string apellido = txtApellido.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string direccion = txtDireccion.Text.Trim();
            string email = txtEmail.Text.Trim();

            // Mostrar mensaje de éxito
            lblMensaje.Visible = true;
            lblMensaje.Text = "Cliente registrado exitosamente.";
            lblMensaje.ForeColor = System.Drawing.Color.Green;

            // Limpiar campos
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
            txtEmail.Text = "";
        }
    }
}
