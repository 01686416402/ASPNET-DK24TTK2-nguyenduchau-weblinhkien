<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebDientu._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web Điện Tử</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            margin: 0;
        }

        /* ===== HEADER ===== */
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

        .topbar-right {
            float: right;
        }

        .topbar-right a {
            color: white;
            margin-left: 12px;
            text-decoration: none;
            font-weight: bold;
        }

        .topbar-right a:hover {
            text-decoration: underline;
        }

        .clear {
            clear: both;
        }

        /* ===== CONTAINER ===== */
        .container {
            width: 1100px;
            margin: auto;
        }

        .search-box {
            text-align: center;
            margin: 20px 0;
        }

        /* ===== LAYOUT ===== */
        .layout {
            display: flex;
            gap: 15px;
        }

        /* LEFT MENU */
        .left-menu {
            width: 220px;
            background: white;
            padding: 12px;
            border: 1px solid #ddd;
        }

        .left-menu a {
            display: block;
            padding: 6px;
            text-decoration: none;
            color: #333;
        }

        .left-menu a:hover {
            background: #eee;
        }

        /* RIGHT CONTENT */
        .right-content {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
        }

        /* PRODUCT */
        .product {
            width: 180px;
            border: 1px solid #ddd;
            background: white;
            padding: 10px;
            margin: 8px;
            text-align: center;
            border-radius: 6px;
        }

        .product img {
            width: 110px;
            height: 110px;
            object-fit: contain;
        }

        .price {
            color: red;
            font-weight: bold;
            margin: 5px 0;
        }

    </style>
</head>

<body>

<form id="form1" runat="server" autocomplete="off">

    <!-- HEADER -->
    <div class="topbar">

        <div class="topbar-left">
            🔌 Web Điện Tử
        </div>

        <div class="topbar-right">

            <asp:Label ID="lblUser" runat="server"></asp:Label>

            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="Login.aspx">Đăng nhập</asp:HyperLink>
            <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="Register.aspx">Đăng ký</asp:HyperLink>
            <asp:HyperLink ID="lnkLogout" runat="server" NavigateUrl="Logout.aspx">Đăng xuất</asp:HyperLink>

            <asp:HyperLink ID="lnkAdmin" runat="server" NavigateUrl="QLSanPham.aspx">Quản lý</asp:HyperLink>

            <asp:HyperLink ID="lnkOrder" runat="server"
                NavigateUrl="QLDonHang.aspx"
                Visible="false">
                Đơn hàng
            </asp:HyperLink>

            <asp:HyperLink ID="lnkCart" runat="server" NavigateUrl="GioHang.aspx">
                🛒 Giỏ hàng (<asp:Label ID="lblCartCount" runat="server"></asp:Label>)
            </asp:HyperLink>

        </div>

        <div class="clear"></div>
    </div>

    <!-- CONTENT -->
    <div class="container">

        <!-- SEARCH -->
        <div class="search-box">
            <asp:TextBox ID="txtSearch" runat="server" Width="200" placeholder="Tìm..." />
            <asp:Button ID="btnSearch" runat="server" Text="Tìm" OnClick="btnSearch_Click" />
        </div>

        <div class="layout">

            <!-- LEFT MENU -->
            <div class="left-menu">

                <b>Danh mục</b>
                <hr />

                <a href="Default.aspx">Tất cả</a>

                <asp:Repeater ID="rpLoai" runat="server">
                    <ItemTemplate>
                        <a href='Default.aspx?loai=<%# Eval("Loai") %>'>
                            <%# Eval("Loai") %>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>

            </div>

            <!-- RIGHT -->
            <div class="right-content">

                <asp:Repeater ID="rpSP" runat="server" OnItemCommand="rpSP_ItemCommand">

                    <ItemTemplate>

                        <div class="product">

                            <img src='<%# "image/" + Eval("HinhAnh") %>'
                                 onerror="this.src='image/no-image.png'" />

                            <div><b><%# Eval("TenSP") %></b></div>

                            <div class="price">
                                <%# String.Format("{0:N0}", Eval("Gia")) %> đ
                            </div>

                            <div><%# Eval("Loai") %></div>

                            <div style="margin-top:6px;">
                                <a href='<%# "ChiTiet.aspx?id=" + Eval("MaSP") %>'>
                                    Xem chi tiết
                                </a>
                                |
                                <asp:LinkButton runat="server"
                                    CommandName="addCart"
                                    CommandArgument='<%# Eval("MaSP") %>'>
                                    🛒
                                </asp:LinkButton>
                            </div>

                        </div>

                    </ItemTemplate>

                </asp:Repeater>

            </div>

        </div>

    </div>

</form>

</body>
</html>