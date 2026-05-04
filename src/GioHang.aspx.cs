using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebDientu
{
    public partial class GioHang : Page
    {
        List<CartItem> cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            cart = Session["cart"] == null
                ? new List<CartItem>()
                : (List<CartItem>)Session["cart"];

            if (!IsPostBack)
                BindData();

            
            UpdateHeader();
        }

        // ===== HIỂN THỊ =====
        void BindData()
        {
            if (cart.Count == 0)
            {
                pnlCart.Visible = false;
                pnlEmpty.Visible = true;
                lblTotal.Text = "0";
                return;
            }

            pnlCart.Visible = true;
            pnlEmpty.Visible = false;

            rpCart.DataSource = cart;
            rpCart.DataBind();

            int total = 0;
            foreach (CartItem item in cart)
                total += item.ThanhTien;

            lblTotal.Text = String.Format(new CultureInfo("vi-VN"), "{0:N0}", total) + " VND";
        }

        
        protected void rpCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].MaSP == id)
                {
                    if (e.CommandName == "plus")
                        cart[i].SoLuong++;

                    else if (e.CommandName == "minus")
                    {
                        cart[i].SoLuong--;
                        if (cart[i].SoLuong <= 0)
                            cart.RemoveAt(i);
                    }
                    else if (e.CommandName == "delete")
                        cart.RemoveAt(i);

                    break;
                }
            }

            Session["cart"] = cart;

            BindData();
            UpdateHeader(); // 
        }

        // ===== THANH TOÁN =====
        protected void btnPay_Click(object sender, EventArgs e)
        {
            if (cart.Count == 0) return;

            Response.Redirect("ThanhToan.aspx");
        }

        // ===== HEADER =====
        void UpdateHeader()
        {
            // USER
            if (Session["user"] != null)
                lblUser.Text = "Xin chào: " + Session["user"];
            else
                lblUser.Text = "";

            // CART COUNT
            int count = 0;

            if (Session["cart"] != null)
            {
                var temp = (List<CartItem>)Session["cart"];
                foreach (var item in temp)
                    count += item.SoLuong;
            }

            lblCartCount.Text = count.ToString();
        }
    }
}