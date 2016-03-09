using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace A3ClassLibrary
{
    public class CartItem : Product, IEquatable<CartItem>
    {
        public int Quantity { get; set; }
        public double SubTotal => Price * Quantity;

        public CartItem(int productID, int quantity)
        {
            Product myProduct = Product.GetProductByID(productID);

            this.Name = myProduct.Name;

            this.Price = myProduct.Price;

            this.PrimaryImagePath = myProduct.PrimaryImagePath;

            this.CategoryID = myProduct.CategoryID;

            this.ProductID = myProduct.ProductID;

            this.Quantity = quantity;
        }
        public void CheckOutItemDetail(int orderID)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            d.AddParam("OrderID", orderID);
            d.AddParam("ProductID", this.ProductID);
            d.AddParam("Quantity", this.Quantity);
            d.AddParam("SubTotal", this.SubTotal);

            d.ExecuteProcedure("spInsertOrderDetail");
        }

        public bool Equals(CartItem item) => item.ProductID == ProductID;
    }
}