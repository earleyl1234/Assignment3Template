using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A3WebApplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // TODO: must use the Security Class to login and to check for access level (admin or not)
            if (Security.IsCustomerAdmin())
            {
                Response.Redirect("AdminPage.aspx");
            }
            if (!Security.IsCustomerAdmin() && Security.IsCustomerLoggedIn())
            {
                Response.Redirect("CategoriesPage.aspx");
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                Security.Login(txtUsername.Text, txtPassword.Text);    
                Response.Redirect("Home.Aspx");
            }
            catch(Exception)
            {
                lbloginmsg.Visible = true;
            }           
        }
    }
}