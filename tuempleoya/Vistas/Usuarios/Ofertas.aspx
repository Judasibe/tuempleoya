<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Maestra.Master" AutoEventWireup="true" CodeBehind="Ofertas.aspx.cs" Inherits="tuempleoya.Vistas.Usuarios.Ofertas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-xs-12">
            <a class="btn btn-success" href="/Vistas/Usuarios/NuevaOferta.aspx">Nueva Oferta</a>
        </div>
    </div>

    <br />
    <br />
    <div class="panel panel-primary">
        <div class="panel-heading"> Publicaciones </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-12">
                    <div class="row">
                        <asp:UpdatePanel runat="server" ID="pnlOfertas" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Repeater runat="server" ID="repeater">
                                    <ItemTemplate>
                                        <div class="col-xs-12 col-sm-4 col-md-3">
                                            <div class="panel panel-info">
                                                <div class="panel-heading"> 
                                                    <%#Eval("Titulo") %>
                                                    <asp:LinkButton runat="server" CssClass="close" CommandArgument='<%#Eval("ID") %>' ID="Eliminar" OnClick="Eliminar_Click"/>
                                                </div>
                                                <div class="panel-body">
                                                    <%#Eval("Descripcion") %>
                                                    <%#Eval("Valor") %>
                                                    <%#Eval("Categoria") %>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
