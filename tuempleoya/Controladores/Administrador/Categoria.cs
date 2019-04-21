namespace tuempleoya.Controladores.Administrador
{
    using Datos;
    using System.Data;

    public class Categoria : Modelo 
    {
        public DataSet GuardarCategoria(object nombre) 
        {
            return con.EjecutarProcedimiento(
                  "SpCategoria"
                , new ParametroSP("I", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(nombre, "@categoria", SqlDbType.VarChar, 100)
            );
        }

        public DataSet MostrarCategoria(object id= null)
        {
            return con.EjecutarProcedimiento(
                  "SpCategoria"
                , new ParametroSP("S", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
            );
        }

        public DataSet EliminarCategoria(object id)
        {
            return con.EjecutarProcedimiento(
                  "SpCategoria"
                , new ParametroSP("D", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
            );
        }

        public DataSet ModificarCategoria(object categoria, string id)
        {
            return con.EjecutarProcedimiento(
                  "SpCategoria"
                , new ParametroSP("U", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
                , new ParametroSP(categoria, "@categoria", SqlDbType.VarChar, 100)
            );
        }

    }
}