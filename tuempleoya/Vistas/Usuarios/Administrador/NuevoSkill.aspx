<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Administrador.Master" AutoEventWireup="true" CodeBehind="NuevoSkill.aspx.cs" Inherits="tuempleoya.Vistas.Usuarios.Administrador.NuevoSkill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Label runat="server" CssClass="h4" Text="Nuevo Skill" ID="lblTitle" />

    <br />
    <br />
    <br />
    
    <div class="panel panel-primary">
        <div class="panel-heading"> Datos Del Skill </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <asp:UpdatePanel runat="server" ID="pnlNuevoSkill" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-group">
                                <label>Skill</label>
                                <asp:TextBox runat="server" ID="txtSkill" ClientIDMode="Static" CssClass="form-control" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnguardarSkill" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="col-xs-12 col-md-12" >
                    <asp:Button runat="server" OnClientClick="MostrarModalCargando();" ID="btnGuardarSkill" ClientIDMode="Static" CssClass="btn btn-success" Text="Guardar"
                         OnClick="btnGuardarSkill_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
