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
using System.Net; // Email
using System.Net.Mail;

namespace Rhino_App
{
    public partial class forgot_password : System.Web.UI.Page
    {
        private SqlConnection conn;
        private SqlCommand cmd;
        SqlDataReader reader;
        String connStr = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        string firstname;
        string pass;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null) // user logged in
                if (Session["admin"].ToString() == "1") // checks if administrator
                    Response.Redirect("manage-products.aspx"); // redirect to product management
                else // if not, assume its customer
                    Response.Redirect("shop-products.aspx"); // redirect to product catalogue

        }

        protected void btnSendPassword_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connStr);

            conn.Open();

            // login authentication
            if (txtEmail.Text == "")
            {
                Response.Write("<script> alert('Failed to Send: Please enter your email'); </script>");
            }
            else
            {

                string query = "SELECT * FROM tbl_users WHERE email='" + txtEmail.Text + "'";
                cmd = new SqlCommand(query, conn);

                reader = cmd.ExecuteReader(); // execute query inputs
                if (reader.HasRows) // check if there's any existing users
                {

                    while (reader.Read())
                    {
                        // reads specific columns and store it to variable
                        firstname = reader["firstname"].ToString();
                        pass = reader["password"].ToString();
                        SendEmail(txtEmail.Text);
                        Response.Write("<script>alert('Success : We sent your password to your email');</script>");
                    }
                }
                else
                {
                    // Failed
                    Response.Write("<script>alert('Failed to Send : No existing account');</script>");
                }

                reader.Close();
                conn.Close();
            }
        }

        private void SendEmail(string emailTo)
        {
            try
            {
                string appFrom = "Rhino Online Store";
                string emailFrom = "rhinoapp911@gmail.com";
                string passwordFrom = "12345rhino";

                // Setup SMTP Configuration
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587); // "smtp.gmail.com", 587
                smtpClient.EnableSsl = true;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential(emailFrom, passwordFrom);

                // Create mail object
                MailMessage mail = new MailMessage();

                // Setting From , To, CC
                mail.To.Add(emailTo);
                mail.From = new MailAddress(emailFrom, appFrom);

                // Subject, Body, Priority
                mail.Subject = "Rhino Store - Password Recovery";
                mail.IsBodyHtml = true;
                mail.Body = CreateEmailContent();
                mail.Priority = MailPriority.Normal;

                // Send the mail instance
                smtpClient.Send(mail);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


        }

        private string CreateEmailContent()
        {
            string body = string.Empty;

            StreamReader reader = new StreamReader(Server.MapPath("~/email-templates/forgot-pass.html")); // find the html file

            body = reader.ReadToEnd(); // scans the html file

            body = body.Replace("{fname}", firstname); // Replace Parameter "{fname}" string in HTML

            body = body.Replace("{pass}", pass); // Replace Parameter "{pass}" string in HTML

            return body; // return whole content
        }
    }
}