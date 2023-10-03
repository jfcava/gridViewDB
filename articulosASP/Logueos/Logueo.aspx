<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="Logueo.aspx.cs" Inherits="articulosASP.Logueo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-6">
        <div class="mb-3">
            <label class="form-label">Usuario</label>
            <asp:TextBox runat="server" id="txtUsuario" cssclass="form-control"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <asp:TextBox runat="server" id="txtPassword" cssclass="form-control" textMode="password"></asp:TextBox>
        </div>
        <asp:Button runat="server" Text="Ingresar" CssClass="btn btn-primary" id="btnIngresar" OnClick="btnIngresar_Click" />
    </div>
</asp:Content>
