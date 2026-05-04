<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLSanPham.aspx.cs" Inherits="WebDientu.QLSanPham" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Quản lý sản phẩm</title>

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

        /* ===== CONTAINER ===== */
        .container {
            width: 1000px;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
        }

        h3 {
            margin-top: 0;
        }

        input {
            padding: 6px;
            margin: 5px;
        }

        .btn {
            padding: 6px 12px;
            background: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        .btn:hover {
            background: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
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

        img {
            width: 60px;
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

        <h3>Quản lý sản phẩm</h3>

        <!-- FORM -->
        <div>
            <asp:TextBox ID="txtTen" runat="server" placeholder="Tên"></asp:TextBox>
            <asp:TextBox ID="txtGia" runat="server" placeholder="Giá"></asp:TextBox>
            <asp:TextBox ID="txtLoai" runat="server" placeholder="Loại"></asp:TextBox>
            <asp:TextBox ID="txtThuocTinh" runat="server" placeholder="Thuộc tính"></asp:TextBox>

            <br />

            <asp:FileUpload ID="fileHinh" runat="server" />

            <asp:Button ID="btnThem" runat="server"
                Text="Thêm"
                CssClass="btn"
                OnClick="btnThem_Click" />
        </div>

        <!-- TABLE -->
        <asp:GridView ID="gvSP" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="MaSP"
            OnRowDeleting="gvSP_RowDeleting"
            OnRowEditing="gvSP_RowEditing"
            OnRowUpdating="gvSP_RowUpdating"
            OnRowCancelingEdit="gvSP_RowCancelingEdit">

            <Columns>

                <asp:BoundField DataField="MaSP" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="TenSP" HeaderText="Tên" />
                <asp:BoundField DataField="Gia" HeaderText="Giá" />
                <asp:BoundField DataField="Loai" HeaderText="Loại" />
                <asp:BoundField DataField="ThuocTinh" HeaderText="Thuộc tính" />

                <asp:TemplateField HeaderText="Hình">
                    <ItemTemplate>
                        <img src='image/<%# Eval("HinhAnh") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />

            </Columns>

        </asp:GridView>

    </div>

</form>

</body>
</html>