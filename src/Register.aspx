<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebDientu.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Đăng ký</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            margin: 0;
        }

        /* ===== HEADER MỚI ===== */
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

        .clear {
            clear: both;
        }

        /* ===== BOX ===== */
        .box {
            width: 320px;
            margin: 60px auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            text-align: center;
        }

        input {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
        }

        .btn {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            cursor: pointer;
            font-weight: bold;
        }

        .btn:hover {
            background: #0056b3;
        }
    </style>
</head>

<body>

<form runat="server" autocomplete="off">

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

    <!-- REGISTER BOX -->
    <div class="box">

        <h3>Đăng ký</h3>

        <asp:TextBox ID="txtUser" runat="server" placeholder="Tài khoản"></asp:TextBox>

        <asp:TextBox ID="txtPass" runat="server"
            TextMode="Password"
            placeholder="Mật khẩu"></asp:TextBox>

        <asp:Button ID="btnRegister" runat="server"
            Text="Đăng ký"
            CssClass="btn"
            OnClick="btnRegister_Click" />

        <br /><br />

        <asp:Label ID="lblMsg" runat="server"></asp:Label>

    </div>

</form>

</body>
</html>