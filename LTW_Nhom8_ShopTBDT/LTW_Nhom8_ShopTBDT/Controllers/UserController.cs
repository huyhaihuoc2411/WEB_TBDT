using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LTW_Nhom8_ShopTBDT.Models;

namespace LTW_Nhom8_ShopTBDT.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/
        dbQuanLyThietBiContext db = new dbQuanLyThietBiContext();
        public ActionResult DangKy()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Dangky(NGUOIDUNG nguoidung)
        {
            try
            {
                // Thêm người dùng  mới
                db.NGUOIDUNGs.Add(nguoidung);
                // Lưu lại vào cơ sở dữ liệu
                db.SaveChanges();
                // Nếu dữ liệu đúng thì trả về trang đăng nhập
                if (ModelState.IsValid)
                {
                    return RedirectToAction("Dangnhap");
                }
                return View("Dangky");

            }
            catch
            {
                return View();
            }
        }

        public ActionResult Dangnhap()
        {
            return View();

        }

        [HttpPost]
        public ActionResult Dangnhap(FormCollection userlog)
        {
            string username = userlog["username"].ToString();
            string password = userlog["password"].ToString();
            var islogin = db.NGUOIDUNGs.SingleOrDefault(x => x.Username.Equals(username) && x.Matkhau.Equals(password));

            if (islogin != null)
            {
                if (username == "Admin")
                {
                    Session["use"] = islogin;
                    return RedirectToAction("Index", "Admin/Home");
                }
                else
                {
                    Session["use"] = islogin;
                    return RedirectToAction("Index", "Home");
                }
            }
            else
            {
                ViewBag.Fail = "Đăng nhập thất bại";
                return View("Dangnhap");
            }

        }
        public ActionResult DangXuat()
        {
            Session["use"] = null;
            return RedirectToAction("Index", "Home");

        }
	}
}