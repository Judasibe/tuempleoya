namespace tuempleoya.Vistas.Usuarios
{
    using System;
    using System.Data;
    using System.Web.UI.WebControls;
    using tuempleoya.Controladores.Administrador;

    public partial class NuevaOferta : BaseVistas
    {
        private Oferta Controlador;
        public NuevaOferta()
        {
            this.Controlador = new Oferta();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    if (Session["TipoUsuario"] == null || !Session["TipoUsuario"].ToString().Equals("Empresa"))
                    {
                        this.AbrirEnlace("/");
                    }
                    
                    string id = this.ObtenerValor(Request["id"]);

                    drpCategorias.DataSource = Controlador.BuscarCategorias();
                    drpCategorias.DataTextField = "Nombre";
                    drpCategorias.DataValueField = "ID";
                    drpCategorias.DataBind();
                    if (!string.IsNullOrWhiteSpace(id))
                    {
                        DataSet ds = Controlador.MostrarOferta(id);
                        DataRow dr = ds.Tables[0].Rows[0];
                        txtTitulo.Text = ObtenerValor(dr["Titulo"]);
                        txtDescripcion.Text = ObtenerValor(dr["Descripcion"]);
                        txtValor.Text = ObtenerValor(dr["Valor"]);
                        txtTiempo.Text = ObtenerValor(dr["Tiempo"]);
                        drpCategorias.SelectedValue = ObtenerValor(dr["idCategoria"]);

                        pnlNecesidades.Visible = true;
                        divAspirante.Visible = true;

                        LoadTable(ds.Tables[1]);
                        LoadTableAspirante(ds.Tables[2]);

                        drpRquerimientos.DataSource = Controlador.MostrarSkill();
                        drpRquerimientos.DataTextField = "Nombre";
                        drpRquerimientos.DataValueField = "ID";
                        drpRquerimientos.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    this.MostrarMensaje(ex);
                }
            }
        }

        protected void btnGuardarOfera_Click(object sender, EventArgs e)
        {
            try
            {
                string id = this.ObtenerValor(Request["id"]);
                object titulo = this.txtTitulo.Text;
                object descripcion = this.txtDescripcion.Text;
                object valor = this.txtValor.Text;
                object tiempo = this.txtTiempo.Text;
                object categoria = this.drpCategorias.SelectedValue;

                if (string.IsNullOrEmpty(id)) {
                    string empresa = Session["IdUsuario"].ToString();
                    id = ObtenerValor(Controlador.NuevaOferta(empresa, titulo, descripcion, valor, tiempo, categoria));
                }
                else {
                    Controlador.ModificarOferta(id, titulo, descripcion, valor, tiempo, categoria);
                }

                this.AbrirEnlace("NuevaOferta.aspx?id=" + id);
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }

        protected void btnGuardarSkill_Click(object sender, EventArgs e)
        {
            try
            {
                string id = this.ObtenerValor(Request["id"]);
                if (!string.IsNullOrWhiteSpace(id)) 
                {
                    object idskill = drpRquerimientos.SelectedValue;
                    object minimo = txtMinimo.Text;
                    string idskilloferta = HdnOfertaSkill.Value;
                    if (string.IsNullOrWhiteSpace(idskilloferta)) {
                        LoadTable(Controlador.AgregarSkilOferta(idskill, id, minimo).Tables[0]);
                    }
                    else {
                        LoadTable(Controlador.ModificarSkilOferta(idskilloferta, idskill, id, minimo).Tables[0]);
                    }

                    this.LlamarFuncionJs("CerrarModal()");
                }
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }

        private void LoadTable(DataTable dt)
        {
            gridSkills.DataSource = dt;
            gridSkills.DataBind();
            pnlRequisitos.Update();
        }

        protected void QuitarAspirante_Click(object sender, EventArgs e)
        {
            object usuariooferta = ((LinkButton)sender).CommandArgument;
            LoadTableAspirante(Controlador.EliminarAspiranter(usuariooferta));
        }

        private void LoadTableAspirante(DataTable dt) 
        {
            gridAspirantes.DataSource = dt;
            gridAspirantes.DataBind();
            pnlAspiramtes.Update();
        }
    }
}