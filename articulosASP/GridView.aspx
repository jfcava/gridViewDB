<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="GridView.aspx.cs" Inherits="articulosASP.GridView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Listado de Artículos</h1>
    <asp:GridView ID="gvArticulos" runat="server" DataKeyNames="Id" 
        CssClass="table table-dark table-sm" AutoGenerateColumns="false"
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
    <a href="FormularioArticulo.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
