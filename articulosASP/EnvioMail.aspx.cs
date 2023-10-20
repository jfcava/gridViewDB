﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace articulosASP
{
    public partial class EnvioMail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            EmailService emailService = new EmailService();
            emailService.armarCorreo(txtEmail.Text, txtAsunto.Text, txtMensaje.Text);

            try
            {
                emailService.enviarEmail();

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}