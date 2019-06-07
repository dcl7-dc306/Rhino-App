using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

namespace Rhino_App
{
    public partial class shop_product_item : System.Web.UI.Page
    {
        private SqlConnection conn;
        private SqlCommand cmd;
        SqlDataReader reader;
        String connStr = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                lblUser.Text = Session["user"].ToString();
            }
            
            string product = Request.QueryString["id"];

            if (product == null)
            {
                Response.Redirect("shop-products.aspx");
            }

            conn = new SqlConnection(connStr);

            cmd = new SqlCommand("SELECT * FROM tbl_products WHERE product_id=@product", conn);
            cmd.Parameters.AddWithValue("@product", product);
            try
            {
                conn.Open();
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
                    AlertAndRedirect("No Product Available. Redirecting to Product Catalogue");
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "');</script>");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // After clicking logout
            Session.Clear(); // Remove all session
            Response.Redirect("login.aspx"); // Redirect to login page
        }

        public void AlertAndRedirect(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
            "alert('" + msg + "'); window.location='" +
            Request.ApplicationPath + "shop-products.aspx'", true);
        }
    }
}