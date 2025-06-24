using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Agroledger
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // // No redirigir automáticamente, dejamos que el botón lo haga


        }

        protected void btnLogin_Click(object sender, EventArgs e)

        {
            // Cuando el usuario hace clic en "Ingresar", lo mandamos al Login
            Response.Redirect("Login.aspx");

        }
    }
}
