<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="LogueoExitoso.aspx.cs" Inherits="articulosASP.Login.LogueoExitoso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Esaaa! Te logueaste!</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <%if ((dominio.Usuario)Session["usuario"] != null && ((dominio.Usuario)Session["usuario"]).TipoUsuario == dominio.TipoUsuario.ADMIN)
                    {  %>
                <asp:Button ID="btnLogueoAdmin" runat="server" Text="Ingresar" CssClass="btn btn-primary" OnClick="btnLogueoAdmin_Click" />
                <p>Tenes que ser Admin para ingresar</p>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
