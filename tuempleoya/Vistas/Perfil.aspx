<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/NoLeftMenu.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="tuempleoya.Vistas.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-primary">
                <div class="panel-heading"> Hoja de Vida </div>
                <div class="panel-body">
                    <div class="row" style="padding-bottom:15px;">
                        <asp:UpdatePanel runat="server" ID="updateHojaVida" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="col-xs-12">
                                    <a target="_blank" runat="server" href="" id="aHojaVida">Hoja de Vida</a>
                                    <asp:FileUpload runat="server" ID="fuArchivo" accept="*.pdf" />
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnSubirArchivo" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <asp:Button runat="server" ID="btnSubirArchivo" Text="Actualizar Hoja de Vida" CssClass="btn btn-success" ClientIDMode="Static" OnClick="btnSubirArchivo_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-primary">
                <div class="panel-heading"> Lista de Ofertas que aspiras </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <asp:DataGrid runat="server" ID="gridOfertas"  CssClass="table table-striped table-condensed" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundColumn DataField="Nombre" HeaderText="Empresa" />
                                    <asp:BoundColumn DataField="Titulo" HeaderText="Oferta" />
                                    <asp:BoundColumn DataField="Estado" HeaderText="Estado" />
                                </Columns>
                            </asp:DataGrid>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
