using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A3WebApplication
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        
        }

        protected void lbCategory_Click(object sender, EventArgs e)
        {
            pnlCategoryAdmin.Visible = true;
            pnlCustomer.Visible = false;
            pnlProducts.Visible = false;
        }

        protected void lbCustomer_Click(object sender, EventArgs e)
        {
            pnlCategoryAdmin.Visible = false;
            pnlCustomer.Visible = true;
            pnlProducts.Visible = false;
        }

        protected void lbProduct_Click(object sender, EventArgs e)
        {
            pnlProducts.Visible = true;
            pnlCustomer.Visible = false;
            pnlCategoryAdmin.Visible = false;
        }
    }
}