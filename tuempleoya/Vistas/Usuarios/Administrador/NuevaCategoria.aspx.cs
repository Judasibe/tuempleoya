using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tuempleoya.Controladores.Administrador;

namespace tuempleoya.Vistas.Usuarios.Administrador
{
    public partial class NuevaCategoria : BaseVistas
    {
        private Categoria controlador;
        public NuevaCategoria()
        {
            controlador = new Categoria();
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
                        DataRow dr = controlador.MostrarCategoria(id).Tables[0].Rows[0];
                        txtCartegoria.Text = ObtenerValor(dr["Nombre"]);
                        lblTitle.Text = "Modificar Categoria";
                    }
                }
                catch (Exception ex)
                {
                    this.MostrarMensaje(ex);
                }
            }
        }

        protected void btnGuardarCategoria_Click(object sender, EventArgs e)
        {
            try
            {   
                string id = this.ObtenerValor(Request["id"]);
                object categoria = this.txtCartegoria.Text.ToUpper() ;

                if (string.IsNullOrWhiteSpace(id))
                {
                    id = ObtenerValor(controlador.GuardarCategoria(categoria).Tables[0].Rows[0]["id"]);
                }
                else {
                    controlador.ModificarCategoria(categoria, id);
                }
                this.AbrirEnlace("NuevaCategoria.aspx?id=" + id);
            }
            catch (Exception ex)
            {
                this.MostrarMensaje(ex);
            }
        }
    }
}