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
    public partial class shop_products : System.Web.UI.Page
    {
        // Database connection
        private SqlConnection conn;
        private SqlCommand cmd;
        String connStr = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connStr);
            conn.Open();
            cmd = new SqlCommand("SELECT * FROM tbl_products", conn);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Product Catalogue: No Products to Show');</script>");
            }
            
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // After clicking logout
            Session.Clear(); // Remove all session
            Response.Redirect("login.aspx"); // Redirect to login page
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connStr);
            conn.Open();
            // search anything by product name
            string qry = $"SELECT * FROM tbl_products WHERE name LIKE '%{txtSearch.Text}%' OR product_id LIKE '%{txtSearch.Text}%' OR price LIKE '%{txtSearch.Text}%' COLLATE SQL_Latin1_General_CP1_CI_AS";
            SqlDataAdapter da = new SqlDataAdapter(qry, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Search Product: No Products to Show');</script>");
            }
            conn.Close();
        }

        protected void btnAddToCart_Click(object sender, CommandEventArgs e)
        {
            Cart cart = Cart.GetShoppingCart();       
            
            cart.AddItem(int.Parse(e.CommandArgument.ToString()));
            Response.Redirect("shop-cart.aspx");
        }
    }
}