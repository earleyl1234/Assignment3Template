using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A3WebApplication
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnlselectcat.Visible = true;
            
        }

        protected void lbHoodie_Click(object sender, EventArgs e)
        {
            pnlselectcat.Visible = false;
            pnlLadies.Visible = false;
            pnlHoodie.Visible = true;
        }
    }
}