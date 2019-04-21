namespace tuempleoya.Vistas
{
    using System;
    using System.Data;
    using System.Web;
    using System.Web.Security;
    using System.Web.SessionState;
    using System.Web.UI.WebControls;
    using tuempleoya.Controladores.Usuarios;


    public partial class Login : BaseVistas
    {
        private Usuario Controller;

        public Login()
        {
            Controller = new Usuario();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lgLoin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            try
            {
                uUno.Visible = true;
                DataRow dr = Controller.Loguearse(lgLoin.UserName, lgLoin.Password).Tables[0].Rows[0];

                SessionIDManager manager = new SessionIDManager();
                string newSessionId = manager.CreateSessionID(HttpContext.Current);
                FormsAuthentication.RedirectFromLoginPage(lgLoin.UserName, false);

                Session["Session"] = newSessionId;
                Session["IdUsuario"] = ObtenerValor(dr["idusuario"]);
                Session["Usuario"] = ObtenerValor(dr["usuario"]);
                Session["TipoUsuario"] = ObtenerValor(dr["tipousuario"]);

                AbrirEnlace("/Vistas/Usuarios/Administrador/Categorias.aspx");
            }
            catch (Exception ex)
            {
                MostrarMensaje(ex);
            }
        }
    }
}