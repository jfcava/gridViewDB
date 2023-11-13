using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace articulosASP
{
    public class Global : System.Web.HttpApplication
    {
        //Manejo de errores Generico
        //Se carga este metodo para que funcione
        //Cualquier error que se haya producido en la aplicacion
        //y no haya sido capturado.. va a ser capturado por este metodo
        void Application_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();
            Session.Add("error", exc.ToString());
            
            //Funciona como el Responde.Redirect, pero en este caso
            //se utiliza Server.Transfer porque sino falla
            Server.Transfer("Error.aspx");
        }

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}