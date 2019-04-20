<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/NoLeftMenu.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="tuempleoya.Vistas.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <div class="row">
        <div class="col-xs-12 col-sm-4">
            <asp:Label runat="server" CssClass="h4" Text="Nuevo Usuario" ID="lblTitle" />
        </div>
        <div class="col-xs-12 col-sm-8">
            <asp:Button runat="server" OnClientClick="MostrarModalCargando();" ID="btnGuardarUsuario" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardarUsuario_Click" ClientIDMode="Static" />
        </div>
    </div>
    <br />
    <div class="panel panel-primary">
        <div class="panel-heading"> Datos Personales </div>
        <div class="panel-body">
            <asp:UpdatePanel runat="server" ID="pnlRegistroUsuario" UpdateMode="Conditional">
                <ContentTemplate>
                <div class="row">
                    <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                            <label>Nombre</label>
                            <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" ClientIDMode="Static" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                            <label>Apellidos</label>
                            <asp:TextBox runat="server" ID="txtApellidos" CssClass="form-control" ClientIDMode="Static" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                            <label>Correo Electronico</label>
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" ClientIDMode="Static" type="email" />
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4">
                        <div class="form-group">
                            <label>Celular</label>
                            <asp:TextBox runat="server" ID="txtCelular" CssClass="form-control" ClientIDMode="Static" type="Number" />
                        </div>
                    </div>
                </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnGuardarUsuario" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading"> Datos de Usuario </div>
        <div class="panel-body">
            <asp:UpdatePanel runat="server" ID="pnlDatosUsuario" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <label>Usuario</label>
                                <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" ClientIDMode="Static" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <label>Contraseña</label>
                                <asp:TextBox runat="server" ID="txtClave" CssClass="form-control" ClientIDMode="Static" TextMode="Password" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <label>Confirmación</label>
                                <asp:TextBox runat="server" ID="txtConfirmacion" CssClass="form-control" ClientIDMode="Static" TextMode="Password" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>
