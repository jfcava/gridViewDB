using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace articulosASP.Logueos
{
    public partial class LogueoExitosoAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!((dominio.Usuario)Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN)){
                Session.Add("error", "No sos Admin para ingresar aca... Tomatela...");
                Response.Redirect("../Error.aspx", false);
            }
        }
    }
}