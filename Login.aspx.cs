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

namespace Agroledger


{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        ILoginRepository loginRepo = new LoginRepository();
        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string usuario = txtUsuario.Text.Trim();
                string clave = txtClave.Text;

                try
                 
                {
                    if (!loginRepo.HayUsuariosRegistrados())
                    {
                        MostrarMensaje("No hay usuarios registrados. Contacta al administrador.", "warning");
                        return;
                    }


                    int rolId = loginRepo.ObtenerRolUsuario(usuario, clave);
                    if (rolId != -1)
                    {
                        Session["usuario"] = usuario;
                        Session["rol"] = rolId;
                        MostrarMensaje("Inicio de sesión exitoso.", "success");
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        MostrarMensaje("Usuario o contraseña incorrectos.", "danger");
                    }
                }
                catch (Exception ex)
                {
                    MostrarMensaje("Error al conectar: " + ex.Message, "danger");
                }
               
            }
        }
        
        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string correoRecuperar = txtCorreoRecuperar.Text.Trim();
               
                {
                    try
                    {
                        bool existe = loginRepo.VerificarCorreoExiste(correoRecuperar);
                        {
                           
                            if (existe)
                            {

                                MostrarMensaje("Se ha enviado un enlace de recuperación al correo ingresado.", "info");

                            }
                            else
                            {
                                MostrarMensaje("El correo ingresado no está registrado.", "warning");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        MostrarMensaje("Error al recuperar: " + ex.Message, "danger");
                    }
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

