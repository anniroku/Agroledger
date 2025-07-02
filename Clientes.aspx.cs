using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Agroledger.repositories.models;
using Agroledger.repositories;
using Agroledger.repositories.interfaces;


namespace Agroledger

{
    public partial class Clientes : Page
    {
        private readonly IClienteRepository clienteRepo = new ClienteRepository();

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Corrige los errores antes de continuar.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            cliente nuevoCliente = new cliente
            {
                Nombre = txtNombre.Text.Trim(),
                Apellido = txtApellido.Text.Trim(),
                Telefono = txtTelefono.Text.Trim(),
                Direccion = txtDireccion.Text.Trim(),
                Email = txtEmail.Text.Trim()
            };

            bool resultado = clienteRepo.InsertarCliente(nuevoCliente);

            lblMensaje.Visible = true;

            if (resultado)
            {
                lblMensaje.Text = "Cliente registrado exitosamente.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
                LimpiarFormulario();
                // CargarClientes();
            }
            else
            {
                lblMensaje.Text = "Ocurrió un error al registrar el cliente.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        } // <--- AQUÍ termina tu método

        // <--- AQUÍ PEGAS ESTO:

        private void LimpiarFormulario()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
            txtEmail.Text = "";
        }

        // <--- DESPUÉS viene la llave de cierre de la clase
    }
}

