using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rhino_App
{
    public partial class trans_history : System.Web.UI.Page
    {
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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // After clicking logout
            Session.Clear(); // Remove all session
            Response.Redirect("login.aspx"); // Redirect to login page
        }
    }
}