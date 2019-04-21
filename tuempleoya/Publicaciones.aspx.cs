namespace tuempleoya
{
    using System;
    using System.Data;
    using tuempleoya.Controladores.Usuarios;
    using tuempleoya.Vistas;

    public partial class Publicaciones : BaseVistas
    {
        Publicacion Controller;
        public Publicaciones()
        {
            this.Controller = new Publicacion();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string publicacion = ObtenerValor(Request["publicacion"]);
                    if (string.IsNullOrWhiteSpace(publicacion))
                    {
                        AbrirEnlace("/");
                    }
                    else
                    {
                        DataSet ds = Controller.BuscarPublicacionAll(publicacion);
                        DataRow drPublicacion = ds.Tables[0].Rows[0];

                        litTitulo.Text = ObtenerValor(drPublicacion["Titulo"]);
                        txtDescripcion.Text = ObtenerValor(drPublicacion["Descripcion"]);
                        txtValor.Text = ObtenerValor(drPublicacion["Valor"]);
                        txtTiempo.Text = ObtenerValor(drPublicacion["Tiempo"]);
                        txtCategoria.Text = ObtenerValor(drPublicacion["Categoria"]);
                        lblNombreEmpresa.Text = ObtenerValor(drPublicacion["Empresa"]);

                        string img = ObtenerValor(drPublicacion["Imagen"]);
                        if (string.IsNullOrWhiteSpace(img))
                        {
                            imgempresa.ImageUrl = "/Images/Empresas/LogoGenerico.png";
                        }
                        else
                        {
                            imgempresa.ImageUrl = img;
                        }

                        repeterRequisitos.DataSource = ds.Tables[1];
                        repeterRequisitos.DataBind();
                    }

                    string usuario = ObtenerValor(Session["IdUsuario"]);
                    if (!string.IsNullOrWhiteSpace(usuario))
                    {
                        if (Session["TipoUsuario"].ToString().Equals("Usuario"))
                        {
                            btnAspirarOferta.Visible = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MostrarMensaje(ex);
                }
            }
        }

        protected void btnAspirarOferta_Click(object sender, EventArgs e)
        {
            try
            {
                string user = ObtenerValor(Session["IdUsuario"]);
                string publicacion = ObtenerValor(Request["publicacion"]);

                Controller.AspirarOferta(user, publicacion);
                LlamarFuncionJs("MostrarMensajeAspirarOk();");
            }
            catch (Exception ex)
            {
                MostrarMensaje(ex);
            }
        }
    }
}