<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Administrador.Master" AutoEventWireup="true" CodeBehind="Empresas.aspx.cs" Inherits="tuempleoya.Vistas.Usuarios.Administrador.Empresas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <a class="btn btn-success" href="NuevaEmpresa.aspx">
            Nueva Empresa
        </a>
    </div>
    
    <br />
    <div class="row">
        <div class="col-xs-12">
            <asp:UpdatePanel runat="server" ID="pnlEmpresas" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:DataGrid runat="server" ID="gridEmpresas" CssClass="table table-striped table-condensed" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundColumn DataField="Nombre" HeaderText="Empresa" />
                            <asp:BoundColumn DataField="Celular" HeaderText="Celular" />
                            <asp:BoundColumn DataField="Email" HeaderText="Correo Electronico" />
                            <asp:BoundColumn DataField="Categoria" HeaderText="Categoria" />
                            <asp:BoundColumn DataField="Usuario" HeaderText="Nombre de Usuario" />
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="btnEliminarEmpresa" CssClass="btn btn-danger" OnClick="btnEliminarEmpresa_Click"
                                        CommandArgument='<%#Eval("ID") %>' ClientIDMode="Static" Text="Eliminar" />
                                    <a class="btn btn-info" href='/Vistas/Usuarios/Administrador/NuevaEmpresa.aspx?id=<%#Eval("ID") %>' >Editar</a>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>

