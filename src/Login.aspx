<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebDientu.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Đăng nhập</title>

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

        .clear {
            clear: both;
        }

        /* ===== LOGIN BOX ===== */
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
            Web Điện Tử
        </div>

        <div class="topbar-right">

            <asp:Label ID="lblUser" runat="server"></asp:Label>

            <a href="Default.aspx">Trang chủ</a>
            <a href="Register.aspx">Đăng ký</a>

        </div>

        <div class="clear"></div>
    </div>

    <!-- LOGIN BOX -->
    <div class="box">

        <h3>Đăng nhập</h3>

        <asp:TextBox ID="txtUser" runat="server" placeholder="Tài khoản" />

        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="Mật khẩu" />

        <asp:Button ID="btnLogin" runat="server"
            Text="Đăng nhập"
            CssClass="btn"
            OnClick="btnLogin_Click" />

        <br /><br />

        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

    </div>

</form>

</body>
</html>