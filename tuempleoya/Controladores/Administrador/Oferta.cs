namespace tuempleoya.Controladores.Administrador
{
    using Datos;
    using System.Data;

    public class Oferta : Modelo
    {
        #region Skills
        public DataSet MostrarSkill(object id = null)
        {
            return this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("SS", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@idskill", SqlDbType.Int)
            );
        }

        public object NuevoSkill(object nombre)
        {
            return this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("IS", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(nombre, "@nameskill", SqlDbType.VarChar, 50)
            ).Tables[0].Rows[0]["id"];
        }

        public void ModificarSkill(object id, object nombre) 
        {
            this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("US", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(nombre, "@nameskill", SqlDbType.VarChar, 50)
                , new ParametroSP(id, "@idskill", SqlDbType.Int)
            );
        }

        public DataSet EliminarSkill(object id) 
        {
            return this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("DS", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@idskill", SqlDbType.Int)
            );
        }
        #endregion

        #region Ofertas

        public DataSet MostrarOferta(object id = null, object empresa = null)
        {
            return this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("SO", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
                , new ParametroSP(empresa, "@idempresa", SqlDbType.Int)
            );
        }

        public object NuevaOferta(object empresa, object titulo, object descripcion, object valor, object tiempo, object categoria) 
        {
            return this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("IO", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(empresa, "@idempresa", SqlDbType.Int)
                , new ParametroSP(categoria, "@categoria", SqlDbType.Int)
                , new ParametroSP(tiempo, "@tiempo",SqlDbType.VarChar, 40)
                , new ParametroSP(titulo, "@titulo", SqlDbType.VarChar, 50)
                , new ParametroSP(descripcion, "@descripcion", SqlDbType.VarChar, 400)
                , new ParametroSP(valor, "@valor", SqlDbType.Money)
            ).Tables[0].Rows[0]["id"];
        }

        public void ModificarOferta(object id, object titulo, object descripcion, object valor, object tiempo, object categoria) 
        {
            this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("UO", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
                , new ParametroSP(categoria, "@categoria", SqlDbType.Int)
                , new ParametroSP(tiempo, "@tiempo", SqlDbType.VarChar, 40)
                , new ParametroSP(titulo, "@titulo", SqlDbType.VarChar, 50)
                , new ParametroSP(descripcion, "@descripcion", SqlDbType.VarChar, 400)
                , new ParametroSP(valor, "@valor", SqlDbType.Money)
            );
        }

        public DataSet EliminarOferta(object id) 
        {
            return this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("DO", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@id", SqlDbType.Int)
            );
        }
        #endregion

        #region OfertasSkills

        public DataSet AgregarSkilOferta(object skill, object oferta, object minimo) 
        {
            return this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("IK", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(skill, "@idskill", SqlDbType.Int)
                , new ParametroSP(oferta, "@id", SqlDbType.Int)
                , new ParametroSP(minimo, "@descripcionSkillOferta", SqlDbType.VarChar, 150)
            );
        }

        public DataSet ModificarSkilOferta(object id, object skill, object oferta, object minimo)
        {
            return this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("UK", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@skilloferta", SqlDbType.Int)
                , new ParametroSP(skill, "@idskill", SqlDbType.Int)
                , new ParametroSP(oferta, "@id", SqlDbType.Int)
                , new ParametroSP(minimo, "@descripcionSkillOferta", SqlDbType.VarChar, 150)
            );
        }

        public DataSet EliminarSkillOferta(object id)
        {
            return this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("DK", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@skilloferta", SqlDbType.Int)
            );
        }

        public DataSet MostrarSkillOferta(object oferta, object id)
        {
            return this.con.EjecutarProcedimiento(
                  "SpOfertas"
                , new ParametroSP("SK", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(id, "@skilloferta", SqlDbType.Int)
                , new ParametroSP(oferta, "@id", SqlDbType.Int)
            );
        }

        #endregion
        
        public DataSet BuscarCategorias() 
        {
            Categoria cat = new Categoria();
            return cat.MostrarCategoria();
        }

        public DataTable EliminarAspiranter(object usuariooferta)
        {
            return this.con.EjecutarProcedimiento(
                  "SpPublicaciones"
                , new ParametroSP("OA", "@oper", SqlDbType.VarChar, 2)
                , new ParametroSP(usuariooferta, "@idaspiranteusuario", SqlDbType.Int)
            ).Tables[0];
        }
    }
}