using System;
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
        public decimal SumTotal=0;
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
                    AdminPanel.Visible = false;
                    Orders_tb.Visible = false;
                    CLientOrders.Visible = true;
                    SumTotal = 0;

                    conn = new SqlConnection(connStr);
                    conn.Open();
                    cmd = new SqlCommand("SELECT tbl_orders.* FROM tbl_orders WHERE user_id=" + Session["userid"].ToString(), conn);
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);

                    RepeaterClientOrders.DataSource = dt;
                    RepeaterClientOrders.DataBind();
                    if (dt.Rows.Count > 0)
                    {
                        cmd = new SqlCommand("SELECT SUM(total) FROM tbl_orders WHERE user_id=" + Session["userid"].ToString(), conn);
                        SumTotal = (decimal)cmd.ExecuteScalar();
                    }
                    conn.Close();
                }
                else
                {
                    SumTotal = 0;
                    conn = new SqlConnection(connStr);
                    conn.Open();
                    cmd = new SqlCommand("SELECT tbl_orders.*,tbl_users.username FROM tbl_orders INNER JOIN tbl_users ON tbl_orders.user_id = tbl_users.user_id ", conn);
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    
                        RepeaterOrders.DataSource = dt;
                        RepeaterOrders.DataBind();
                    if (dt.Rows.Count > 0)
                    {
                        cmd = new SqlCommand("SELECT SUM(total) FROM tbl_orders INNER JOIN tbl_users ON tbl_orders.user_id = tbl_users.user_id", conn);
                        SumTotal = (decimal)cmd.ExecuteScalar();
                    }
                    conn.Close();
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
            SumTotal = 0;
            int orderid = int.Parse((sender as LinkButton).CommandArgument);
            conn = new SqlConnection(connStr);
            conn.Open();
            cmd = new SqlCommand("SELECT tbl_order_items.*,tbl_products.name FROM tbl_order_items INNER JOIN tbl_products ON tbl_order_items.product_id = tbl_products.product_id WHERE order_id =" + orderid , conn);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            RepeaterItens.DataSource = dt;
            RepeaterItens.DataBind();
            if (dt.Rows.Count > 0)
            {
                cmd = new SqlCommand("SELECT total FROM tbl_orders WHERE order_id =" + orderid, conn);
                SumTotal = (decimal)cmd.ExecuteScalar();
            }
            conn.Close();
        }
        protected void btnDetailsClient_Click(object sender, EventArgs e)
        {

            CLientOrders.Visible = false;
            ClientItems.Visible = true;
            SumTotal = 0;
            int orderid = int.Parse((sender as LinkButton).CommandArgument);
            conn = new SqlConnection(connStr);
            conn.Open();
            cmd = new SqlCommand("SELECT tbl_order_items.*,tbl_products.name FROM tbl_order_items INNER JOIN tbl_products ON tbl_order_items.product_id = tbl_products.product_id WHERE order_id =" + orderid, conn);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            RepeaterItensClient.DataSource = dt;
            RepeaterItensClient.DataBind();
            cmd = new SqlCommand("SELECT total FROM tbl_orders WHERE order_id =" + orderid, conn);
            if (dt.Rows.Count > 0)
            {
                SumTotal = (decimal)cmd.ExecuteScalar();                
            }
            conn.Close();
        }
        protected void btnBack_Click(object sender, EventArgs e) {
            if (Session["admin"].ToString() != "1") // checks if not administrator
            {
                CLientOrders.Visible = true;
                ClientItems.Visible = false;
            }
            else {
                Orders_tb.Visible = true;
                Itens_tb.Visible = false;
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Orders_tb.Visible = true;
            Itens_tb.Visible = false;
            SumTotal = 0;
            conn = new SqlConnection(connStr);
            conn.Open();
            // search anything by product name
            string qry = $"SELECT tbl_orders.*,tbl_users.username FROM tbl_orders INNER JOIN tbl_users ON tbl_orders.user_id = tbl_users.user_id LEFT JOIN tbl_order_items ON tbl_orders.order_id = tbl_order_items.order_id LEFT JOIN tbl_products ON tbl_order_items.product_id = tbl_products.product_id WHERE tbl_orders.order_id LIKE '%{txtOrderId.Text}%' AND tbl_orders.user_id LIKE '%{txtCustomerId.Text}%' AND tbl_orders.total LIKE '%{txtPrice.Text}%' AND tbl_users.username LIKE '%{txtCustomerName.Text}%' AND tbl_products.name LIKE '%{txtProdName.Text}%'";
            if(txtFrom.Text!="" && txtTo.Text !="")
            qry += $" AND tbl_orders.create_at BETWEEN '{txtFrom.Text}' AND '{txtTo.Text}' ";

            qry += "COLLATE SQL_Latin1_General_CP1_CI_AS";
            SqlDataAdapter da = new SqlDataAdapter(qry, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            RepeaterOrders.DataSource = dt;
            RepeaterOrders.DataBind();

            if(dt.Rows.Count <= 0)
              Response.Write("<script>alert('Search Orders: No Orders to Show');</script>");
            
            qry = $"SELECT SUM(total) FROM tbl_orders tbl_orders INNER JOIN tbl_users ON tbl_orders.user_id = tbl_users.user_id LEFT JOIN tbl_order_items ON tbl_orders.order_id = tbl_order_items.order_id LEFT JOIN tbl_products ON tbl_order_items.product_id = tbl_products.product_id WHERE tbl_orders.order_id LIKE '%{txtOrderId.Text}%' AND tbl_orders.user_id LIKE '%{txtCustomerId.Text}%' AND tbl_orders.total LIKE '%{txtPrice.Text}%' AND tbl_users.username LIKE '%{txtCustomerName.Text}%' AND tbl_products.name LIKE '%{txtProdName.Text}%'";
            if (txtFrom.Text != "" && txtTo.Text != "")
                qry += $" AND tbl_orders.create_at BETWEEN '{txtFrom.Text}' AND '{txtTo.Text}' ";
            qry += "COLLATE SQL_Latin1_General_CP1_CI_AS";

            if (dt.Rows.Count > 0)
            {
                cmd = new SqlCommand(qry, conn);
                SumTotal = (decimal)cmd.ExecuteScalar();
            }
            conn.Close();
        }
    }
}