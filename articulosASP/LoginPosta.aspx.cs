using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Timers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace articulosASP
{
    public partial class LoginPosta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User usuario = new User();
            UserNegocio negocio = new UserNegocio();
            try
            {
                //Genere una clase estatica llamada VALIDACION, para incluir
                //el metodo validaTextoVacio que pregunta si es o no vacio o nulo
                if(Validacion.validaTextoVacio(txtUsuario) || Validacion.validaTextoVacio(txtPassword))
                {
                    Session.Add("error", "Debes completar ambos campos");
                    Response.Redirect("Error.aspx");
                }
                
                usuario.Email = txtUsuario.Text;
                usuario.Pass = txtPassword.Text;
                if (negocio.Login(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("MiPerfil.aspx", false);
                }
                else
                {
                    Session.Add("error", "User o Pass incorrectos.");
                    Response.Redirect("Error.aspx", false);
                }
            }
            //Catcheo del error de ThreadAbortException, y hacemos que no
            //haga nada. Tambien se puede hacer un IF dentro del siguiente catch.
            catch (ThreadAbortException) { }
            catch (Exception ex)
            {                
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        
       //El Page_Error es otra capa intermedia de manejo de errores.
       //Maneja los errores que se produzcan en esta pagina
       //Primero se maneja con TRY CATCH de cada metodo
       //Si no existiera entra en el Page_Error
       //Y sino salta por el manejo de error del Global.asax
        private void Page_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            Session.Add("error", exc.ToString());
            Server.Transfer("Error.aspx");
        }
    }
}