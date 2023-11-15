<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="LoginPosta.aspx.cs" Inherits="articulosASP.LoginPosta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-4">
        <hr />
        <h2>Login</h2>
        <div class="mb-3">
            <label class="form-label">Usuario</label>
           
            <%--La etiqueta REQUIRED, indica que un campo es requerido, pero
            es una validacion que realiza HTML. No tiene mucha seguridad--%>
            <asp:TextBox runat="server" id="txtUsuario" cssclass="form-control" ></asp:TextBox>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <asp:TextBox runat="server" id="txtPassword" cssclass="form-control" textMode="password"></asp:TextBox>
        </div>
        <asp:Button runat="server" Text="Ingresar" CssClass="btn btn-primary" id="btnLogin" onclick="btnLogin_Click"/>
    </div>
</asp:Content>
