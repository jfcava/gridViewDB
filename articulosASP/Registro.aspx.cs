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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                User usuario = new User();
                UserNegocio negocio = new UserNegocio();
                EmailService emailService = new EmailService();

                usuario.Email = txtEmail.Text;
                usuario.Pass = txtPassword.Text;
                usuario.Id = negocio.insertarNuevo(usuario);
                Session.Add("usuario", usuario);

                emailService.armarCorreo(usuario.Email, "Bienvenido Usuario " + usuario.Email + "!", "Te damos la bienvenida a la aplicacion. Tu perfil fue creado con exito! Recorda que tu password es:" + usuario.Pass);
                emailService.enviarEmail();

                Response.Redirect("Default.aspx", false);



            }
            catch (Exception ex)
            {
                Session.Add("Error.aspx", ex);
            }
        }
    }
}