<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="GridView.aspx.cs" Inherits="articulosASP.GridView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Listado de Artículos</h1>
    <hr />

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-6">
                    <div class="mb-3">
                        <asp:Label Text="Filtro" runat="server" CssClass="form-label" />
                        <asp:TextBox runat="server" ID="txtFiltro" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" CssClass="form-control" />
                    </div>
                    <div class="col-6">
                        <asp:Button Text="Limpiar" runat="server" ID="btnLimpiar" CssClass="btn btn-warning" OnClick="btnLimpiar_Click" />
                    </div>
                </div>
            </div>
            <hr />
            <asp:GridView ID="gvArticulos" runat="server" DataKeyNames="Id"
                CssClass="table" AutoGenerateColumns="false"
                OnSelectedIndexChanged="gvArticulos_SelectedIndexChanged"
                OnPageIndexChanging="gvArticulos_PageIndexChanging"
                AllowPaging="true" PageSize="10">
                <Columns>
                    <asp:BoundField HeaderText="Código" DataField="Codigo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                    <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:C2}" />
                    <%--Con la propiedad RowEditing, puedo modificar por celda como si fuera Excel--%>
                    <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✏" />

                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <a href="FormularioArticulo.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
