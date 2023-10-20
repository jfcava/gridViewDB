<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="EnvioMail.aspx.cs" Inherits="articulosASP.EnvioMail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <hr />
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="mb-3">
                <label for="txtEmail" class="form-label">E-Mail</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtAsunto" class="form-label">Asunto</label>
                <asp:TextBox ID="txtAsunto" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtMensaje" class="form-label">Mensaje</label>
                <asp:TextBox ID="txtMensaje" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" onclick="btnEnviar_Click" CssClass="btn btn-primary"/>
        </div>
        <div class="col-3"></div>
    </div>
</asp:Content>
