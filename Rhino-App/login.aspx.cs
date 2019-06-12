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
        int userid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null){ // user logged in
                if (Session["admin"].ToString() == "1")
                { // checks if administrator
                    Response.Redirect("manage-products.aspx"); // redirect to product management
                }
                else
                { // if not, assume its customer
                    if (Session["ProceedLogin"].ToString() == "1") // if user clicked proceed to checkout
                    {
                        Response.Redirect("shop-cart.aspx"); // redirect to cart
                        Session["ProceedLogin"] = null; // clear up proceedlogin selection
                    }
                    else
                    {
                       Response.Redirect("shop-products.aspx"); // redirect to product catalogue
                    }
                
                }
            }
                
            Cart cart = Cart.GetShoppingCart();
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
                        userid = (int)reader["user_id"];
                    }

                    if (admin == "1") // admin = "1"
                    {
                        // Save session
                        Session["first"] = firstname;
                        Session["user"] = username;
                        Session["admin"] = admin;
                        Session["userid"] = userid;

                        // Redirect to Product Management
                        Response.Redirect("manage-products.aspx");

                    }
                    else // customer = any other number
                    { 
                        // Save session
                        Session["first"] = firstname;
                        Session["user"] = username;
                        Session["admin"] = admin;
                        Session["userid"] = userid;
                        //creating cart
                        if (Session["ProceedLogin"] != null)
                        { 
                            Response.Redirect("shop-cart.aspx"); // redirect to cart
                            Session["ProceedLogin"] = null; // clear up proceedlogin selection
                        }
                        else
                        {
                            Response.Redirect("shop-products.aspx"); // redirect to product catalogue
                        }
                        
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