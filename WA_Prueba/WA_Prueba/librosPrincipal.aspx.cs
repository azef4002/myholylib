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
            
        }
    }
}