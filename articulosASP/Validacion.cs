using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace articulosASP
{
    public static class Validacion
    {
        public static bool validaTextoVacio(object control)
        {
            if(control is TextBox)
            {
                if (string.IsNullOrEmpty(((TextBox)control).Text))
                {
                    return true;
                }
            }
            return false;
        }
    }
}