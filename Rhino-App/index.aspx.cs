using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rhino_App
{
    public partial class index : System.Web.UI.Page
    {
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
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // After clicking logout
            Session.Clear(); // Remove all session
            Response.Redirect("login.aspx"); // Redirect to login page
        }
    }
}