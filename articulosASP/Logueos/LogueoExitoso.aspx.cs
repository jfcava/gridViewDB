using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace articulosASP.Login
{
    public partial class LogueoExitoso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Session.Add("error", "No no.. Debes loguearte para ingresar");
                Response.Redirect("../Error.aspx", false);
            }
        }

        protected void btnLogueoAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogueoExitosoAdmin.aspx", false);
        }
    }
}