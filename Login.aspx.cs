using Agroledger.repositories.interfaces;
using Agroledger.repositories;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Agroledger.repositories.models;


namespace Agroledger
{

    public partial class Login : System.Web.UI.Page
    {
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text.Trim();
            string clave = txtClave.Text;

            var repo = new LoginRepository();
            var dueno = repo.ValidarCredenciales(usuario, clave);

            if (dueno != null)
            {
                // Creamos session
                Session["dueno"] = dueno;

                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                // Error de autenticación
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Usuario o contraseña incorrectos');", true);
            }
        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string correoRecuperar = txtCorreoRecuperar.Text.Trim();

                var loginRepo = new LoginRepository();

                if (loginRepo.ExisteCorreo(correoRecuperar))
                {
                    MostrarMensaje("Se ha enviado un enlace de recuperación al correo ingresado.", "info");
                    // Aquí puedes agregar lógica futura para enviar email real si lo deseas
                }
                else
                {
                    MostrarMensaje("El correo ingresado no está registrado.", "warning");
                }
            }
        }

        private void MostrarMensaje(string mensaje, string tipo = "danger")
        {
            divMensaje.InnerHtml = mensaje;
            divMensaje.Attributes["class"] = "alert alert-" + tipo;
            divMensaje.Visible = true;
        }
    }
}

