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
    public partial class change_password : System.Web.UI.Page
    {
        private SqlConnection conn;
        private SqlCommand cmd;
        SqlDataReader reader;
        String connStr = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = Request.QueryString["id"];

            if (userid == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string userid = Request.QueryString["id"]; // get userid
            conn = new SqlConnection(connStr);

            conn.Open();

            // validation for password change
            if (txtPassword.Text == "" || txtConfirmPass.Text == "")
            {
                // fail: if empty either fields
                Response.Write("<script> alert('Failed to Change: Please enter your new password / confirm password'); </script>");
            }
            else if (txtPassword.Text != txtConfirmPass.Text)
            {
                // fail: or does not match
                Response.Write("<script> alert('Failed to Change: Please make sure your password and confirm password are matched'); </script>");
            }
            else
            {
                // pass
                cmd = new SqlCommand("UPDATE tbl_users SET password=@password WHERE user_id=@userid", conn);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@userid", userid); //TODO: decoded
                try
                {
                    cmd.ExecuteNonQuery(); // Execute Query

                    AlertAndRedirect("Sucess: Your password has changed.");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.ToString() + "');</script>");
                }
            }
        }

        public void AlertAndRedirect(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
            "alert('" + msg + "'); window.location='" +
            Request.ApplicationPath + "login.aspx';", true);
        }
    }
}