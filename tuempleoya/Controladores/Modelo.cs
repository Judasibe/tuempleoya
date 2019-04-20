namespace tuempleoya.Controladores
{
    using Datos;

    public class Modelo
    {
        protected Conexion con;

        public Modelo()
        {
            this.con = new Conexion();
        }
    }
}