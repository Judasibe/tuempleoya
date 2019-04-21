namespace tuempleoya.Controladores.Usuarios
{
    using Datos;
    using System.Data;
    using Controladores.Administrador;

    public class Publicacion : Modelo
    {
        public DataSet MostrarTodasLasPublicaciones(object categoria) 
        {
            return this.con.EjecutarProcedimiento(
                  "SpPublicaciones"
                , new ParametroSP("SA", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(categoria, "@categoria", SqlDbType.Int)
            );
        }

        public DataTable BuscarCategorias() 
        {
            Categoria cat = new Categoria();
            return cat.MostrarCategoria().Tables[0];
        }

        public DataSet BuscarPublicacionAll(object publicacion)
        {
            return this.con.EjecutarProcedimiento(
                  "SpPublicaciones"
                , new ParametroSP("SO", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(publicacion, "@idoferta", SqlDbType.Int)
            );
        }

        public void AspirarOferta(object user, object publicacion)
        {
            this.con.EjecutarProcedimiento(
                  "SpPublicaciones"
                , new ParametroSP("AO", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(publicacion, "@idoferta", SqlDbType.Int)
                , new ParametroSP(user, "@user", SqlDbType.Int)
            );
        }
    }
}