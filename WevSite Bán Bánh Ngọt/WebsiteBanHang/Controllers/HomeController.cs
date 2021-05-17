using DatabaseIO;
using DbWebsite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace WebsiteBanHang.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Home(int page = 1, int pagesize = 8)
        {
            DBIO db = new DBIO();
            var new_product = db.GetNewProducts(page, pagesize);
            ViewBag.new_pr = new_product;
            var pro_product = db.GetPro_Products(page, pagesize);
            ViewBag.pro_pr = pro_product;
            return View();
     
        }
          

        public ActionResult Product()
        {
            ViewData["Greeting"] = "Hello World!";
            ViewData["Demo"] = "Good bye";
            return View();
        }

        public struct UserInfor
        {
            public string UserName;
            public string PassWord;
        }
        public ActionResult Login(string UseName, string Pass)
        {

            if (UseName == "admin" && Pass == "13012000")
            {
                UserInfor UserInfor = new UserInfor();
                UserInfor.UserName = UseName;
                UserInfor.PassWord = Pass;
                Session["UserInfor"] = UserInfor;
                return RedirectToAction("Home", "Home");
            }
            return View();
        }
    }
}