using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class UserNegocio
    {
        public int insertarNuevo (User usuario)
        {
			AccesoDatos datos = new AccesoDatos ();
			try
			{
				datos.setearProcedimiento("insertarNuevo");
				datos.setearParametros("@email", usuario.Email);
				datos.setearParametros("@pass", usuario.Pass);
				return datos.ejecutarAccionScalar();

			}
			catch (Exception ex)
			{
				throw ex;
			}
			finally
			{
				datos.cerrarConexion();
			}
        }
    }
}
