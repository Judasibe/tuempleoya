<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/NoLeftMenu.Master" AutoEventWireup="true" CodeBehind="Publicaciones.aspx.cs" Inherits="tuempleoya.Publicaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-xs-12 col-md-8">
                    <h2><asp:Literal runat="server" ID="litTitulo" /></h2>
                </div>
                <div class="col-xs-12 col-md-4" >
                    <asp:Button runat="server" ID="btnAspirarOferta" CssClass="btn btn-success" ClientIDMode="Static"  Text="Aspirar A la Oferta" Visible="false"
                                OnClick="btnAspirarOferta_Click" OnClientClick="MostrarModalCargando()" />
                </div>
            </div>
        </div>
        <div class="col-xs-12">
            <div class="row">
                <div class="col-xs-12 col-md-8">
                    <div class="panel panel-primary">
                        <div class="panel-heading"> Descripción </div>
                        <div class="panel-body">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtDescripcion" TextMode="MultiLine" Rows="5" ClientIDMode="Static" Enabled="false" />
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading"> Datos </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label><b>Valor</b></label>
                                        <asp:TextBox runat="server" ID="txtValor" CssClass="form-control" Enabled="false" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label><b>Tiempo</b></label>
                                        <asp:TextBox runat="server" ID="txtTiempo" CssClass="form-control" Enabled="false" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label><b>Categoria</b></label>
                                        <asp:TextBox runat="server" ID="txtCategoria" CssClass="form-control" Enabled="false" ClientIDMode="Static" />
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>  
                </div>

                <div class="col-xs-12 col-md-4">
                    <div class="row">
                        <div class="col-xs-12">
                            <asp:Image runat="server" ID="imgempresa" CssClass="img-circle img-responsive"  />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <asp:Label runat="server" ID="lblNombreEmpresa" CssClass="alert alert-info text-center" Width="100%" />
                        </div>
                    </div>
                    <div class="row">
                        <asp:Repeater runat="server" ID="repeterRequisitos">
                            <HeaderTemplate>
                                <div class="panel panel-primary">
                                    <div class="panel-heading"> Requisitos </div>
                                    <div class="panel-body">

                            </HeaderTemplate>
                            <ItemTemplate>
                                         <div class="form-group">
                                             <b><%#Eval("Skill") %>:</b> <%#Eval("Minimo") %>
                                         </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                    </div>
                                </div>

                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function MostrarMensajeAspirarOk()
        {
            LlamarAlert('Usted ya está aplicando satisfactoriamente a esta oferta', 'success');
        }
    </script>
</asp:Content>
