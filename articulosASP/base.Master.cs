using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace articulosASP
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!(Page is LoginPosta || Page is ListadoArticulos || Page is Default))
            {
                if (!(Seguridad.sesionActiva(Session["usuario"])))
                {
                    Response.Redirect("LoginPosta.aspx", false);
                }
            }
        }
    }
}