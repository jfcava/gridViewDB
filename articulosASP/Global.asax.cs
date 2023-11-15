using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace articulosASP
{
    public class Global : System.Web.HttpApplication
    {
        
        //Otra opcion para que funcionen los Validators, es agregar este
        //script a continuacion centralizado. Esta opcion es mas moderna y optimiza las paginas
        protected void Application_Start(object sender, EventArgs e)
        {
            string JQueryVer = "1.11.3";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/js/jquery-" + JQueryVer + ".min.js",
                DebugPath = "~/js/jquery-" + JQueryVer + ".js",
                CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".min.js",
                CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".js",
                CdnSupportsSecureConnection = true,
                LoadSuccessExpression = "window.jQuery"
            });

        }


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
        

    }
}