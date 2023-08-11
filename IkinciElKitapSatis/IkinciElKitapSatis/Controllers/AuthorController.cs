using IkinciElKitapSatis.Models;
using IkinciElKitapSatis.Security;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace IkinciElKitapSatis.Controllers
{
    public class AuthorController : Controller
    {
        ikinciElKitapSatisEntities db=new ikinciElKitapSatisEntities();
        // GET: Author
        [MyAuthorization(Roles = "A")]
        public ActionResult Index()
        {
            var yazarlar=db.YAZARLAR.ToList();
            return View(yazarlar);
        }

        [MyAuthorization(Roles = "A")]
        [HttpGet]
        public ActionResult YazarEkle()
        {
            return View();
        }

        [MyAuthorization(Roles = "A")]
        [HttpPost]
        public ActionResult YazarEkle(YAZARLAR y)
        {
            db.YAZARLAR.Add(y);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult YazarSil(int id)
        {
            var yazar = db.YAZARLAR.Find(id);
            db.YAZARLAR.Remove(yazar);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult YazarGetir(int? id)
        {
            var yazardeger = db.YAZARLAR.Find(id);
            return View("YazarGetir", yazardeger);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult YazarGuncelle(YAZARLAR y)
        {
            var yazarGuncelle = db.YAZARLAR.Find(y.YAZARID);
            yazarGuncelle.YAZARID = y.YAZARID;
            yazarGuncelle.YAZARADI = y.YAZARADI;
            yazarGuncelle.ULUS = y.ULUS;
            db.YAZARLAR.AddOrUpdate(yazarGuncelle);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}