using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WA_Prueba.MaterialWS;

namespace WA_Prueba
{
    public partial class librosPrincipal : System.Web.UI.Page
    {
        private MaterialWSClient materialwsClient;

        protected void Page_Init(object sender, EventArgs e)
        {
            materialwsClient = new MaterialWSClient();
            LoadMateriales();
        }

        protected void LoadMateriales()
        {
            List<materialDTO> materiales = new List<materialDTO>();
            dgvLibros.DataSource = materiales;
            dgvLibros.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Simula una conexión al servicio (aunque no lo usamos aquí)
                materialwsClient = new MaterialWSClient();

                // Lista de ejemplo
                List<materialDTO> materiales = new List<materialDTO>
                {
                    new materialDTO { idMaterial = 1, titulo = "Cien años de soledad" },
                    new materialDTO { idMaterial = 2, titulo = "El Principito" },
                    new materialDTO { idMaterial = 3, titulo = "Don Quijote de la Mancha" },
                    new materialDTO { idMaterial = 4, titulo = "Crónica de una muerte anunciada" },
                    new materialDTO { idMaterial = 5, titulo = "La Odisea" }
                };

                // Enlaza al GridView
                dgvLibros.DataSource = materiales;
                dgvLibros.DataBind();
            }
        }
    }
}