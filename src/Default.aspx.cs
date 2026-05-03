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
                LoadSanPham();

            CheckLogin();
        }

        // LOAD SẢN PHẨM
        void LoadSanPham()
        {
            ketnoi kn = new ketnoi();
            DataTable dt = kn.getData("SELECT * FROM SanPham");

            rpSP.DataSource = dt;
            rpSP.DataBind();
        }

        // LOGIN UI
        void CheckLogin()
        {
            if (Session["user"] == null)
            {
                lblUser.Text = "";

                lnkLogin.Visible = true;
                lnkRegister.Visible = true;
                lnkLogout.Visible = false;
                lnkAdmin.Visible = false;
            }
            else
            {
                lblUser.Text = "Xin chào: " + Session["user"].ToString();

                lnkLogin.Visible = false;
                lnkRegister.Visible = false;
                lnkLogout.Visible = true;

                if (Session["role"] != null && Session["role"].ToString() == "admin")
                    lnkAdmin.Visible = true;
                else
                    lnkAdmin.Visible = false;
            }
        }
    }
}