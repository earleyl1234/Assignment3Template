using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A3WebApplication
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Security.IsCustomerAdmin())
            {
                hlLogin.Visible = false;
                hlAdmin.Visible = true;
                lbLogout.Visible = true;
                lbwelcome.Text = "Welcome " + Security.CurrentCustomer.FirstName;
            }

            else if (!Security.IsCustomerLoggedIn())
            {
                hlLogin.Visible = true;
                lbLogout.Visible = false;
               
            }
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Security.LogOut();
            Response.Redirect("Home.aspx");
            hlLogin.Visible = true;
            hlAdmin.Visible = false;
            lbLogout.Visible = false;

        }
    }
}