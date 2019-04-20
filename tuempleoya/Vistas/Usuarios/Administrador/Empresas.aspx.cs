namespace tuempleoya.Vistas.Usuarios.Administrador
{
    using System;
    using System.Web.UI.WebControls;
    using tuempleoya.Controladores.Administrador;

    public partial class Empresas : BaseVistas
    {
        private Empresa Controlador;
        public Empresas()
        {
            this.Controlador = new Empresa();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                gridEmpresas.DataSource = this.Controlador.MostrarEmpresa();
                gridEmpresas.DataBind();
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }

        protected void btnEliminarEmpresa_Click(object sender, EventArgs e)
        {
            try
            {
                object id = ((LinkButton)sender).CommandArgument;
                gridEmpresas.DataSource = Controlador.EliminarEmpresa(id);
                gridEmpresas.DataBind();
                pnlEmpresas.Update();
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }
    }
}