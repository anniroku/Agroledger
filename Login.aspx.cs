using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Agroledger


{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string usuario = txtUsuario.Text.Trim();
                string clave = txtClave.Text;

                string connStr = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

                using (var conn = new MySqlConnection(connStr))
                {
                    try
                    {
                        conn.Open();

                        string verificarUsuarios = "SELECT COUNT(*) FROM usuarios";
                        using (var cmdVerificar = new MySqlCommand(verificarUsuarios, conn))
                        {
                            int totalUsuarios = Convert.ToInt32(cmdVerificar.ExecuteScalar());
                            if (totalUsuarios == 0)
                            {
                                MostrarMensaje("No hay usuarios registrados. Contacta al administrador.", "warning");
                                return;
                            }
                        }
                        //consulta para verificar  login y obtener el rol automaticamente
                        string query = "SELECT rol FROM usuarios WHERE nombre_usuario = @nombre AND contrasena = @contrasena";

                        using (var cmd = new MySqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@nombre", usuario);
                            cmd.Parameters.AddWithValue("@contrasena", clave);


                            using (var reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {

                                    int rolId = reader.GetInt32("rol");

                                    Session["usuario"] = usuario;
                                    Session["rol"] = rolId;

                                    MostrarMensaje("Inicio de sesión exitoso.", "success");
                                    Response.Redirect("Dashboard.aspx");
                                }
                                else
                                {
                                    MostrarMensaje("Usuario, contraseña o rol incorrectos. Verifique sus datos", "danger");
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        MostrarMensaje("Error al conectar: " + ex.Message, "danger");
                    }
                }
            }
        }



        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string correoRecuperar = txtCorreoRecuperar.Text.Trim();
                string connStr = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
                using (var conn = new MySqlConnection(connStr))
                {
                    try
                    {
                        conn.Open();
                        string query = "SELECT COUNT(*) FROM usuarios WHERE email = @correo";
                        using (var cmd = new MySqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@correo", correoRecuperar);
                            int existe = Convert.ToInt32(cmd.ExecuteScalar());
                            if (existe > 0)
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

