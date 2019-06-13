﻿using System;
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
            if (Session["user"] != null) // user logged in
            {
                lblUser.Text = Session["user"].ToString();
                if (Session["admin"].ToString() != "1") // checks if not administrator
                {
                    Response.Redirect("shop-products.aspx"); // redirect to product catalogue
                }
            }
            else
            {
                Response.Redirect("login.aspx"); // if not, redirect to login
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("images/uploaded-products/");

            if (flProdImage.HasFile)
            {
                string ext = Path.GetExtension(flProdImage.FileName);
                if(ext == ".jpg" || ext == ".png" || ext == ".jpeg")
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
                        Response.Write("<script>alert('Failed: All fields are cannot be blank.')</script>");
                    }
                    else
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        AlertAndRedirect("Success: You have successfully added a product");
                        
                    }

                }
                else
                {
                    lblStatusImage.Text = "<font color='red'>Only .jpg and .png files</font>";
                    Response.Write("<script>alert('Failed: Only .jpg and .png files are allowed')</script>");
                }
            }
            else
            {
                lblStatusImage.Text = "<font color='red'>Please select an Image file</font>";
                Response.Write("<script>alert('Failed: Please select an Image file')</script>");
            }
        }

        public void AlertAndRedirect(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
            "alert('" + msg + "'); window.location='" +
            Request.ApplicationPath + "manage-products.aspx';", true);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // After clicking logout
            Session.Clear(); // Remove all session
            Response.Redirect("login.aspx"); // Redirect to login page
        }
    }
}