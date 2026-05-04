<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLDonHang.aspx.cs" Inherits="WebDientu.QLDonHang" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Đơn hàng</title>

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
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #007bff;
            color: white;
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

        <h3>📦 Đơn hàng</h3>

        <asp:GridView ID="gvDonHang" runat="server"
            AutoGenerateColumns="true"
            GridLines="None" />

    </div>

</form>

</body>
</html>