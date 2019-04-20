namespace tuempleoya.Vistas.Usuarios.Administrador
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using tuempleoya.Controladores.Administrador;

    public partial class Categorias : BaseVistas
    {
        private Categoria Controlador;
        public Categorias()
        {
            Controlador = new Categoria();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                gridCategorias.DataSource = Controlador.MostrarCategoria();
                gridCategorias.DataBind();
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }

        protected void btnEliminarCategoria_Click(object sender, EventArgs e)
        {
            try
            {
                object id = ((LinkButton)sender).CommandArgument;
                gridCategorias.DataSource = Controlador.EliminarCategoria(id);
                gridCategorias.DataBind();
                pnlCategorias.Update();
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }
    }
}