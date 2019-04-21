namespace tuempleoya.Vistas.Usuarios.Administrador
{
    using System;
    using System.Web.UI.WebControls;
    using tuempleoya.Controladores.Administrador;

    public partial class Skills : BaseVistas
    {
        private Oferta Controlador;
        public Skills()
        {
            Controlador = new Oferta();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                gridSkill.DataSource = Controlador.MostrarSkill();
                gridSkill.DataBind();
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }

        protected void btnEliminarSkill_Click(object sender, EventArgs e)
        {
            try
            {
                object id = ((LinkButton)sender).CommandArgument;
                gridSkill.DataSource = Controlador.EliminarSkill(id);
                gridSkill.DataBind();
                pnlSkill.Update();
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }
    }
}