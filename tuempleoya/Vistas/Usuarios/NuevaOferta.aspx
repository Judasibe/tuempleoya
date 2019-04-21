<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/NoLeftMenu.Master" AutoEventWireup="true" CodeBehind="NuevaOferta.aspx.cs" Inherits="tuempleoya.Vistas.Usuarios.NuevaOferta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <div class="panel panel-primary">
        <div class="panel-heading"> Datos De la Oferta </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-12 col-md-4">
                    <div class="form-group">
                        <label>Titulo</label>
                        <asp:TextBox runat="server" CssClass="form-control" ClientIDMode="Static" ID="txtTitulo" />
                    </div>
                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="form-group">
                        <label>Valor</label>
                        <asp:TextBox ID="txtValor" type="Number" runat="server" CssClass="form-control" ClientIDMode="Static" />
                    </div>
                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="form-group">
                        <label>Categoria</label>
                        <asp:DropDownList runat="server" ID="drpCategorias" ClientIDMode="Static" CssClass="form-control" />
                    </div>
                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="form-group">
                        <label>Tiempo</label>
                        <asp:TextBox runat="server" ID="txtTiempo" ClientIDMode="Static" CssClass="form-control" />
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="form-group">
                        <label>Descripcion</label>
                        <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" Rows="2" runat="server" CssClass="form-control" ClientIDMode="Static" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <asp:Button runat="server" Text="Guardar" ID="btnGuardarOfera" ClientIDMode="Static" CssClass="btn btn-success" OnClick="btnGuardarOfera_Click" />
                    <a href="../Usuarios/Ofertas.aspx" class="btn btn-default">Regresar</a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-primary" runat="server" id="pnlNecesidades" visible="false">
                <div class="panel-heading"> Requisitos de la Oferta </div>
                <div class="panel-body">
                    <div class="row" style="padding-bottom: 20px;">
                        <div class="col-xs-12">
                            <a id="btnNuvoRequerimiento" class="btn btn-success" data-toggle="modal" data-target="#modalNuevo">
                               Nuevo Requisito
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <asp:UpdatePanel runat="server" ID="pnlRequisitos" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:DataGrid runat="server" ID="gridSkills" CssClass="table table-striped table-condensed" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundColumn DataField="Skills" HeaderText="Requisito" />
                                            <asp:BoundColumn DataField="OfertaSkill" HeaderText="Requisito Minimo" />
                                        </Columns>
                                    </asp:DataGrid>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-primary" runat="server" id="divAspirante" visible="false">
                <div class="panel-heading"> Usuarios Aspirntes </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <asp:UpdatePanel runat="server" ID="pnlAspiramtes" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:DataGrid runat="server" ID="gridAspirantes" CssClass="table table-striped table-condensed" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundColumn DataField="Usuario" HeaderText="Usuario" />
                                            <asp:BoundColumn DataField="NombreUsuario" HeaderText="Nombre de Usuario" />
                                            <asp:BoundColumn DataField="Email" HeaderText="Correo Electronico" />
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <asp:Button runat="server" Text="Eliminar" CssClass="btn btn-danger" ID="QuitarAspirante" CommandArgument='<%#Eval("ID") %>' 
                                                        OnClick="QuitarAspirante_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade bs-example-modal-lg" id="modalNuevo" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <asp:UpdatePanel runat="server" ID="upNuevoModal" UpdateMode="Conditional">
                    <Triggers>
                    </Triggers>
                    <ContentTemplate>
                        <div class="modal-header">
                            <h4 class="modal-title">
                                <asp:Label runat="server" ID="lblNuevo" Text="Agregar Nuevo Requerimiento" />
                            </h4>
                            <button type="button" class="close" data-dismiss="modal" id="btncerrarmodal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-xs-12">
                                    <asp:HiddenField runat="server" ID="HdnOfertaSkill" ClientIDMode="Static" />
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Requerimiento</label>
                                        <asp:DropDownList runat="server" ID="drpRquerimientos" CssClass="form-control" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <div class="form-group">
                                        <label>Requerimiento Minimo</label>
                                        <asp:TextBox runat="server" ID="txtMinimo" CssClass="form-control" ClientIDMode="Static" />
                                    </div>
                                </div>
                            </div>                          
                            <div class="row">
                                <div class="col-xs-12">
                                    <asp:Button runat="server" ID="btnGuardarSkill" ClientIDMode="Static" CssClass="btn btn-success" Text="Guardar" OnClientClick="MostrarModalCargando();" OnClick="btnGuardarSkill_Click" />
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>    
    <script>
        function CerrarModal()
        {
            CerrarNotifyCargando();
            $('#btncerrarmodal').click();
        }
    </script>
</asp:Content>
