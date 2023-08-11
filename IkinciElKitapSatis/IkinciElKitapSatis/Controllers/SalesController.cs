using IkinciElKitapSatis.Models;
using IkinciElKitapSatis.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace IkinciElKitapSatis.Controllers
{
    public class SalesController : Controller
    {
        ikinciElKitapSatisEntities db=new ikinciElKitapSatisEntities();
        // GET: Sales
        [MyAuthorization(Roles = "A")]
        public ActionResult Index()
        {
            var satislar = db.SATISLAR.ToList();
            return View(satislar);
        }

        [MyAuthorization(Roles = "A")]
        [HttpGet]
        public ActionResult SatisEkle()
        {
            return View();
        }

        [MyAuthorization(Roles = "A")]
        [HttpPost]
        public ActionResult SatisEkle(SATISLAR s)
        {
            s.TARIH = DateTime.Parse(DateTime.Now.ToShortDateString());
            var satis = db.SATISLAR.Add(s);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}