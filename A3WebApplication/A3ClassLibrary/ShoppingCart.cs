using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace A3ClassLibrary
{
    public class ShoppingCart
    {
        public List<CartItem> Cart { get; set; }

        public ShoppingCart()
        {
            Cart = new List<CartItem>();
        }

        /// <summary>
        /// Create a new CartItem based on parameters and adds it to the List<CartItem>.
        /// </summary>
        public void AddToCart(int x, int y)
        {
            CartItem item = new CartItem(x, y);
            // Cart.Contains(item) ? UpdateCartItem(x, y) : Cart.Add(item);
            if (!Cart.Contains(item))
            {
                Cart.Add(item);
            }
            else
            {
                UpdateCartItem(x, y);
            }
        }

        /// <summary>
        /// If a CartItem exists in our current Cart based on the productID passed, it will be replaced with the new quantity value.
        /// </summary>
        public void UpdateCartItem(int productID, int quantity)
        {
            CartItem item = new CartItem(productID, quantity);

            foreach (var Item in Cart)
            {
                if (Item.Equals(item))
                {
                    Item.Quantity += quantity;
                }
            }
        }
        /// <summary>
        /// Removes a product from the current Cart based on the productID passed.
        /// </summary>
        /// <param name="productID">Product to remove</param>
        public void RemoveCartItem(int i) =>
            Cart.RemoveAll(item => item.ProductID == i);

        /// <summary>
        /// returns a CartItem based on the productID if it exists in the cart
        /// </summary>
        /// <param name="productID">The product ID to search for</param>
        /// <returns>CartItem built from productID or null if none found matching</returns>
        public CartItem GetCartItem(int productID) => Cart.Find(items => items.ProductID == productID);

        /// <summary>
        /// Creates necessary inserts into the DB based on the cart items.
        /// </summary>
        /// <returns>OrderID based on database</returns>
        public int CheckOut(int CustomerID, DateTime date, object PricePaid)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbA3ConnStr"].ConnectionString);
            d.AddParam("CustomerID", CustomerID);
            d.AddParam("OrderDate", date);
            d.AddParam("PricePaid", CalculateTotal());
            DataSet ds = d.ExecuteProcedure("spInsertOrder");
            int orderId = int.Parse(ds.Tables[0].Rows[0]["orderID"].ToString());

            foreach (CartItem item in Cart)
            {
                item.CheckOutItemDetail(orderId);
            }

            return orderId;
        }

        public double CalculateTotal() => Cart.Sum(item => item.SubTotal);
        public bool IsEmpty() => Cart.Count == 0;
    }
}