<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="tuempleoya.Vistas.Login" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <link href="/login/bootstrap-4.min.css" rel="stylesheet" />
    <link href="/login/alertify.min.css" rel="stylesheet" />
    <link href="/login/custom.css" rel="stylesheet" />

    <script src="/login/jquery-3.3.1.min.js"></script>
    <link href="/login/jquery-ui.min.css" rel="stylesheet" />
    <style>
        body{
            padding-top: 0px;
        }
    </style>
  </head>
  <body>
      <form id="Form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
            </Scripts>
        </asp:ScriptManager> 
        <div class="page-holder d-flex align-items-center">
          <div class="container">
            <div class="row align-items-center justify-content-md-center py-5">
              <div class="col-lg-5 px-lg-10">
                <h2 class="mb-4"><asp:Label runat="server" ID="lblBienvenido" Text="Bienvenidos" /></h2>
                  <asp:Login runat="server" ID="lgLoin" EnableViewState="false" OnAuthenticate="lgLoin_Authenticate" Width="100%">
                      <LayoutTemplate>
                          <div class="form-group mb-4">
                              <asp:TextBox runat="server" ID="UserName" CssClass="form-control border-0 shadow form-control-lg" />
                          </div>
                          <div class="form-group mb-4">
                              <asp:TextBox runat="server" AutoPostBack="true" ID="Password" CssClass="form-control border-0 shadow form-control-lg text-violet" TextMode="Password" />
                          </div>
                          <asp:Button CommandName="Login" runat="server" CssClass="btn btn-primary shadow px-5" ID="btnIniciarSesion" Text="Inicar Sesion" />
                          <a class="btn btn-success" href="/" >Volver al  Inicio</a>
                      </LayoutTemplate>
                  </asp:Login>
                  <br />    
                  <asp:UpdatePanel runat="server" ID="upLogin" UpdateMode="Conditional" ChildrenAsTriggers="true">
                      <Triggers>
                          <asp:AsyncPostBackTrigger ControlID="lgLoin" />
                      </Triggers>
                      <ContentTemplate>
                           <asp:UpdateProgress runat="server" ID="uUno">
                               <ProgressTemplate>
                                   <div class="col-xs-12 text-center">
                                        <div class="spinner-border" role="status">
                                            <span class="sr-only">Loading...</span>
                                        </div>
                                    </div>
                               </ProgressTemplate>
                           </asp:UpdateProgress>
                      </ContentTemplate>
                  </asp:UpdatePanel>                  
              </div>
            </div>
          </div>
        </div>
        <script src="/login/bootstrap-4.min.js"></script>
        <script src="/login/notify.min.js"></script>
        <script src="/login/alertify.min.js"></script>
        <div id="dialog" title="File Download">
            <div id="progressbar"></div>
        </div >
        <script src="/login/Comom.js"></script>
    </form>
  </body>
</html>