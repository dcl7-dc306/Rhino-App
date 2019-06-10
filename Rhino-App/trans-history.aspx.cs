﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Rhino_App
{
    public partial class trans_history : System.Web.UI.Page
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
                else
                {
                    conn = new SqlConnection(connStr);
                    conn.Open();
                    cmd = new SqlCommand("SELECT tbl_orders.*,tbl_users.username FROM tbl_orders INNER JOIN tbl_users ON tbl_orders.user_id = tbl_users.user_id ", conn);
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    RepeaterOrders.DataSource = dt;
                    RepeaterOrders.DataBind();
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

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            Orders_tb.Visible = false;
            Itens_tb.Visible = true;
            int orderid = int.Parse((sender as LinkButton).CommandArgument);
            conn = new SqlConnection(connStr);
            conn.Open();
            cmd = new SqlCommand("SELECT tbl_order_items.*,tbl_products.name FROM tbl_order_items INNER JOIN tbl_products ON tbl_order_items.product_id = tbl_products.product_id AND order_id =" + orderid , conn);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            RepeaterItens.DataSource = dt;
            RepeaterItens.DataBind();
        }
    }
}