using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Rhino_App
{
    public partial class shop_cart : System.Web.UI.Page
    {
        public decimal total;
        private SqlConnection conn;
        private SqlCommand cmd;
        String connStr = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            var id = "";
            var cart = (Cart)Session["cart"];
            foreach (var item in cart.GetShopCart())
            {
                id += item.Id_Prod + ",";

            }
            if (id.Length > 0)
            {
                id = id.Remove(id.Length - 1);

                conn = new SqlConnection(connStr);
                conn.Open();
                cmd = new SqlCommand("SELECT * FROM tbl_products where product_id in (" + id + ")", conn);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                dt.Columns.Add("quantity");
                dt.Columns.Add("ItemTotal");
                foreach (DataRow dr in dt.Rows) // search whole table
                {
                    foreach (var qt in cart.GetShopCart())
                    {
                        if (qt.Id_Prod == (int)dr["product_id"])
                        {
                            dr["quantity"] = qt.Quantity;
                            dr["ItemTotal"] = qt.Quantity * (decimal)dr["price"];
                            total += qt.Quantity * (decimal)dr["price"];
                        }


                    }
                }

                Repeater1.DataSource = dt;
                Repeater1.DataBind();

            }
            else
            {
                Response.Write("<script>alert('Product Catalogue: No Products to Show');</script>");
            }
        }

        protected void btnRmvToCart_Click(object sender, EventArgs e)
        {
            var cart = (Cart)Session["cart"];
            cart.RemoveItem(int.Parse((sender as LinkButton).CommandArgument));
            Response.Redirect("shop-products.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // After clicking logout
            Session.Clear(); // Remove all session
            Response.Redirect("login.aspx"); // Redirect to login page
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            var userid = Session["userid"];
            var cart = (Cart)Session["cart"];


        }
    }
}