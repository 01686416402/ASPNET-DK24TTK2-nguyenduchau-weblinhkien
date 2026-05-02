<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="WebDientu.ChiTiet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Chi tiết</title>

    <style>
        body {
            font-family: Arial;
            background: #f5f5f5;
            margin: 0;
        }

        /* HEADER */
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
            margin-left: 15px;
            text-decoration: none;
            font-weight: bold;
        }

        .clear {
            clear: both;
        }

        /* CONTAINER */
        .container {
            width: 900px;
            margin: 50px auto;
        }

        .box {
            display: flex;
            gap: 40px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        /* IMAGE */
        .left img {
            width: 280px;
            height: 280px;
            object-fit: contain;
        }

        /* RIGHT */
        .right {
            flex: 1;
        }

        .price {
            color: red;
            font-size: 22px;
            font-weight: bold;
            margin: 10px 0;
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
            <a href="Default.aspx">Trang chủ</a>
        </div>

        <div class="clear"></div>
    </div>

    <!-- CONTENT -->
    <div class="container">

        <div class="box">

            <!-- LEFT -->
            <div class="left">
                <asp:Image ID="imgSP" runat="server" />
            </div>

            <!-- RIGHT -->
            <div class="right">

                <h2>
                    <asp:Label ID="lblTen" runat="server" />
                </h2>

                <p class="price">
                    <asp:Label ID="lblGia" runat="server" /> VND
                </p>

                <p>
                    <b>Loại:</b> 
                    <asp:Label ID="lblLoai" runat="server" />
                </p>

                <p>
                    <asp:Label ID="lblThuocTinh" runat="server" />
                </p>

               
                <p style="color:green; font-weight:bold; margin-top:20px;">
                    ✔ Sản phẩm đang có sẵn
                </p>

            </div>

        </div>

    </div>

</form>

</body>
</html>