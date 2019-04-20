using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tuempleoya.Vistas
{
    public partial class CerrarSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SessionIDManager manager = new SessionIDManager();
            Session["Usuario"] = null;
            Session["TipoUsuario"] = null;
            Session["Session"] = null;
            Session["IdUsuario"] = null;
            manager.RemoveSessionID(Context);
            Response.Redirect("/Vistas/Login.aspx");
        }
    }
}