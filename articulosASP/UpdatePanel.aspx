<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="UpdatePanel.aspx.cs" Inherits="articulosASP.UpdatePanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Update Panel</h1>

    <%--Requerido para usar UpdatePanel--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <label>Nombre</label>
            <asp:TextBox runat="server" ID="txtNombre" OnTextChanged="txtNombre_TextChanged" AutoPostBack="true" />
            <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
