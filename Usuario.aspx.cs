using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agroledger

{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Aquí podrías cargar valores iniciales si es necesario
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Obtener valores del formulario
            string nombre = txtNombre.Text.Trim();
            string apellido = txtApellido.Text.Trim();
            string email = txtEmail.Text.Trim();
            string contrasena = txtContrasena.Text;
            string rol = ddlRol.SelectedValue;

            // Validar que todos los campos estén llenos
            if (string.IsNullOrEmpty(nombre) ||
                string.IsNullOrEmpty(apellido) ||
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(contrasena) ||
                string.IsNullOrEmpty(rol))
            {
                lblMensaje.Text = "Por favor, complete todos los campos.";
                lblMensaje.CssClass = "mensaje error";
                return;
            }

            try
            {
                // Aquí podrías agregar el código para guardar el usuario en una base de datos.
                // Por ahora, simplemente mostraremos un mensaje de éxito.

                lblMensaje.Text = "Usuario registrado exitosamente.";
                lblMensaje.CssClass = "mensaje exito";

                // Limpiar campos
                txtNombre.Text = "";
                txtApellido.Text = "";
                txtEmail.Text = "";
                txtContrasena.Text = "";
                ddlRol.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                // Manejo de errores
                lblMensaje.Text = "Error al registrar el usuario: " + ex.Message;
                lblMensaje.CssClass = "mensaje error";
            }
        }
    }
}
