<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Maestra.Master" AutoEventWireup="true" CodeBehind="NuevaOferta.aspx.cs" Inherits="tuempleoya.Vistas.Usuarios.NuevaOferta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />

    <div class="panel panel-primary">
        <div class="panel-heading"> Datos De la Categoria </div>
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
                        <label>Descripcion</label>
                        <asp:TextBox ID="TextBox2" TextMode="MultiLine" Rows="2" runat="server" CssClass="form-control" ClientIDMode="Static" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
