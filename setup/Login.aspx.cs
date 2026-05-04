using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;

namespace WebDientu
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMsg.Text = "";
            }

            LoadHeader();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            if (username == "" || password == "")
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Vui lòng nhập đầy đủ tài khoản và mật khẩu!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT Username, Role FROM Users WHERE Username=@u AND Password=@p";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@u", username);
                    cmd.Parameters.AddWithValue("@p", password);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        Session["user"] = reader["Username"].ToString();
                        Session["role"] = reader["Role"].ToString();

                        reader.Close();
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "❌ Sai tài khoản hoặc mật khẩu!";
                        reader.Close();
                    }
                }
            }
        }

        // ===== HEADER =====
        void LoadHeader()
        {
            if (Session["user"] != null)
                lblUser.Text = "Xin chào: " + Session["user"];
            else
                lblUser.Text = "";

            int count = 0;

            if (Session["cart"] != null)
            {
                var cart = (List<CartItem>)Session["cart"];
                foreach (var item in cart)
                    count += item.SoLuong;
            }

            lblCartCount.Text = count.ToString();
        }
    }
}