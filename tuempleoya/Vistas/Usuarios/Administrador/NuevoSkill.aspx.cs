namespace tuempleoya.Vistas.Usuarios.Administrador
{
    using System;
    using System.Data;
    using tuempleoya.Controladores.Administrador;

    public partial class NuevoSkill : BaseVistas
    {
        private Oferta Controlador;
        public NuevoSkill()
        {
            this.Controlador = new Oferta();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string id = this.ObtenerValor(Request["id"]);

                    if (!string.IsNullOrWhiteSpace(id))
                    {
                        DataRow dr = Controlador.MostrarSkill(id).Tables[0].Rows[0];
                        txtSkill.Text = ObtenerValor(dr["Nombre"]);
                        lblTitle.Text = "Modificar Skill";
                    }
                }
                catch (Exception ex)
                {
                    this.MostrarMensaje(ex);
                }
            }
        }

        protected void btnGuardarSkill_Click(object sender, EventArgs e)
        {
            try
            {
                string id = this.ObtenerValor(Request["id"]);
                object skill = this.txtSkill.Text.ToUpper();

                if (string.IsNullOrWhiteSpace(id))
                {
                    id = ObtenerValor(Controlador.NuevoSkill(skill));
                }
                else
                {
                    Controlador.ModificarSkill(id, skill);
                }
                this.AbrirEnlace("NuevoSkill.aspx?id=" + id);
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }
    }
}