namespace Datos
{
    using System.Data;

    public class ParametroSP
    {

        #region Propiedades
        public object Valor { get; set; }

        public SqlDbType Tipo { get; set; }

        public int Tamanio { get; set; }

        public ParameterDirection Direction { get; set; }

        public string NombreParametro { get; set; }
        #endregion

        #region Constructores
        public ParametroSP()
        {

        }

        public ParametroSP(object valor, string nombre, SqlDbType tipo, int tamanio = 1, ParameterDirection direccion = ParameterDirection.Input)
        {
            this.Valor = valor;
            this.Tipo = tipo;
            this.Tamanio = tamanio;
            this.Direction = direccion;
            this.NombreParametro = nombre;
        }
        #endregion
    }
}
