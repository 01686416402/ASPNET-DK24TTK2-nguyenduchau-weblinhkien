<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="WebDientu.GioHang" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Giỏ hàng</title>

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
            width: 900px;
            margin: 30px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
        }

        h3 {
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        img {
            width: 60px;
        }

        .qty a {
            padding: 3px 7px;
            background: #ddd;
            text-decoration: none;
            border-radius: 3px;
            margin: 0 3px;
        }

        .qty a:hover {
            background: #bbb;
        }

        .total {
            text-align: right;
            font-weight: bold;
            margin-top: 15px;
            font-size: 16px;
        }

        .btn {
            margin-top: 10px;
            padding: 10px 18px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn:hover {
            background: #218838;
        }

        .empty {
            text-align: center;
            padding: 40px;
            color: gray;
        }
    </style>
</head>

<body>

<form runat="server">

    <!-- HEADER -->
    <div class="topbar">

        <div class="topbar-left">
            🔌 Web Điện Tử
        </div>

        <div class="topbar-right">

            <asp:Label ID="lblUser" runat="server"></asp:Label>

            <a href="Default.aspx">Trang chủ</a>

            <a href="GioHang.aspx">
                🛒 Giỏ hàng (<asp:Label ID="lblCartCount" runat="server"></asp:Label>)
            </a>

        </div>

        <div class="clear"></div>
    </div>

    <!-- CONTENT -->
    <div class="container">

        <h3>🛒 Giỏ hàng</h3>

        <!-- EMPTY -->
        <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="empty">
            Giỏ hàng trống
        </asp:Panel>

        <!-- CART -->
        <asp:Panel ID="pnlCart" runat="server">

            <table>
                <tr>
                    <th>Ảnh</th>
                    <th>Tên</th>
                    <th>Giá</th>
                    <th>SL</th>
                    <th>Thành tiền</th>
                    <th>X</th>
                </tr>

                <asp:Repeater ID="rpCart" runat="server" OnItemCommand="rpCart_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <img src='<%# "image/" + Eval("HinhAnh") %>' 
                                     onerror="this.src='image/no-image.png'" />
                            </td>

                            <td><%# Eval("TenSP") %></td>

                            <td>
                                <%# String.Format("{0:N0}", Eval("Gia")) %> VND
                            </td>

                            <td class="qty">
                                <asp:LinkButton runat="server"
                                    CommandName="minus"
                                    CommandArgument='<%# Eval("MaSP") %>'>-</asp:LinkButton>

                                <%# Eval("SoLuong") %>

                                <asp:LinkButton runat="server"
                                    CommandName="plus"
                                    CommandArgument='<%# Eval("MaSP") %>'>+</asp:LinkButton>
                            </td>

                            <td>
                                <%# String.Format("{0:N0}", Eval("ThanhTien")) %> VND
                            </td>

                            <td>
                                <asp:LinkButton runat="server"
                                    CommandName="delete"
                                    CommandArgument='<%# Eval("MaSP") %>'>X</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

            </table>

            <div class="total">
                Tổng: <asp:Label ID="lblTotal" runat="server"></asp:Label>
            </div>

            <asp:Button ID="btnPay" runat="server"
                Text="Thanh toán"
                CssClass="btn"
                OnClick="btnPay_Click" />

        </asp:Panel>

    </div>

</form>

</body>
</html>