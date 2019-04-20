
namespace Datos
{
    using System.Data;
    using System.Data.SqlClient;

    public class Conexion
    {
        #region Propiedades
        string servidor = ".";
        string database = "tuempleoya";
        #endregion
        // Conexión a la base de datos
        private string getConexion()
        {
            return string.Format("Data Source={0};Initial Catalog={1};Integrated Security=true;", servidor, database) ;
        }

        /// <summary>
        /// Ejecuta el procedimiento con sus parámetros y devuelve un Dataset
        /// </summary>
        /// <param name="procedimiento"> Store Procedure a ejecutar </param>
        /// <param name="parametros"> Parámetros del procedimiento almacenado </param>
        /// <returns>Dataset con una o más tablas  </returns>
        public DataSet EjecutarProcedimiento(string procedimiento, params ParametroSP[] parametros)
        {
            GuardarConsulta(procedimiento, parametros);

            DataSet ds = new DataSet();

            SqlConnection con = new SqlConnection(getConexion());
            con.Open();

            SqlCommand cmd = new SqlCommand(procedimiento, con);
            cmd.CommandType = CommandType.StoredProcedure;

            foreach (var item in parametros)
            {
                SqlParameter param = new SqlParameter();
                param.SqlDbType = item.Tipo;
                param.ParameterName = item.NombreParametro;
                param.Direction = item.Direction;

                if (item.Tipo == SqlDbType.VarChar)
                {
                    param.Size = item.Tamanio;
                }
                param.Value = (item.Valor == null && item.Tipo == SqlDbType.Int) ? 0 : item.Valor;
                cmd.Parameters.Add(param);
            }

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(ds);

            con.Close();
            adapter.Dispose();
            return ds;
        }

        /// <summary>
        /// Guarda el llamado del procedimiento en el log de la Base de datos
        /// </summary>
        /// <param name="procedimiento"> Procedimiento a llamar </param>
        /// <param name="parametros"> parámetros del store procedure </param>
        private void GuardarConsulta(string procedimiento, ParametroSP[] parametros)
        {
            string query = "Exec " + procedimiento;
            foreach (var item in parametros)
            {
                query += " " + item.NombreParametro + "=";
                query += ((item.Tipo == SqlDbType.VarChar) && (item.Valor != null)) ? "'" : string.Empty;
                query += item.Valor == null ? "null" : item.Valor.ToString();
                query += ((item.Tipo == SqlDbType.VarChar) && (item.Valor != null)) ? "'" : string.Empty;
                query += ",";
            }
            query.Substring(0, query.Length - 2);
            DataSet ds = new DataSet();

            SqlConnection con = new SqlConnection(getConexion());
            con.Open();

            SqlCommand cmd = new SqlCommand("GuardarLog", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param = new SqlParameter();
            param.SqlDbType = SqlDbType.VarChar;
            param.ParameterName = "@Consulta";
            param.Direction = ParameterDirection.Input;
            param.Size = -1;
            param.Value = query;
            cmd.Parameters.Add(param);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
