using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LTW_Nhom8_ShopTBDT.Models;

namespace LTW_Nhom8_ShopTBDT.Controllers
{
    public class HomeController : Controller
    {
        dbQuanLyThietBiContext db = new dbQuanLyThietBiContext();
        public ActionResult Index()
        {
            var listTB = db.LINHKIENs.Take(10).ToList();
            return PartialView(listTB);
        }

        public ActionResult GioiThieu()
        {
            return View();
        }

        public ActionResult SlidePartial()
        {
            return PartialView();
        }

        public ActionResult ListMenu()
        {
            var ListChuDeTB = db.CHUDEs.Take(6).OrderBy(cd => cd.TENCD).ToList();
            return View(ListChuDeTB);
        }

        public ViewResult ThietBiTheoCD(int MACD = 0)
        {
            CHUDE cd = db.CHUDEs.SingleOrDefault(n => n.MACD == MACD);
            if (cd == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            List<LINHKIEN> ListLK = db.LINHKIENs.Where(s => s.MACD == MACD).OrderBy(s => s.GIABAN).ToList();
            if (ListLK.Count == 0)
            {
                ViewBag.LINHKIEN = "Không có thiết bị nào thuộc chủ đề này";
            }
            return View(ListLK);
        }

        public ActionResult ChuDe()
        {
            dbQuanLyThietBiContext db = new dbQuanLyThietBiContext();
            List<CHUDE> chude = db.CHUDEs.ToList();
            return View(chude);
        }

        public ActionResult TableSanPham(int mlk)
        {
            LINHKIEN linhkien = db.LINHKIENs.Single(s => s.MALK == mlk);
            if (linhkien == null)
            {
                return HttpNotFound();
            }
            return View(linhkien);
        }
    }
}