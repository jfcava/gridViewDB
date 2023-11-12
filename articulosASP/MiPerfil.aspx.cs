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
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                User usuario = (User)Session["usuario"];
                txtNombre.Text = usuario.Nombre;
                txtApellido.Text = usuario.Apellido;

            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                UserNegocio negocio = new UserNegocio();
                //Escribir img
                string ruta = Server.MapPath("./Images/");
                User usuario = (User)Session["usuario"];
                txtImagen.PostedFile.SaveAs(ruta + "perfil-" + usuario.Id + ".jpg");

                usuario.ImagenPerfil = "perfil-" + usuario.Id + ".jpg";
                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;

                negocio.actualizar(usuario);

                //Leer img
                //Master.FindControl sirve para buscar controles en la masterpage
                //(clase padre) de esta pagina
                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl = "~/Images/" + usuario.ImagenPerfil;
                //Response.Redirect("Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}