using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace Rhino_App
{
   
    public partial class index : System.Web.UI.Page
    {
        public SqlCommand cmd;
        public SqlConnection conn;
        public SqlDataReader rd;
        public string connString = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        public DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null){ // user logged in
                lblUser.Text = Session["user"].ToString();
                if (Session["admin"].ToString() == "1")
                { // checks if administrator
                    Response.Redirect("manage-products.aspx"); // redirect to product management
                }
            }
            Cart cart = Cart.GetShoppingCart();

            conn = new SqlConnection(connString);
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

        protected void btnAddToCart_Command(object sender, CommandEventArgs e)
        {
            Cart cart = Cart.GetShoppingCart();

            cart.AddItem(int.Parse(e.CommandArgument.ToString()));
            Response.Redirect("shop-cart.aspx");
        }
    }
}