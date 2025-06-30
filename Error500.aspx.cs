using System;

namespace Agroledger
{
    public partial class Error500 : System.Web.UI.Page
    {
        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)

        {
            
        }
    }
}
