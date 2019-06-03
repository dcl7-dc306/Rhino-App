using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.IO;

namespace Rhino_App
{
    public partial class add_product : System.Web.UI.Page
    {
        private SqlConnection conn;
        private SqlCommand cmd;
        String connStr = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("images/uploaded-products/");

            if (flProdImage.HasFile)
            {
                string ext = Path.GetExtension(flProdImage.FileName);
                if(ext == ".jpg" || ext == ".png")
                {
                    flProdImage.SaveAs(path + flProdImage.FileName);
                    string imgPath = "images/uploaded-products/" + flProdImage.FileName;
                    conn = new SqlConnection(connStr);
                    cmd = new SqlCommand("INSERT INTO tbl_products(name, description, price, image) values (@name, @description, @price, @image)", conn);
                    cmd.Parameters.AddWithValue("@name", txtProdName.Text);
                    cmd.Parameters.AddWithValue("@description", txtProdDesc.Text);
                    cmd.Parameters.AddWithValue("@price", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@image", imgPath);

                    if( txtProdName.Text == "" || txtProdDesc.Text == "" || txtPrice.Text == "")
                    {
                        Response.Write("<script>alert('Failed: All fields must be filled up.')</script>");
                    }
                    else
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        Response.Write("<script>alert('Success: You have successfully added a product')</script>");
                    }

                }
                else
                {
                    lblStatusImage.Text = "Only .jpg and .png files are allowed";
                    Response.Write("<script>alert('Failed: Only .jpg and .png files are allowed to upload')</script>");
                }
            }
            else
            {
                lblStatusImage.Text = "Please select an Image file";
            }
        }
    }
}