using System;
using System.Data;
using System.Collections.Generic;

namespace WebDientu
{
    public partial class QLDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //  CHỈ ADMIN
            if (Session["role"] == null || Session["role"].ToString() != "admin")
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                LoadDonHang();
            }

            LoadHeader(); // 🔥 thêm
        }

        void LoadDonHang()
        {
            ketnoi kn = new ketnoi();

            DataTable dt = kn.getData("SELECT * FROM DonHang ORDER BY Ngay DESC");

            gvDonHang.DataSource = dt;
            gvDonHang.DataBind();
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