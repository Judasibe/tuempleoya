<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Administrador.Master" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="tuempleoya.Vistas.Usuarios.Administrador.Categorias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <a class="btn btn-success" href="NuevaCategoria.aspx">
            Nueva Categoria
        </a>
    </div>

    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:UpdatePanel runat="server" ID="pnlCategorias" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:DataGrid runat="server" ID="gridCategorias" CssClass="table table-striped table-condensed" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundColumn DataField="ID" HeaderText="Identificador" ItemStyle-Width="25%"/>
                            <asp:BoundColumn DataField="Nombre" HeaderText="Categoria" ItemStyle-Width="50%" />
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="btnEliminarCategoria" CssClass="btn btn-danger" 
                                        CommandArgument='<%#Eval("ID") %>' ClientIDMode="Static" Text="Eliminar" OnClick="btnEliminarCategoria_Click" />
                                    <a class="btn btn-info" href='/Vistas/Usuarios/Administrador/NuevaCategoria.aspx?id=<%#Eval("ID") %>' >Editar</a>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    
    
</asp:Content>
