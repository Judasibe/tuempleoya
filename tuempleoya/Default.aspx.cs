namespace tuempleoya
{
    using System;
    using tuempleoya.Controladores.Usuarios;
    using tuempleoya.Vistas;

    public partial class Default : BaseVistas
    {
        Publicacion Controller;
        public Default()
        {
            Controller = new Publicacion();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            object categoria = Request["categoria"];
            repeaterPublicaciones.DataSource = Controller.MostrarTodasLasPublicaciones(categoria);
            repeaterPublicaciones.DataBind();
        }
    }
}