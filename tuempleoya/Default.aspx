<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Maestra.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tuempleoya.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <asp:Repeater runat="server" ID="repeaterPublicaciones">
                    <ItemTemplate>
                        <div class="col-xs-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading"> <%#Eval("Titulo") %> - <%#Eval("Empresa") %></div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-12 col-md-10">
                                            <div class="form-group">
                                                <p><b>Descripción:</b> </p>
                                                <%#Eval("Descripcion") %>
                                            </div>
                                            <div class="form-grourp">
                                                <b>Valor:</b> <%#Eval("Valor") %>
                                            </div>
                                            <div class="form-grourp">
                                                <b>Tiempo:</b> <%#Eval("Tiempo") %>
                                            </div>
                                            <div class="form-grourp">
                                                <b>Categoria:</b> <%#Eval("Categoria") %>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-md-2" >
                                            <a href='Publicaciones.aspx?publicacion=<%#Eval("ID") %>' class="btn btn-info">Ver detalles</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    
</asp:Content>
