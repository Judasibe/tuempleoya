namespace tuempleoya.Vistas
{
    using System;
    using System.Data;
    using tuempleoya.Controladores.Usuarios;

    public partial class Registro : BaseVistas
    {
        Usuario Controlador;
        public Registro()
        {
            Controlador = new Usuario();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                }
                catch (Exception ex)
                {
                    this.MostrarMensaje(ex);
                }
            }
        }

        protected void btnGuardarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                object nombre = txtNombre.Text.ToUpper();
                object apellidos = txtApellidos.Text.ToUpper();
                object email = txtEmail.Text;
                object celular = txtCelular.Text;
                object usuario = txtUsuario.Text;
                object pass = txtClave.Text;
                object confirm = txtConfirmacion.Text;

                string id = this.ObtenerValor(Request["id"]);

                if (string.IsNullOrWhiteSpace(id))
                {
                    id = ObtenerValor(Controlador.NuevoUsuario(nombre, apellidos, email, celular, usuario, pass, confirm));
                }
                else
                {
                    Controlador.ModificarUsuario(id, nombre, apellidos, email, celular, usuario, pass, confirm);
                }

            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }
    }
}