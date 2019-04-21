namespace tuempleoya.Controladores.Usuarios
{
    using Datos;
    using System.Data;

    public class Usuario : Modelo
    {
        public object NuevoUsuario(object nombre, object apellidos, object email, object celular, object usuario, object pass, object confirm)
        {
            return con.EjecutarProcedimiento(
                  "SpUsuario"
                , new ParametroSP("I", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(nombre, "@Nombre", SqlDbType.VarChar, 100)
                , new ParametroSP(apellidos, "@Apellidos", SqlDbType.VarChar, 100)
                , new ParametroSP(email, "@Email", SqlDbType.VarChar, 100)
                , new ParametroSP(celular, "@numeroCelular", SqlDbType.VarChar, 11)
                , new ParametroSP(usuario, "@NombreUsuario", SqlDbType.VarChar, 40)
                , new ParametroSP(pass, "@Clave", SqlDbType.VarChar, 15)
                , new ParametroSP(confirm, "@confirmacion", SqlDbType.VarChar, 15)
            ).Tables[0].Rows[0]["id"];
        }

        public void ModificarUsuario(object id, object nombre, object apellidos, object email, object celular, object usuario, object pass, object confirm)
        {
            con.EjecutarProcedimiento(
                  "SpUsuario"
                , new ParametroSP("I", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
                , new ParametroSP(nombre, "@Nombre", SqlDbType.VarChar, 100)
                , new ParametroSP(apellidos, "@Apellidos", SqlDbType.VarChar, 100)
                , new ParametroSP(email, "@Email", SqlDbType.VarChar, 100)
                , new ParametroSP(celular, "@numeroCelular", SqlDbType.VarChar, 11)
                , new ParametroSP(usuario, "@NombreUsuario", SqlDbType.VarChar, 40)
                , new ParametroSP(pass, "@Clave", SqlDbType.VarChar, 15)
                , new ParametroSP(confirm, "@confirmacion", SqlDbType.VarChar, 15)
            );
        }

        public DataSet EliminarUsuario(object id)
        {
            return con.EjecutarProcedimiento(
                  "SpUsuario"
                , new ParametroSP("D", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
            );
        }

        public DataSet MostrarUsuario(object id = null)
        {
            return con.EjecutarProcedimiento(
                  "SpUsuario"
                , new ParametroSP("S", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
            );
        }

        public DataSet Loguearse(object usuario, object pass)
        {
            return con.EjecutarProcedimiento(
                "SpLogin"
                , new ParametroSP(usuario, "@usuario", SqlDbType.VarChar, 30)
                , new ParametroSP(pass, "@pass", SqlDbType.VarChar, 15)
            );
        }


        public DataSet BuscarHojaVida(object usuario)
        {
            return con.EjecutarProcedimiento(
                  "SpPublicaciones"
                , new ParametroSP("HV", "@oper", SqlDbType.VarChar, 30)
                , new ParametroSP(usuario, "@user", SqlDbType.VarChar, 30)
            );
        }

        public void GuardarHojaVida(object usuario, object archivo)
        {
            this.con.EjecutarProcedimiento(
                  "SpPublicaciones"
                , new ParametroSP("AH", "@oper", SqlDbType.VarChar, 30)
                , new ParametroSP(usuario, "@user", SqlDbType.VarChar, 30)
                , new ParametroSP(archivo, "@archivo", SqlDbType.VarChar, -1)
            );
        }
    }
}