<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="DropDownListEnlazados.aspx.cs" Inherits="articulosASP.DrowDownListEnlazados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>DropDownList Enlazados</h2>
    <div class="row">
        <div class="col">
            <asp:DropDownList ID="ddlCategoria" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>
        </div>
        <div class="col">
            <asp:DropDownList ID="ddlArticulos" runat="server"></asp:DropDownList>
        </div>
    </div>
</asp:Content>
