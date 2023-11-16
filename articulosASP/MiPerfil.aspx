<%@ Page Title="" Language="C#" MasterPageFile="~/base.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="articulosASP.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validacion {
            color: red;
            font-size: 14px;
        }
    </style>
    <script>
        function validar() {
            //capturar el control
            const txtNombre = document.getElementById("txtNombre");
            if (txtNombre.value == "") {
                //Con esta intruccion puedo agregar clases de bootstrap o cualquier otra a un control
                //Con classList.Remove puedo removerlas
                txtNombre.classList.add("is-invalid");
                alert("Debes cargar el nombre");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <hr />
    <h2>Mi Perfil</h2>
    <div class="row">
        <div class="col-4">
            <div class="mb-3">
                <label for="txtEmail" class="form-label">E-Mail</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                
               <%-- 
                Con ClienIDMode puedo volver el id de un elemento en estatico,
                para que no cambie de nombre al convertirse a HTML, y de esta manera
                puedo manipularlo con Javascript en el navegador en tiempo de ejecucion.
                   Esto lo hago en la etiqueta SCRIPT, y en este ejemplo valido
                   que el nombre no este vacio--%>
                <asp:TextBox ID="txtNombre" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>

            
                
                
                <%--Validacion mediante ASP - Requiere agregar configuracion de jQuery
                de dos maneras. En el archivo Web.config o en el Global.asax
                    Estas validaciones utilizan Javascript y para que funcionen necesita
                    que registremos un script--%>
                <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="Debes completar este campo" ControlToValidate="txtNombre" runat="server" />

            </div>
            <div class="mb-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                <%--VALIDACIONES CON RANGEVALIDATOR Y REGULAREXPRESSION VALIDATOR--%>
                <%--Con RangeValidator puedo validar si un campo esta dentro de un minimo y un maximo--%>
                <asp:RangeValidator ErrorMessage="Fuera de rango" ControlToValidate="txtApellido" runat="server" Type="Integer" MinimumValue="1" MaximumValue="20" />

                <%--Con RegularExpressionValidator puedo validar si un campo cumple con la expresion regular
                que le ingrese. Las expresiones regulares se pueden googlear segun lo que necesito
                    Ejemplos:

                Expresiones Regulares
                Sólo Números
                ^[0-9]+$

                Formato Email
                ^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$--%>

                <asp:RegularExpressionValidator ErrorMessage="Solo números" ControlToValidate="txtApellido" runat="server" ValidationExpression="^[0-9]+$" />


            </div>
            <div class="mb-3">
                <label for="txtFechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" TextMode="date"></asp:TextBox>
            </div>
        </div>
        <div class="col-4">
            <div class="mb-3">
                <label class="form-label">Imagen Perfil</label>
                <input type="file" id="txtImagen" class="form-control" runat="server" />
            </div>
            <asp:Image ID="imgNuevoPerfil" runat="server" CssClass="img-fluid mb-3" ImageUrl="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/310px-Placeholder_view_vector.svg.png" />
        </div>
        <div class="row">
            <div class="col-md-4">
                
               <%-- En el OnClientClick disparo la funcion validar de JavaScript. Este evento
                sucede antes de ejecutarse el Onclick--%>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClientClick="return validar()" OnClick="btnGuardar_Click" />
                <a href="/">Regresar</a>
            </div>
        </div>
    </div>
</asp:Content>
