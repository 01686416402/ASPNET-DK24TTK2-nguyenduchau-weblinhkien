<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="WebDientu.ThanhToan" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Thanh toán</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            margin: 0;
        }

        .topbar {
            background: #222;
            color: white;
            padding: 10px 20px;
        }

        .topbar a {
            color: white;
            margin-left: 10px;
            text-decoration: none;
        }

        .box {
            width: 350px;
            margin: 50px auto;
            background: white;
            padding: 15px;
            border: 1px solid #ddd;
        }

        input {
            width: 100%;
            padding: 6px;
            margin: 6px 0;
        }

        .btn {
            background: green;
            color: white;
            padding: 8px;
            border: none;
            width: 100%;
        }

        .back {
            display: block;
            margin-bottom: 10px;
            text-decoration: none;
            color: #007bff;
        }

    </style>
</head>

<body>

<form runat="server" autocomplete="off">

    <!-- fix autofill -->
    <input type="text" style="display:none" />

    <!-- HEADER -->
    <div class="topbar">
        🔌 Web Điện Tử
        <a href="Default.aspx">Trang chủ</a>
        <a href="GioHang.aspx">Giỏ hàng</a>
    </div>

    <div class="box">

        <a href="GioHang.aspx" class="back">← Quay lại giỏ hàng</a>

        <h3>Thanh toán</h3>

        <asp:TextBox ID="txtTen" runat="server" placeholder="Tên" /><br />
        <asp:TextBox ID="txtSDT" runat="server" placeholder="SĐT" /><br />
        <asp:TextBox ID="txtDiaChi" runat="server" placeholder="Địa chỉ" /><br />
        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" /><br />

        <asp:Button ID="btnDone" runat="server"
            Text="Hoàn tất"
            CssClass="btn"
            OnClick="btnDone_Click" />

        <br /><br />

        <asp:Label ID="lblMsg" runat="server"></asp:Label>

    </div>

</form>

</body>
</html>