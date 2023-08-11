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
    public class PublisherController : Controller
    {
        ikinciElKitapSatisEntities db = new ikinciElKitapSatisEntities();
        // GET: Publisher
        [MyAuthorization(Roles = "A")]
        public ActionResult Index()
        {
            var yayınevi = db.YAYINEVLERI.ToList();
            return View(yayınevi);
        }

        [MyAuthorization(Roles = "A")]
        [HttpGet]
        public ActionResult YayineviEkle()
        {
            return View();
        }

        [MyAuthorization(Roles = "A")]
        [HttpPost]
        public ActionResult YayineviEkle(YAYINEVLERI y)
        {
            db.YAYINEVLERI.Add(y);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult YayineviSil(int id)
        {
            var yayınevi = db.YAYINEVLERI.Find(id);
            db.YAYINEVLERI.Remove(yayınevi);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult YayineviGetir(int? id)
        {
            var yayınevideger = db.YAYINEVLERI.Find(id);
            return View("YayineviGetir", yayınevideger);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult YayineviGuncelle(YAYINEVLERI y)
        {
            var yayıneviGuncelle = db.YAYINEVLERI.Find(y.YAYINEVIID);
            yayıneviGuncelle.YAYINEVIID = y.YAYINEVIID;
            yayıneviGuncelle.YAYINEVIADI = y.YAYINEVIADI;
            yayıneviGuncelle.ADRES = y.ADRES;
            yayıneviGuncelle.TELEFON = y.TELEFON;
            yayıneviGuncelle.EPOSTA = y.EPOSTA;
            db.YAYINEVLERI.AddOrUpdate(yayıneviGuncelle);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}