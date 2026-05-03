using System;
using System.Data.SqlClient;
using System.Configuration;

namespace WebDientu
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadHeader();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text.Trim();
            string pass = txtPass.Text.Trim();

            if (user == "" || pass == "")
            {
                lblMsg.Text = "Vui lòng nhập đầy đủ!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // kiểm tra tồn tại
                SqlCommand check = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE Username=@u", conn);
                check.Parameters.AddWithValue("@u", user);

                int count = (int)check.ExecuteScalar();

                if (count > 0)
                {
                    lblMsg.Text = "Tài khoản đã tồn tại!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // thêm user
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Users(Username, Password, Role) VALUES(@u,@p,'user')", conn);

                cmd.Parameters.AddWithValue("@u", user);
                cmd.Parameters.AddWithValue("@p", pass);

                cmd.ExecuteNonQuery();
            }

            // auto login
            Session["user"] = user;
            Session["role"] = "user";

            Response.Redirect("Default.aspx");
        }

        // ===== HEADER (ĐÃ XOÁ CART) =====
        void LoadHeader()
        {
            if (Session["user"] != null)
                lblUser.Text = "Xin chào: " + Session["user"];
            else
                lblUser.Text = "";
        }
    }
}