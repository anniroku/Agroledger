using Dapper.Contrib.Extensions;
using System.ComponentModel.DataAnnotations;


namespace Agroledger.repositories.models
{

    [Table("usuarios")]
    public class Usuario
    {
            [Dapper.Contrib.Extensions.Key]
            public int id_usuario { get; set; }


            [Required(ErrorMessage = "El nombre_usuario es obligatorio.")]
            [StringLength(50)]
            public string nombre_usuario { get; set; }



            [Required(ErrorMessage = "El nombre es obligatorio.")]
            [StringLength(100)]
            public string nombre { get; set; }


            [StringLength(100)]
            public string apellido { get; set; }

            [StringLength(255)]
            public string email { get; set; }


            [Required(ErrorMessage = "La contraseña es obligatoria.")]
            [StringLength(255)]
            public string contrasena { get; set; }

            [StringLength(20)]
            public string numero { get; set; }


            [StringLength(255)]
            public string direccion { get; set; }

            
            public int id_rol { get; set; }
    }
  
}



