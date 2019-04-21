namespace tuempleoya.Vistas
{
    using System;
    using System.Data;
    using tuempleoya.Controladores.Usuarios;

    public partial class Perfil : BaseVistas
    {
        Usuario Controlador;
        public Perfil()
        {
            this.Controlador = new Usuario();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["TipoUsuario"] == null || !Session["TipoUsuario"].ToString().Equals("Usuario"))
                    {
                        this.AbrirEnlace("/");
                    }
                    LoadTable();
                }
                catch (Exception ex)
                {
                    this.MostrarMensaje(ex);
                }
            }
        }

        protected void btnSubirArchivo_Click(object sender, EventArgs e)
        {
            try
            {
                if (fuArchivo.HasFile)
                {
                    string archivo = string.Empty;
                    string name = Session["Usuario"].ToString();
                    string namefoto = name.ToString() + "_" + fuArchivo.FileName;
                    string carpeta = "/Images/Empresas";
                    archivo = string.Format("{0}/{1}", carpeta, namefoto);
                    Controlador.GuardarHojaVida(Session["IdUsuario"], archivo);
                    fuArchivo.SaveAs(Server.MapPath(archivo));
                }
                else {
                    MostrarMensaje("Debe elegir un archivo", TipoMensaje.ERROR);
                }
                LoadTable();
            }
            catch (Exception ex)
            {
                MostrarMensaje(ex);
            }
        }

        private void LoadTable()
        {
            DataSet ds = Controlador.BuscarHojaVida(Session["IdUsuario"]);
            DataTable dr = ds.Tables[0];
            if (dr.Rows.Count > 0)
            {
                string archivo = ObtenerValor(dr.Rows[0]["Archivo"]);
                aHojaVida.HRef = archivo;
            }
            else
            {
                aHojaVida.Visible = false;
            }
            gridOfertas.DataSource = ds.Tables[1];
            gridOfertas.DataBind();
            updateHojaVida.Update();
        }
    }
}