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
                        <asp:CheckBox ID="ckbFiltroAvanzado" runat="server" Text="Filtro Avanzado" AutoPostBack="true" OnCheckedChanged="ckbFiltroAvanzado_CheckedChanged" />
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="mb-3">
                        <asp:Button Text="Limpiar" runat="server" ID="btnLimpiar" CssClass="btn btn-warning" OnClick="btnLimpiar_Click" />
                    </div>
                </div>
            </div>
            <%if (ckbFiltroAvanzado.Checked)
                { %>
            <div class="row">
                <div class="col-4">
                    <div class="mb-3">
                        <asp:Label Text="Campo" runat="server" CssClass="form-label" />
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCampo" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                            <asp:ListItem Text="Código" />
                            <asp:ListItem Text="Nombre" />
                            <asp:ListItem Text="Marca" />
                            <asp:ListItem Text="Categoría" />
                            <asp:ListItem Text="Precio" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-4">
                    <div class="mb-3">
                        <asp:Label Text="Criterio" runat="server" CssClass="form-label" />
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCriterio"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-4">
                    <div class="mb-3">
                        <asp:Label Text="Filtro" runat="server" CssClass="form-label" />
                        <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <asp:Button Text="Buscar" runat="server" ID="btnBuscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
                </div>
            </div>
            <%} %>
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
