<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Administrador.Master" AutoEventWireup="true" CodeBehind="NuevaCategoria.aspx.cs" Inherits="tuempleoya.Vistas.Usuarios.Administrador.NuevaCategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Label runat="server" CssClass="h4" Text="Nueva Categoria" ID="lblTitle" />

    <br />
    <br />
    <br />
    
    <div class="panel panel-primary">
        <div class="panel-heading"> Datos De la Categoria </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <asp:UpdatePanel runat="server" ID="pnlNuevaCategoria" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-group">
                                <label>Categoria</label>
                                <asp:TextBox runat="server" ID="txtCartegoria" ClientIDMode="Static" CssClass="form-control" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGuardarCategoria" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="col-xs-12 col-md-12" >
                    <asp:Button runat="server" OnClientClick="MostrarModalCargando();" ID="btnGuardarCategoria" ClientIDMode="Static" CssClass="btn btn-success" Text="Guardar"
                         OnClick="btnGuardarCategoria_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
