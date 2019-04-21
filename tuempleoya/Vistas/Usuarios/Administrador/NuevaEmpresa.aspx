<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Administrador.Master" AutoEventWireup="true" CodeBehind="NuevaEmpresa.aspx.cs" Inherits="tuempleoya.Vistas.Usuarios.Administrador.NuevaEmpresa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Label runat="server" CssClass="h4" Text="Nueva Empresa" ID="lblTitle" />

    <br />
    <br />
    <br />
    
    <div class="panel panel-primary">
        <div class="panel-heading"> Datos De la Empresa </div>
        <div class="panel-body">
            <asp:UpdatePanel runat="server" ID="pnlDatos" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <label>Nombre Empresa</label>
                                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" ClientIDMode="Static" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <label>Email</label>
                                <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control" ClientIDMode="Static" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <label>Celular</label>
                                <asp:TextBox runat="server" ID="txtCelular" CssClass="form-control" ClientIDMode="Static" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <label>Telefono</label>
                                <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" ClientIDMode="Static" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <label>Categoria</label>
                                <asp:DropDownList runat="server" ID="drpCategorias" CssClass="form-control" ClientIDMode="Static" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <label>Usuario</label>
                                <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" ClientIDMode="Static" />
                            </div>
                        </div>

                        <div runat="server"  id="divPass">
                            <div class="col-xs-12 col-md-4">
                                <div class="form-group">
                                    <label>Contraseña</label>
                                    <asp:TextBox runat="server" ID="txtClave" CssClass="form-control" ClientIDMode="Static" TextMode="Password" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-4">
                                <div class="form-group">
                                    <label>Confirmación</label>
                                    <asp:TextBox runat="server" ID="txtConfirmacion" CssClass="form-control" ClientIDMode="Static"  TextMode="Password"/>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-4">
                                <label>Imagen</label>
                                <asp:FileUpload runat="server" ID="imgImagen" CssClass="form-control" accept="image/*" />
                            </div>
                        </div>

                        <div class="col-xs-12">
                            <div class="form-group">
                                <label>Descripción</label>
                                <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" ClientIDMode="Static" 
                                             TextMode="MultiLine" Rows="3" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnGuardarEmpresa" />
                </Triggers>
            </asp:UpdatePanel>
            <div class="row">
                <div class="col-xs-12">
                    <asp:Button runat="server" OnClientClick="MostrarModalCargando();" ID="btnGuardarEmpresa" ClientIDMode="Static" Text="Guardar"
                        CssClass="btn btn-success" OnClick="btnGuardarEmpresa_Click" />
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
