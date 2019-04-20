namespace tuempleoya.Vistas
{
    using System;
    using System.Data;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public class BaseVistas : System.Web.UI.Page
    {
        /// <summary>
        /// Muestra un alert con el mensaje de la exception
        /// </summary>
        /// <param name="ex">exception no controlada del sistema</param>
        public void MostrarMensaje(Exception ex)
        {
            MostrarMensaje(ex.Message, TipoMensaje.ERROR);
        }

        public void ProcesoFinalizado()
        {
            MostrarMensaje("Proceso finalizado correctamente", TipoMensaje.EXITO);
        }

        /// <summary>
        /// Muestra un mensaje con el mensaje y el tipo de mensaje
        /// </summary>
        /// <param name="mensaje"> cadena que se vera en el mensaje </param>
        /// <param name="tipo"> tipo de mensaje (Por defecto es EXITO) </param>
        public void MostrarMensaje(string mensaje, TipoMensaje tipo)
        {
            string alertTipo;
            if (tipo == TipoMensaje.ADVERTENCIA)
            {
                alertTipo = "warn";
            }
            else if (tipo == TipoMensaje.ERROR)
            {
                alertTipo = "error";
            }
            else
            {
                alertTipo = "success";
            }

            LlamarFuncionJs("LlamarAlert('" + mensaje.Replace("'", string.Empty).Replace("/", string.Empty) + "', '" + alertTipo + "')");
        }

        /// <summary>
        /// Llama una funcion JavaScript pasada por parámetros, la funcion debe existir
        /// </summary>
        /// <param name="funcion"> funcion la cuál debe existir ej: ocultarModal() </param>
        public void LlamarFuncionJs(string funcion)
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion" + funcion.Substring(0, 3), funcion + ";", true);
        }

        /// <summary>
        /// Metodo que abre el enlace en la misma pestaña
        /// </summary>
        /// <param name="direccion">url a la que se va redireccionar</param>
        public void AbrirEnlace(string direccion)
        {
            Response.Redirect(direccion);
        }

        /// <summary>
        /// Metodo que abre en una nueva pestaña la direcció pasada por parámetro
        /// </summary>
        /// <param name="direccion">url que se abrira en la otra pestaña </param>
        public void AbrirEnlaceEnOtraPestana(string direccion)
        {
            LlamarFuncionJs("window.open(' " + direccion + "', '_blank')");
        }

        public string ObtenerValor(object obj) 
        {
            return obj == null ? string.Empty : obj.ToString();
        }
    }
}