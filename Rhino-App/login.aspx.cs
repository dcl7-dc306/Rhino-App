using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;

namespace Rhino_App
{
    public partial class login : System.Web.UI.Page
    {
        private SqlConnection conn;
        private SqlCommand cmd;
        SqlDataReader reader;
        String connStr = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        string firstname;
        string username;
        string admin;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connStr);

            conn.Open();

            // login authentication
            if (txtUser.Text == "" || txtPass.Text == "")
            {
                Response.Write("<script> alert('Failed to login: Please enter your credentials'); </script>");
            }
            else
            {
              
                string query = "SELECT * FROM tbl_users WHERE username='" + txtUser.Text + "' and password='" + txtPass.Text + "'";
                cmd = new SqlCommand(query, conn);

                reader = cmd.ExecuteReader(); // execute query inputs
                if (reader.HasRows) // check if there's any existing users
                {

                    while (reader.Read())
                    {
                        // reads specific columns and store it to variable
                        firstname = reader["firstname"].ToString();
                        username = reader["username"].ToString();
                        admin = reader["admin"].ToString();
                    }

                    if (admin == "1") // admin = "1"
                    {
                        // Save session
                        Session["first"] = firstname;
                        Session["user"] = username;
                        Session["admin"] = admin;

                        // TODO: Admin Dashboard goes here
                        Response.Redirect("manage-products.aspx");

                    }
                    else // customer = any other number
                    {
                        // Save session
                        Session["first"] = firstname;
                        Session["user"] = username;
                        Session["admin"] = admin;

                        // TODO: Customer pages here
                        Response.Write("<script>alert('TODO: Customer User');</script>");
                    }

                }
                else
                {
                    // Test
                    Response.Write("<script>alert('Invalid Username and Password');</script>");
                }

                reader.Close();
                conn.Close();
            }
        }

        
    }
}