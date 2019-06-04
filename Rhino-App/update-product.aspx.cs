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
    public partial class update_product : System.Web.UI.Page
    {
        // Database connection
        private SqlConnection conn;
        private SqlCommand cmd;
        private SqlCommand cmd2;
        private SqlDataReader reader;
        String connStr = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack) // when the page loads for 1st time
            //{
            string product = Request.QueryString["id"];
            conn = new SqlConnection(connStr);

            cmd = new SqlCommand("SELECT * FROM tbl_products WHERE product_id=@product", conn);
            cmd.Parameters.AddWithValue("@product", product);

            try
            {
                conn.Open();
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {

                    txtProdName.Text = reader["name"].ToString();
                    txtProdDesc.Text = reader["description"].ToString();
                    lblStatusImage.Text = reader["image"].ToString();
                    txtPrice.Text = reader["price"].ToString();
                    lblProdId.Text = product.ToString();
                }
                conn.Close();
    
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "');</script>");
            }


            //}
        }

        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connStr);
            String product = Request.QueryString["id"];

            cmd = new SqlCommand("UPDATE tbl_products SET name=@name, description=@description, price=@price, image=@image WHERE product_id= @product", conn);
            cmd.Parameters.AddWithValue("@name", txtProdName.Text);
            cmd.Parameters.AddWithValue("@description", txtProdDesc.Text);
            cmd.Parameters.AddWithValue("@price", txtPrice.Text);
            cmd.Parameters.AddWithValue("@product", product);
            if (flProdImage.HasFile) // if user choosed a file
            {
                string path = Server.MapPath("images/uploaded-products/");
                string ext = Path.GetExtension(flProdImage.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".jpeg")
                {
                    // Reupload Image
                    flProdImage.SaveAs(path + flProdImage.FileName);
                    string imgPath = "images/uploaded-products/" + flProdImage.FileName;
                    cmd.Parameters.AddWithValue("@image", imgPath);
                }
            }
            else
            {
                // if not, just use the current image
                cmd.Parameters.AddWithValue("@image", lblStatusImage.Text);
            }
            

            try
            {
                conn.Open();
                if (cmd.ExecuteNonQuery() == 1) // ExecuteNonQuery() = returns no. of rows affected from db
                {
                    AlertAndRedirect("Success: Product Update Complete", product);
                }
                else
                {
                    // something went wrong with db / query
                    Response.Write("<script>alert('Failed: Sorry, Something went wrong. ');</script>");
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                //lblStatus.Text = ex.Message;
                Response.Write("<script>alert('" + ex.ToString() + "');</script>");
            }
        }

        public void AlertAndRedirect(string msg, string id)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
            "alert('"+ msg +"'); window.location='" +
            Request.ApplicationPath + "update-product.aspx?id=" + id + "';", true);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // After clicking logout
            Session.Clear(); // Remove all session
            Response.Redirect("login.aspx"); // Redirect to login page
        }
    }
}