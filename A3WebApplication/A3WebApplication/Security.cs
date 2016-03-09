using A3ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace A3WebApplication
{
    public class Security
    {
        public static Customer CurrentCustomer
        {
            get
            {
                return HttpContext.Current.Session["Customer"] == null ? null : (Customer)HttpContext.Current.Session["Customer"];
            }
        }

        public static void Login(string UserName, string Password)
        {
            HttpContext.Current.Session["Customer"] = Customer.Login(UserName, Password);
        }

        public static bool IsCustomerLoggedIn()
        {
            return CurrentCustomer != null;
        }

        public static bool IsCustomerAdmin()
        {
            return IsCustomerLoggedIn() && CurrentCustomer.IsAdmin;
        }

        internal static void LogOut()
        {
            HttpContext.Current.Session["Customer"] = null;
            HttpContext.Current.Session.Abandon();
        }
    }
}