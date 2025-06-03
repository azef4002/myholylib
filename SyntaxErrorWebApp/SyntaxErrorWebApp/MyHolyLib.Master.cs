using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SyntaxErrorWebApp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string BodyCssClass { get; set; } = "default-body";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}