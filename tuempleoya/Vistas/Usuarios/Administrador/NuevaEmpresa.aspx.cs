namespace tuempleoya.Vistas.Usuarios.Administrador
{
    using System;
    using System.Data;
    using tuempleoya.Controladores.Administrador;

    public partial class NuevaEmpresa : BaseVistas
    {
        Empresa Controlador = new Empresa();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                try
                {
                    drpCategorias.DataSource = Controlador.MostrarCategoria();
                    drpCategorias.DataTextField = "Nombre";
                    drpCategorias.DataValueField = "ID";
                    drpCategorias.DataBind();

                    string id = this.ObtenerValor(Request["id"]);

                    if (!string.IsNullOrWhiteSpace(id))
                    {
                        DataRow dr = Controlador.MostrarEmpresa(id).Tables[0].Rows[0];
                        divPass.Visible = false;
                        txtNombre.Text = ObtenerValor(dr["Nombre"]);
                        txtCorreo.Text = ObtenerValor(dr["Email"]);
                        txtCelular.Text = ObtenerValor(dr["Celular"]);
                        txtTelefono.Text = ObtenerValor(dr["Telefono"]);
                        drpCategorias.SelectedValue = ObtenerValor(dr["IdCategoria"]);
                        txtDescripcion.Text = ObtenerValor(dr["Descripcion"]);
                        txtUsuario.Text = ObtenerValor(dr["Usuario"]);
                        lblTitle.Text = "Modificar Empresa";
                    }
                }
                catch (Exception ex)
                {
                    this.MostrarMensaje(ex);
                }
            }
        }

        protected void btnGuardarEmpresa_Click(object sender, EventArgs e)
        {
            try
            {
                object nombre = txtNombre.Text.ToUpper();
                object email = txtCorreo.Text;
                object celular = txtCelular.Text;
                object telefono = txtTelefono.Text;
                object categoria = drpCategorias.SelectedValue;
                object descripcion = txtDescripcion.Text;
                object usuario = txtUsuario.Text;

                string id = this.ObtenerValor(Request["id"]);

                if (string.IsNullOrWhiteSpace(id))
                {
                    object pass = txtClave.Text;
                    object confrm = txtConfirmacion.Text;

                    id = ObtenerValor(Controlador.NuevaEmpresa(nombre, celular, telefono, email, descripcion, categoria, usuario, pass, confrm));
                }
                else
                {
                    Controlador.ModificarEmpresa(id, nombre, celular, telefono, email, descripcion, categoria, usuario);
                }
                this.AbrirEnlace("NuevaEmpresa.aspx?id=" + id);
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }
    }
}