using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Net; // Email
using System.Net.Mail;


namespace Rhino_App
{
    public partial class register : System.Web.UI.Page
    {
        private SqlConnection conn;
        private SqlCommand cmd;
        String connStr = WebConfigurationManager.ConnectionStrings["Rhino_DB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connStr);
            
            cmd = new SqlCommand("INSERT INTO tbl_users(firstname, lastname, email, username, password, gender, birthday, admin, create_at) values (@firstname, @lastname, @email, @username, @password, @gender, @birthday, @admin, @created)", conn);
            cmd.Parameters.AddWithValue("@firstname", txtFirst.Text);
            cmd.Parameters.AddWithValue("@lastname", txtLast.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@username", txtUser.Text);
            cmd.Parameters.AddWithValue("@password", txtPass.Text);
            cmd.Parameters.AddWithValue("@gender", drpGender.Text);
            cmd.Parameters.AddWithValue("@birthday", calBirth.Text);
            cmd.Parameters.AddWithValue("@admin", "0");
            cmd.Parameters.AddWithValue("@created", DateTime.Now.ToString());


            SqlCommand checkercmd = new SqlCommand("SELECT * FROM tbl_users WHERE username = @Username OR email = @Email", conn); ;
            checkercmd.Parameters.AddWithValue("@Username", txtUser.Text);
            checkercmd.Parameters.AddWithValue("@Email", txtEmail.Text);

            conn.Open();

            string existuser = Convert.ToString(checkercmd.ExecuteScalar());

            if (txtFirst.Text == "" || txtEmail.Text == "" || txtLast.Text == "" || txtUser.Text == "" || calBirth.Text == "")
            {
                Response.Write("<script>alert('Failed: First Name, Last Name, Email, Username - cannot be blank');</script>");
            }
            else if ( txtPass.Text != txtConfirmPass.Text) // Validation for Password and Confirm Password
            {
                Response.Write("<script>alert('Failed: Password and Confirm Password must match');</script>");
            }
            else
            {
                if (existuser == "") // If there is no user, proceed on registration - Validation for Existing user in db
                {
                    try
                    {
                        if (cmd.ExecuteNonQuery() == 1)
                        {
                            
                            Response.Write("<script>alert('Success: You have successfully registered an account');</script>");

                            // TODO: Send mail
                            SendEmail(txtEmail.Text, txtFirst.Text);

                            // Empty Fields
                            txtFirst.Text = "";
                            txtLast.Text = "";
                            txtEmail.Text = "";
                            txtUser.Text = "";
                            txtPass.Text = "";
                            txtConfirmPass.Text = "";
                            drpGender.Text = "";
                            calBirth.Text = "";
                        }
                        else
                        {

                        }
                    }
                    catch (Exception exception)
                    {
                        Response.Write("<script>alert('" + exception.ToString() + "');</script>");
                    }

                }
                else // if there's any existing user, display exising user
                {
                    // Failed : invalid inputs / existing in db
                    Response.Write("<script>alert('Failed: UserName Already Exist; Email Account Already Exist; Invalid Data Input; ');</script>");
                }
           
            }

            conn.Close();

        }
        private void SendEmail(string emailTo, string userTo)
        {
            try
            {
                string appFrom = "Rhino Store";
                string emailFrom = "rhinoapp911@gmail.com";
                string passwordFrom = "12345rhino";

                // Setup SMTP Configuration
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587); // "smtp.gmail.com", 587
                smtpClient.EnableSsl = true;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new NetworkCredential(emailFrom, passwordFrom);

                // create mail object
                MailMessage mail = new MailMessage();

                // Setting From , To, CC
                mail.To.Add(emailTo);
                mail.From = new MailAddress(emailFrom);

                // Subject, Body, Priority
                mail.Subject = "Rhino Store - You have successfully registered!";
                mail.Body = "Hello " + userTo + ", \nThank you for successully registering to our webstore!";
                mail.Priority = MailPriority.Normal;

                // Send the mail instance
                smtpClient.Send(mail);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
           
        }
    }
}