namespace tuempleoya.Controladores.Administrador
{
    using Datos;
    using System.Data;

    public class Empresa : Modelo
    {
        public object NuevaEmpresa(object nombre, object celular, object telefono, object email, object descripcion
                                    , object categoria, object usuario, object pass, object confirm)
        {
            return con.EjecutarProcedimiento(
                  "SpEmpresas"
                , new ParametroSP("I", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(nombre, "@nombre", SqlDbType.VarChar, 200)
                , new ParametroSP(celular, "@celular", SqlDbType.VarChar, 12)
                , new ParametroSP(telefono, "@telefono", SqlDbType.VarChar, 12)
                , new ParametroSP(email, "@email", SqlDbType.VarChar, 400)
                , new ParametroSP(usuario, "@usuario", SqlDbType.VarChar, 13)
                , new ParametroSP(descripcion, "@descripcion", SqlDbType.VarChar, 800)
                , new ParametroSP(categoria, "@categorias", SqlDbType.Int)

                , new ParametroSP(pass, "@pass", SqlDbType.VarChar, 15)
                , new ParametroSP(confirm, "@confirm", SqlDbType.VarChar, 15)
            ).Tables[0].Rows[0]["id"];
        }

        public void ModificarEmpresa(object id, object nombre, object celular, object telefono, object email, object descripcion
                                    , object categoria, object usuario)
        {
            con.EjecutarProcedimiento(
                  "SpEmpresas"
                , new ParametroSP("U", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
                , new ParametroSP(nombre, "@nombre", SqlDbType.VarChar, 200)
                , new ParametroSP(celular, "@celular", SqlDbType.VarChar, 12)
                , new ParametroSP(telefono, "@telefono", SqlDbType.VarChar, 12)
                , new ParametroSP(email, "@email", SqlDbType.VarChar, 400)
                , new ParametroSP(usuario, "@usuario", SqlDbType.VarChar, 13)
                , new ParametroSP(descripcion, "@descripcion", SqlDbType.VarChar, 800)
                , new ParametroSP(categoria, "@categorias", SqlDbType.Int)
            );
        }

        public DataSet EliminarEmpresa(object id) 
        {
            return con.EjecutarProcedimiento(
                  "SpEmpresas"
                , new ParametroSP("D", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
            );
        }

        public DataSet MostrarEmpresa(object id = null) 
        {
            return con.EjecutarProcedimiento(
                  "SpEmpresas"
                , new ParametroSP("S", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "id", SqlDbType.Int)
            );
        }


        public DataTable MostrarCategoria()
        {
            Categoria cat = new Categoria();
            return cat.MostrarCategoria().Tables[0];
        }
    }
}