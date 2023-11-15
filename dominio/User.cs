using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class User
    {
        public int Id { get; set; }

        
        //Ejemplo de validacion, desde el dominio, para cuando quieren
        //loguearse con un campo vacio
        private string email;
        public string Email
        {
            get { return email; }
            set
            {
                if (value != "")
                    email = value;
                else
                    throw new Exception("El campo de email no debe estar vacio");
            }
        }
        
        
        public string Pass { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public bool Admin { get; set; }
        public string ImagenPerfil { get; set; }

    }
}
