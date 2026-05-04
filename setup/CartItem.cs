using System;

namespace WebDientu
{
    public class CartItem
    {
        public int MaSP { get; set; }

        public string TenSP { get; set; }

        public int Gia { get; set; }

        public int SoLuong { get; set; }

        public string HinhAnh { get; set; }

       
        public int ThanhTien
        {
            get { return Gia * SoLuong; }
        }
    }
}