using System;
using System.Collections.Generic;
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

            LoadHeader();
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

                    string hinh = r["HinhAnh"].ToString();
                    imgSP.ImageUrl = "image/" + hinh;

                    ViewState["Gia"] = gia;
                    ViewState["HinhAnh"] = hinh;
                }

                r.Close();
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

        // ===== ADD GIỎ =====
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int id;
            if (!int.TryParse(Request.QueryString["id"], out id)) return;

            int sl;
            if (!int.TryParse(txtSL.Text, out sl) || sl <= 0)
                sl = 1;

            List<CartItem> cart = Session["cart"] == null
                ? new List<CartItem>()
                : (List<CartItem>)Session["cart"];

            bool found = false;

            foreach (var item in cart)
            {
                if (item.MaSP == id)
                {
                    item.SoLuong += sl;
                    found = true;
                    break;
                }
            }

            if (!found)
            {
                cart.Add(new CartItem
                {
                    MaSP = id,
                    TenSP = lblTen.Text,
                    Gia = ViewState["Gia"] != null ? (int)ViewState["Gia"] : 0,
                    SoLuong = sl,
                    HinhAnh = ViewState["HinhAnh"] != null ? ViewState["HinhAnh"].ToString() : ""
                });
            }

            Session["cart"] = cart;


            Response.Redirect(Request.RawUrl);
        }
    }
}