<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="articulosASP.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <hr />
    <h1>Lista Artículos </h1>
    <div class="row row-cols-1 row-cols-md-3 g-4">

        <%--<% foreach (dominio.Articulo art in ListaArticulos)

            { %>
        <div class="col">
            <div class="card">
                <img src="<%: art.ImagenUrl %>" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><%: art.Nombre %></h5>
                    <p class="card-text"><%: art.Descripcion %></p>
                    <a href="Detalle.aspx?id=<%:art.Id %> ">Ver Detalle</a>
                </div>
            </div>
        </div>

        <%} %>--%>

        
        
        
        <%--        Otra forma mas optima de generar un foreach es utilizando un REPEATER--%>

        <asp:Repeater ID="repRepetidor" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img src="<%#Eval("ImagenUrl")%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre")%></h5>
                            <p class="card-text"><%#Eval("Descripcion")%></p>
                            <a href="Detalle.aspx?id=<%#Eval("Id") %> ">Ver Detalle</a>
                            <asp:Button ID="btnEjemplo" runat="server" Text="Ejemplo" CssClass="btn btn-primary" CommandArgument='<%#Eval("Id") %>' CommandName="ArtId" onclick="btnEjemplo_Click"/>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
