using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace articulosASP
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            imgAvatar.ImageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/310px-Placeholder_view_vector.svg.png";
            if (!(Page is LoginPosta || Page is ListadoArticulos || Page is Default || Page is Registro || Page is Error))
            {
                if (!(Seguridad.sesionActiva(Session["usuario"])))
                    Response.Redirect("LoginPosta.aspx", false);
                else
                {
                    User usuario = (User)Session["usuario"];
                    lblUsuario.Text = usuario.Email;
                    if (!string.IsNullOrEmpty(usuario.ImagenPerfil))
                        imgAvatar.ImageUrl = "~/Images/" + usuario.ImagenPerfil;
                }
                
                
            }

            //if (Seguridad.sesionActiva(Session["usuario"]))
            //    imgAvatar.ImageUrl = "~/Images/" + ((User)Session["usuario"]).ImagenPerfil;
            //else
            //    imgAvatar.ImageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/310px-Placeholder_view_vector.svg.png";

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPosta.aspx", false);
        }
    }
}