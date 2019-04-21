<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/NoLeftMenu.Master" AutoEventWireup="true" CodeBehind="Ofertas.aspx.cs" Inherits="tuempleoya.Vistas.Usuarios.Ofertas" %>
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
                                <asp:Repeater runat="server" ID="repeaterOfertas">
                                    <ItemTemplate>
                                        <div class="col-xs-12 col-md-4">
                                            <div class="panel panel-info" style="height:250px;">
                                                <div class="panel-heading"> 
                                                    <a href='/Vistas/Usuarios/NuevaOferta.aspx?id=<%#Eval("ID") %>'> <%#Eval("Titulo") %> </a>
                                                    <asp:LinkButton runat="server" ID="btnEliminarOferta" ClientIDMode="Static" CssClass="btn btn-default close" OnClick="btnEliminarOferta_Click" CommandArgument='<%#Eval("ID") %>'>
                                                        <span style="font-size: 10px;color:black;" class="close">X</span>
                                                    </asp:LinkButton>
                                                </div>
                                                <div class="panel-body">
                                                   <p> <b>Decripción</b> <br /> <%#Eval("Descripcion") %>   </p>
                                                   <p> <b>Sueldo:</b> <%#Eval("Valor") %>         </p>
                                                   <p> <b>Categoria:</b> <br /> <%#Eval("Categoria") %>   </p>
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
