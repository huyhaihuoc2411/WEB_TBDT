using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LTW_Nhom8_ShopTBDT.Models
{
    public class GioHang
    {
        dbQuanLyThietBiContext db = new dbQuanLyThietBiContext();
        public int iMasp { get; set; }
        public string sTensp { get; set; }
        public string sAnhBia { get; set; }
        public double dDonGia { get; set; }
        public int iSoLuong { get; set; }
        public double ThanhTien
        {
            get { return iSoLuong * dDonGia; }
        }
        //Hàm tạo cho giỏ hàng
        public GioHang(int Masp)
        {
            iMasp = Masp;
            LINHKIEN sp = db.LINHKIENs.Single(n => n.MALK == iMasp);
            sTensp = sp.TENLK;
            sAnhBia = sp.ANHLK;
            dDonGia = double.Parse(sp.GIABAN.ToString());
            iSoLuong = 1;
        }
    }
}