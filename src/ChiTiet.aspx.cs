using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace WebDientu
{
    public partial class ChiTiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadSP();
        }

        // ===== LOAD SẢN PHẨM =====
        void LoadSP()
        {
            int id;
            if (!int.TryParse(Request.QueryString["id"], out id)) return;

            string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM SanPham WHERE MaSP=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                SqlDataReader r = cmd.ExecuteReader();

                if (r.Read())
                {
                    lblTen.Text = r["TenSP"].ToString();

                    int gia = Convert.ToInt32(r["Gia"]);
                    lblGia.Text = String.Format(new CultureInfo("vi-VN"), "{0:N0}", gia);

                    lblLoai.Text = r["Loai"].ToString();
                    lblThuocTinh.Text = r["ThuocTinh"].ToString();

                    imgSP.ImageUrl = "image/" + r["HinhAnh"].ToString();
                }

                r.Close();
            }
        }
    }
}