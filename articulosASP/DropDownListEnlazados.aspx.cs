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
    public partial class DrowDownListEnlazados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriaNegocio catNegocio = new CategoriaNegocio();
            ArticuloNegocio artNegocio = new ArticuloNegocio();
            try
            {
                if (!IsPostBack)
                {
                    //Obtengo datos y los guardo en Session
                    List<Articulo> listaArt = artNegocio.listarConSP();
                    Session["listaArticulos"] = listaArt;

                    List<Categoria> listaCategorias = catNegocio.listar();
                    
                    ddlCategoria.DataSource = listaCategorias;
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(ddlCategoria.SelectedItem.Value);
            ddlArticulos.DataSource = ((List<Articulo>)Session["listaArticulos"]).FindAll(x => x.Categoria.Id == id);
            ddlArticulos.DataTextField = "Nombre";
            ddlArticulos.DataValueField= "Id";
            ddlArticulos.DataBind();
        }
    }
}