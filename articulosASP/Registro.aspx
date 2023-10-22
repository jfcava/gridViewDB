<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="articulosASP.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-4">
            <hr />
            <h2>Creá tu perfil</h2>
            <div class="mb-3">
                <label for="txtEmail" class="form-label">E-Mail</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <asp:Button Text="Registrarse" runat="server" ID="btnRegistrarse" CssClass="btn btn-primary" OnClick="btnRegistrarse_Click"/>
            <a href="/">Cancelar</a>
        </div>
    </div>
</asp:Content>
