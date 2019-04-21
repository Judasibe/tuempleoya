namespace tuempleoya.Controladores
{
    using Datos;

    public class Modelo
    {
        protected Conexion con = new Conexion();

        public Modelo()
        {
            this.con = new Conexion();
        }
    }
}