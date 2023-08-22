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
    public partial class ListadoArticulos : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            ListaArticulos = negocio.listarConSP();

            if (!IsPostBack)
            {
                //Los repetidores se cargan igual que los DataGridView
                repRepetidor.DataSource = ListaArticulos;
                repRepetidor.DataBind();
            }
        }
        protected void btnEjemplo_Click(object sender, EventArgs e)
        {
            //Se usa el "sender", que es el objeto que dispara el evento,
            //yo se que es un Button, por eso el casteo explicito,
            //y capturo el valor del CommandArgument. En este caso el Id.
            string valor = ((Button)sender).CommandArgument;
        }
    }
}