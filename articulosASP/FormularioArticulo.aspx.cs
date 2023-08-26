using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace articulosASP
{
    public partial class FormularioArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            try
            {
                if (!IsPostBack)
                {
                    ddlMarca.DataSource = marcaNegocio.listar();
                    ddlMarca.DataBind();

                    ddlCategoria.DataSource = categoriaNegocio.listar();
                    ddlCategoria.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtUrlImagen.Text;
        }
    }
}