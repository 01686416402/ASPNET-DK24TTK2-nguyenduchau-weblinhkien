using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebDientu
{
    public partial class QLSanPham : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔐 CHẶN USER (chỉ admin)
            if (Session["role"] == null || Session["role"].ToString() != "admin")
                Response.Redirect("Default.aspx");

            if (!IsPostBack)
                LoadData();

            LoadHeader();
        }

        // ===== LOAD DATA =====
        void LoadData()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM SanPham", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvSP.DataSource = dt;
                gvSP.DataBind();
            }
        }

        // ===== THÊM =====
        protected void btnThem_Click(object sender, EventArgs e)
        {
            string ten = txtTen.Text.Trim();
            string gia = txtGia.Text.Trim();
            string loai = txtLoai.Text.Trim();
            string tt = txtThuocTinh.Text.Trim();

            if (ten == "" || gia == "") return;

            int giaInt;
            if (!int.TryParse(gia, out giaInt)) return;

            string tenFile = "";

            if (fileHinh.HasFile)
            {
                string folder = Server.MapPath("~/image/");
                tenFile = Guid.NewGuid().ToString() + "_" + fileHinh.FileName;
                fileHinh.SaveAs(folder + tenFile);
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "INSERT INTO SanPham(TenSP, Gia, Loai, ThuocTinh, HinhAnh) VALUES(@ten,@gia,@loai,@tt,@hinh)";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ten", ten);
                cmd.Parameters.AddWithValue("@gia", giaInt);
                cmd.Parameters.AddWithValue("@loai", loai);
                cmd.Parameters.AddWithValue("@tt", tt);
                cmd.Parameters.AddWithValue("@hinh", tenFile);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            txtTen.Text = "";
            txtGia.Text = "";
            txtLoai.Text = "";
            txtThuocTinh.Text = "";

            LoadData();
        }

        // ===== XOÁ =====
        protected void gvSP_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvSP.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM SanPham WHERE MaSP=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            LoadData();
        }

        // ===== EDIT =====
        protected void gvSP_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSP.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void gvSP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSP.EditIndex = -1;
            LoadData();
        }

        // ===== UPDATE =====
        protected void gvSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvSP.DataKeys[e.RowIndex].Value);

            string ten = ((TextBox)gvSP.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string gia = ((TextBox)gvSP.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string loai = ((TextBox)gvSP.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string tt = ((TextBox)gvSP.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            int giaInt;
            if (!int.TryParse(gia, out giaInt)) return;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "UPDATE SanPham SET TenSP=@ten, Gia=@gia, Loai=@loai, ThuocTinh=@tt WHERE MaSP=@id";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ten", ten);
                cmd.Parameters.AddWithValue("@gia", giaInt);
                cmd.Parameters.AddWithValue("@loai", loai);
                cmd.Parameters.AddWithValue("@tt", tt);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            gvSP.EditIndex = -1;
            LoadData();
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