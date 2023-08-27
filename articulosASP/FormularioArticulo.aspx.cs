using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace articulosASP
{
    public partial class FormularioArticulo : System.Web.UI.Page
    {
        public bool ConfirmaEliminar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            ConfirmaEliminar = false;

            try
            {
                //Configuracion inicial de la pantalla
                if (!IsPostBack)
                {
                    MarcaNegocio marcaNegocio = new MarcaNegocio();
                    CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

                    ddlMarca.DataSource = marcaNegocio.listar();
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataValueField = "Id";
                    ddlMarca.DataBind();

                    ddlCategoria.DataSource = categoriaNegocio.listar();
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataBind();

                    btnEliminar.Visible = false;
                }

                //Configuracion si se esta modificando.
                //Pregunto si no es PostBack, porq al presionar en aceptar... ANTES
                //carga la pagina devuelta y se cargan los valores nuevamente.
                if (Request.QueryString["id"] != null && !IsPostBack)
                {
                    btnEliminar.Visible = true;
                    string id = Request.QueryString["id"].ToString();
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    List<Articulo> listaModificado = negocio.listar(id);

                    Articulo modificado = listaModificado[0];

                    txtId.Text = modificado.Id.ToString();
                    txtCodigo.Text = modificado.Codigo;
                    txtNombre.Text = modificado.Nombre;

                    ddlMarca.SelectedValue = modificado.Marca.Id.ToString();
                    ddlCategoria.SelectedValue = modificado.Categoria.Id.ToString();

                    txtDescripcion.Text = modificado.Descripcion;
                    txtUrlImagen.Text = modificado.ImagenUrl;
                    txtPrecio.Text = modificado.Precio.ToString();

                    //Forzo el evento para que muestre la imagen al modificar.
                    txtUrlImagen_TextChanged(sender, e);

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

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulo nuevo = new Articulo();
                ArticuloNegocio negocio = new ArticuloNegocio();

                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;

                nuevo.Marca = new Marca();
                nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);

                nuevo.Categoria = new Categoria();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);

                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.ImagenUrl = txtUrlImagen.Text;
                nuevo.Precio = decimal.Parse(txtPrecio.Text);

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificarSP(nuevo);
                }
                else
                    negocio.agregarConSP(nuevo);

                Response.Redirect("GridView.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminar = true;
        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio negocio = new ArticuloNegocio();

                negocio.eliminar(int.Parse(txtId.Text));
                Response.Redirect("GridView.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    }
}