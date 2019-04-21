namespace tuempleoya.Layout
{
    using System;
    using tuempleoya.Vistas;

    public partial class Administrador : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["Usuario"] == null)
                {
                    Response.Redirect("/Vistas/Login.aspx");
                }
                else if (!(ObtenerValor(Session["TipoUsuario"]).Equals("Administrador")))
                {
                    if (!(ObtenerValor(Session["TipoUsuario"]).Equals("Empresa")))
                    {
                        Response.Redirect("/");
                    }
                    else {
                        Response.Redirect("/Vistas/Usuarios/Ofertas.aspx");
                    }
                }
            }
        }
        private string ObtenerValor(object obj) 
        {
            return obj == null ? string.Empty : obj.ToString();
        }
    }
}