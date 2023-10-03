using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace articulosASP
{
    public partial class Logueo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                usuario.User = txtUsuario.Text;
                usuario.Pass = txtPassword.Text;
                if (negocio.Loguear(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("LogueoExitoso.aspx", false);
                }
                else
                {
                    Session.Add("error", "User o Pass incorrecto");
                    Response.Redirect("../Error.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}