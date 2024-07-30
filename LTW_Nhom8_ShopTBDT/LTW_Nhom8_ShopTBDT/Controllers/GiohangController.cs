using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LTW_Nhom8_ShopTBDT.Models;

namespace LTW_Nhom8_ShopTBDT.Controllers
{
    public class GiohangController : Controller
    {
        //
        // GET: /Giohang/
        dbQuanLyThietBiContext db = new dbQuanLyThietBiContext();

         public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                //Nếu giỏ hàng chưa tồn tại thì mình tiến hành khởi tao list giỏ hàng (sessionGioHang)
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }

         //Thêm giỏ hàng
         public ActionResult ThemGioHang(int iMasp, string strURL)
         {
             LINHKIEN sp = db.LINHKIENs.SingleOrDefault(n => n.MALK == iMasp);
             if (sp == null)
             {
                 Response.StatusCode = 404;
                 return null;
             }
             //Lấy ra session giỏ hàng
             List<GioHang> lstGioHang = LayGioHang();
             //Kiểm tra sp này đã tồn tại trong session[giohang] chưa
             GioHang sanpham = lstGioHang.Find(n => n.iMasp == iMasp);
             if (sanpham == null)
             {
                 sanpham = new GioHang(iMasp);
                 //Add sản phẩm mới thêm vào list
                 lstGioHang.Add(sanpham);
                 return Redirect(strURL);
             }
             else
             {
                 sanpham.iSoLuong++;
                 return Redirect(strURL);
             }
         }

         //Cập nhật giỏ hàng 
         public ActionResult CapNhatGioHang(int iMaSP, FormCollection f)
         {
             //Kiểm tra masp
             LINHKIEN sp = db.LINHKIENs.SingleOrDefault(n => n.MALK == iMaSP);
             //Nếu get sai masp thì sẽ trả về trang lỗi 404
             if (sp == null)
             {
                 Response.StatusCode = 404;
                 return null;
             }
             //Lấy giỏ hàng ra từ session
             List<GioHang> lstGioHang = LayGioHang();
             //Kiểm tra sp có tồn tại trong session["GioHang"]
             GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMasp == iMaSP);
             //Nếu mà tồn tại thì chúng ta cho sửa số lượng
             if (sanpham != null)
             {
                 sanpham.iSoLuong = int.Parse(f["txtSoLuong"].ToString());

             }
             return RedirectToAction("GioHang");
         }

         //Xóa giỏ hàng
         public ActionResult XoaGioHang(int iMaSP)
         {
             //Kiểm tra masp
             LINHKIEN sp = db.LINHKIENs.SingleOrDefault(n => n.MALK == iMaSP);
             //Nếu get sai masp thì sẽ trả về trang lỗi 404
             if (sp == null)
             {
                 Response.StatusCode = 404;
                 return null;
             }
             //Lấy giỏ hàng ra từ session
             List<GioHang> lstGioHang = LayGioHang();
             GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMasp == iMaSP);
             //Nếu mà tồn tại thì chúng ta cho sửa số lượng
             if (sanpham != null)
             {
                 lstGioHang.RemoveAll(n => n.iMasp == iMaSP);

             }
             if (lstGioHang.Count == 0)
             {
                 return RedirectToAction("Index", "Home");
             }
             return RedirectToAction("GioHang");
         }

         public ActionResult GioHang()
         {
             if (Session["GioHang"] == null)
             {
                 return RedirectToAction("Index", "Home");
             }
             List<GioHang> lstGioHang = LayGioHang();
             return View(lstGioHang);
         }

         private int TongSoLuong()
         {
             int iTongSoLuong = 0;
             List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
             if (lstGioHang != null)
             {
                 iTongSoLuong = lstGioHang.Sum(n => n.iSoLuong);
             }
             return iTongSoLuong;
         }

         private double TongTien()
         {
             double dTongTien = 0;
             List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
             if (lstGioHang != null)
             {
                 dTongTien = lstGioHang.Sum(n => n.ThanhTien);
             }
             return dTongTien;
         }

         public ActionResult GioHangPartial()
         {
             if (TongSoLuong() == 0)
             {
                 return PartialView();
             }
             ViewBag.TongSoLuong = TongSoLuong();
             ViewBag.TongTien = TongTien();
             return PartialView();
         }

         public ActionResult SuaGioHang()
         {
             if (Session["GioHang"] == null)
             {
                 return RedirectToAction("Index", "Home");
             }
             List<GioHang> lstGioHang = LayGioHang();
             return View(lstGioHang);

         }

	}
}