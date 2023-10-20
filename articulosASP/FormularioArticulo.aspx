<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="FormularioArticulo.aspx.cs" Inherits="articulosASP.FormularioArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%if (Request.QueryString["id"] != null)
        {
    %>
    <h1 style="padding-top: 20px;">Modificar Artículo</h1>
    <%}
        else
        {  %>
    <h1 style="padding-top: 20px;">Nuevo Artículo</h1>
    <%}
%>
    <hr />
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id</label>
                <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Código</label>
                <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="ddlMarca" class="form-label">Marca</label>
                <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="ddlCategoria" class="form-label">Categoría</label>
                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Button Text="Aceptar" runat="server" ID="btnAgregar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                        <asp:Button Text="Eliminar" runat="server" ID="btnEliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" />
                        <a href="GridView.aspx" cssclass="btn btn-primary">Cancelar</a>
                        <%if (ConfirmaEliminar)
                            {  %>
                        <div class="mb-3">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" id="ckdEliminar" runat="server" class="form-check-input">
                                    Confirmar Eliminación
                                </label>
                                <asp:Button ID="btnConfirmaEliminar" runat="server" Text="Eliminar" CssClass="btn btn-outline-danger" OnClick="btnConfirmaEliminar_Click" />
                            </div>
                        </div>
                    </div>
                    <%} %>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="col-6">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripción</label>
                    <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="urlImagen" class="form-label">Url Imagen</label>
                    <asp:TextBox ID="txtUrlImagen" runat="server" CssClass="form-control" OnTextChanged="txtUrlImagen_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtPrecio" class="form-label">Precio</label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:Image ID="imgArticulo" runat="server" ImageUrl="https://uning.es/wp-content/uploads/2016/08/ef3-placeholder-image.jpg" Width="50%" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </div>
    <div class="row">
        <div class="col-6">
        </div>
    </div>

</asp:Content>
