using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A3WebApplication
{
    public partial class ProductsPage : System.Web.UI.Page
    {
        // 5 MARKS TOTAL
        // 1 BONUS MARK TOTAL
        protected void Page_Load(object sender, EventArgs e)
        {
            /* TODO:
                - 3 MARKS: grab CategoryID from QueryString and Populate the products based on the CategoryID
            */
       
        }

        protected void dlProducts_ItemCommand(object source, DataListCommandEventArgs e)
        {
           if(e.CommandName == "Addtocart")
            {
                SessionCart.Instance.AddToCart  (Convert.ToInt32(e.CommandArgument), 1);
            }
        }
    }
}