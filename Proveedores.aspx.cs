using System;
using System.Web.UI;

namespace Agroledger

{
    public partial class Proveedores : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Aquí puedes agregar lógica que se ejecute al cargar la página
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Validar que los campos no estén vacíos
            if (string.IsNullOrWhiteSpace(txtNombre.Text) ||
                string.IsNullOrWhiteSpace(txtTelefono.Text) ||
                string.IsNullOrWhiteSpace(txtDireccion.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                // Mostrar mensaje de error si algún campo está vacío
                Response.Write("<script>alert('Por favor, complete todos los campos.');</script>");
                return;
            }

            // Aquí puedes agregar la lógica para guardar los datos en la base de datos
            // Por ejemplo:
            // GuardarProveedor(txtNombre.Text, txtTelefono.Text, txtDireccion.Text, txtEmail.Text);

            // Limpiar los campos después de registrar
            txtNombre.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            txtEmail.Text = string.Empty;

            // Mostrar mensaje de éxito
            Response.Write("<script>alert('Proveedor registrado exitosamente.');</script>");
        }
    }
}
