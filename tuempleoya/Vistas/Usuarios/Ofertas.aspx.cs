namespace tuempleoya.Vistas.Usuarios
{
    using System;
    using System.Data;
    using System.Web.UI.WebControls;
    using tuempleoya.Controladores.Administrador;

    public partial class Ofertas : BaseVistas
    {   
        private Oferta Controlador;
        public Ofertas ()
	    {
            this.Controlador = new Oferta();
	    }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TipoUsuario"] == null || !Session["TipoUsuario"].ToString().Equals("Empresa"))
            {
                this.AbrirEnlace("/");
            }
            string empresa = Session["IdUsuario"].ToString();
            repeaterOfertas.DataSource = Controlador.MostrarOferta(empresa: empresa);
            repeaterOfertas.DataBind();
        }

        protected void btnEliminarOferta_Click(object sender, EventArgs e)
        {
            object id = ((LinkButton)sender).CommandArgument;
            repeaterOfertas.DataSource = Controlador.EliminarOferta(id);
            repeaterOfertas.DataBind();
            pnlOfertas.Update();
        }
    }
}