using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebDientu
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        protected void btnDone_Click(object sender, EventArgs e)
        {
            string ten = txtTen.Text.Trim();
            string sdt = txtSDT.Text.Trim();
            string diachi = txtDiaChi.Text.Trim();
            string email = txtEmail.Text.Trim();

            // kiểm tra rỗng
            if (ten == "" || sdt == "" || diachi == "" || email == "")
            {
                lblMsg.Text = "Vui lòng nhập đầy đủ!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "INSERT INTO DonHang(Ten, SDT, DiaChi, Email) VALUES(@ten, @sdt, @dc, @email)";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ten", ten);
                cmd.Parameters.AddWithValue("@sdt", sdt);
                cmd.Parameters.AddWithValue("@dc", diachi);
                cmd.Parameters.AddWithValue("@email", email);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // xoá giỏ
            Session.Remove("cart");

            // thông báo
            lblMsg.Text = "Thanh toán thành công!";
            lblMsg.ForeColor = System.Drawing.Color.Green;

            // quay về trang chủ
            Response.AddHeader("REFRESH", "2;URL=Default.aspx");
        }
    }
}