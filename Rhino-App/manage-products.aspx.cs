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
    public partial class manage_products : System.Web.UI.Page
    {
        private SqlConnection conn;
        private SqlCommand cmd;
        String connStr = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefreshData(); // Binds or Refreshes Repeater
            }
            

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // After clicking logout
            Session.Clear(); // Remove all session
            Response.Redirect("login.aspx"); // Redirect to login page
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string product_id = (sender as LinkButton).CommandArgument;
            conn = new SqlConnection(connStr);
            cmd = new SqlCommand("DELETE FROM tbl_products WHERE product_id=@productid", conn);
            cmd.Parameters.AddWithValue("@productid", product_id);

            conn.Open();
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert(' Successfully Deleted the Product ID: " + product_id + "');</script>");
            RefreshData();
            conn.Close();
        }
        protected void RefreshData()
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
    }
}