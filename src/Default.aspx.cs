using System;
using System.Data;
using System.Web.UI;

namespace WebDientu
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLoai();
                LoadSanPham();
            }
        }

        // LOAD LOẠI
        void LoadLoai()
        {
            ketnoi kn = new ketnoi();
            DataTable dt = kn.getData("SELECT DISTINCT Loai FROM SanPham");

            rpLoai.DataSource = dt;
            rpLoai.DataBind();
        }

        // LOAD SẢN PHẨM
        void LoadSanPham()
        {
            ketnoi kn = new ketnoi();

            string loai = Request.QueryString["loai"];
            string keyword = Request.QueryString["search"];

            string sql = "SELECT * FROM SanPham WHERE 1=1";

            if (!string.IsNullOrEmpty(loai))
                sql += " AND Loai = N'" + loai + "'";

            if (!string.IsNullOrEmpty(keyword))
                sql += " AND TenSP LIKE N'%" + keyword + "%'";

            DataTable dt = kn.getData(sql);

            rpSP.DataSource = dt;
            rpSP.DataBind();
        }

        // SEARCH
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            string loai = Request.QueryString["loai"];

            string url = "Default.aspx";

            if (!string.IsNullOrEmpty(keyword) || !string.IsNullOrEmpty(loai))
            {
                url += "?";

                if (!string.IsNullOrEmpty(keyword))
                    url += "search=" + keyword;

                if (!string.IsNullOrEmpty(loai))
                {
                    if (!string.IsNullOrEmpty(keyword)) url += "&";
                    url += "loai=" + loai;
                }
            }

            Response.Redirect(url);
        }
    }
}