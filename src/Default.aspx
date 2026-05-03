<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebDientu._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web Điện Tử</title>

    <style>
        body { font-family: Arial; background: #f5f5f5; margin: 0; }

        .topbar {
            background: #007bff;
            color: white;
            padding: 12px 20px;
        }

        .topbar-left {
            float: left;
            font-size: 18px;
            font-weight: bold;
        }

        .topbar-right { float: right; }

        .topbar-right a {
            color: white;
            margin-left: 12px;
            text-decoration: none;
            font-weight: bold;
        }

        .clear { clear: both; }

        .container {
            width: 1000px;
            margin: 20px auto;
        }

        .product {
            width: 180px;
            border: 1px solid #ddd;
            background: white;
            padding: 10px;
            margin: 8px;
            float: left;
            text-align: center;
        }

        .product img {
            width: 110px;
            height: 110px;
            object-fit: contain;
        }

        .price {
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>

<form runat="server">

    <!-- HEADER -->
    <div class="topbar">

        <div class="topbar-left">
            Web Điện Tử
        </div>

        <div class="topbar-right">

            <asp:Label ID="lblUser" runat="server"></asp:Label>

            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="Login.aspx">Đăng nhập</asp:HyperLink>
            <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="Register.aspx">Đăng ký</asp:HyperLink>
            <asp:HyperLink ID="lnkLogout" runat="server" NavigateUrl="Logout.aspx">Đăng xuất</asp:HyperLink>

            <asp:HyperLink ID="lnkAdmin" runat="server" NavigateUrl="QLSanPham.aspx">Quản lý</asp:HyperLink>

        </div>

        <div class="clear"></div>
    </div>

    <!-- CONTENT -->
    <div class="container">

        <asp:Repeater ID="rpSP" runat="server">
            <ItemTemplate>

                <div class="product">

                    <img src='<%# "image/" + Eval("HinhAnh") %>'
                         onerror="this.src='image/no-image.png'" />

                    <div><b><%# Eval("TenSP") %></b></div>

                    <div class="price">
                        <%# String.Format("{0:N0}", Eval("Gia")) %> đ
                    </div>

                    <div>
                        <a href='<%# "ChiTiet.aspx?id=" + Eval("MaSP") %>'>
                            Xem chi tiết
                        </a>
                    </div>

                </div>

            </ItemTemplate>
        </asp:Repeater>

    </div>

</form>

</body>
</html>