using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tuempleoya.Layout
{
    public partial class Maestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                if (Session["TipoUsuario"] != null)
                {
                    aRegister.Visible = false;
                    litUsuario.Text = Session["Usuario"].ToString();
                    aIniciarSesion.Visible = false;
                    liUsuario.Visible = true;

                    if (Session["TipoUsuario"].ToString().Equals("Empresa")) {
                        ulEmpresa.Visible = true;
                    }
                    else if (Session["TipoUsuario"].ToString().Equals("Usuario"))
                    {
                        ulUsuario.Visible = true;
                    }
                    else {
                        ulAdmin.Visible = true;
                    }
                }
                else
                {
                    liUsuario.Visible = false;
                    aRegister.Visible = true;
                    aIniciarSesion.Visible = true;
                }
            }
        }
    }
}