using IkinciElKitapSatis.Models;
using IkinciElKitapSatis.Security;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace IkinciElKitapSatis.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        // GET: Admin
        [AllowAnonymous]
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Index(KULLANICILAR kullanici)
        {
            ikinciElKitapSatisEntities db = new ikinciElKitapSatisEntities();
            var user = db.KULLANICILAR.FirstOrDefault(x => x.KULLANICIADI == kullanici.KULLANICIADI && x.SIFRE == kullanici.SIFRE);

            if (user != null)
            {
                FormsAuthentication.SetAuthCookie(user.KULLANICIADI, false);
                return RedirectToAction("Index", "Home");
            }

            ViewBag.Message = "Kullanıcı adı veya şifre hatalı.";
            return View();
        }

        [MyAuthorization]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Hata()
        {
            return View();
        }
    }
}