using System;
using System.Web.UI;


namespace Agroledger

{
    public partial class RegistroFacturas : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nada especial en Page_Load por ahora
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Verifica que los validadores de ASP.NET pasen
            if (!Page.IsValid)
                return;

            string numFactura = txtNumFactura.Text.Trim();
            string fechaTexto = txtFechaFactura.Text.Trim();
            string cliente = txtCliente.Text.Trim();
            string totalTexto = txtTotal.Text.Trim();
            string detalleId = txtDetalleId.Text.Trim();

            // Validación extra para la fecha
            if (!DateTime.TryParse(fechaTexto, out DateTime fechaFactura))
            {
                MostrarAlerta("Ingrese una fecha válida.");
                return;
            }

            // Validación extra para total
            if (!decimal.TryParse(totalTexto, out decimal total) || total <= 0)
            {
                MostrarAlerta("Ingrese un total válido mayor que cero.");
                return;
            }

            // ID detalle puede ser validado como entero si es necesario
            if (!int.TryParse(detalleId, out int idDetalle) || idDetalle <= 0)
            {
                MostrarAlerta("Ingrese un ID de detalle válido mayor que cero.");
                return;
            }

            // TODO: Aquí agregar código para guardar la factura en la base de datos

            MostrarAlerta("Factura registrada exitosamente.");

            // Limpiar formulario
            txtNumFactura.Text = "";
            txtFechaFactura.Text = "";
            txtCliente.Text = "";
            txtTotal.Text = "";
            txtDetalleId.Text = "";
        }

        private void MostrarAlerta(string mensaje)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alerta", $"alert('{mensaje}');", true);
        }
    }
}