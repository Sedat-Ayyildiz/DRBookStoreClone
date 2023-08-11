using IkinciElKitapSatis.Models;
using IkinciElKitapSatis.Security;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace IkinciElKitapSatis.Controllers
{
    public class OrdersController : Controller
    {
        ikinciElKitapSatisEntities db = new ikinciElKitapSatisEntities();
        // GET: Orders
        [MyAuthorization(Roles = "A,M")]
        public ActionResult Index()
        {
            var siparisler = db.SIPARISLER.ToList();
            return View(siparisler);
        }

        [MyAuthorization(Roles = "A,M")]
        [HttpGet]
        public ActionResult SepeteEkle()
        {
            return View();
        }

        [MyAuthorization(Roles = "A,M")]
        [HttpPost]
        public ActionResult SepeteEkle(SIPARISLER s)
        {
            db.SIPARISLER.Add(s);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [MyAuthorization(Roles = "A,M")]
        public ActionResult SiparisSil(int id)
        {
            var siparis = db.SIPARISLER.Find(id);
            db.SIPARISLER.Remove(siparis);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [MyAuthorization(Roles = "A,M")]
        public ActionResult SiparisGetir(int? id)
        {
            var siparisdeger = db.SIPARISLER
                         .Include(s => s.KULLANICILAR) // KULLANICILAR ilişkili özelliğini yükle
                         .Include(s => s.KITAPLAR) // KITAPLAR ilişkili özelliğini yükle
                         .SingleOrDefault(s => s.SIPARISID == id);
            return View("SiparisGetir", siparisdeger);
        }

        [MyAuthorization(Roles = "A,M")]
        public ActionResult SiparisGuncelle(SIPARISLER s)
        {
            var siparisGuncelle = db.SIPARISLER.Find(s.SIPARISID);
            siparisGuncelle.SIPARISID = s.SIPARISID;
            siparisGuncelle.KULLANICIID = s.KULLANICIID;
            siparisGuncelle.TARIH = s.TARIH;
            siparisGuncelle.BIRIMTUTAR = s.BIRIMTUTAR;
            siparisGuncelle.TOPLAMTUTAR = s.TOPLAMTUTAR;
            siparisGuncelle.ADET = s.ADET;
            siparisGuncelle.ADRES = s.ADRES;
            siparisGuncelle.TELEFON = s.TELEFON;
            siparisGuncelle.EPOSTA = s.EPOSTA;
            siparisGuncelle.BARKOD = s.BARKOD;
            db.SIPARISLER.AddOrUpdate(siparisGuncelle);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //ADMİN BÖLÜMÜ
        [MyAuthorization(Roles = "A")]
        public ActionResult SiparisSil2(int id)
        {
            var siparis = db.SIPARISLER.Find(id);
            db.SIPARISLER.Remove(siparis);
            db.SaveChanges();
            return RedirectToAction("SiparisLsitele");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult SiparisGetir2(int? id)
        {
            var siparisdeger = db.SIPARISLER.Find(id);
            return View("SiparisGetir2", siparisdeger);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult SiparisGuncelle2(SIPARISLER s)
        {
            var siparisGuncelle2 = db.SIPARISLER.Find(s.SIPARISID);
            siparisGuncelle2.SIPARISID = s.SIPARISID;
            siparisGuncelle2.KULLANICIID = s.KULLANICIID;
            siparisGuncelle2.TARIH = s.TARIH;
            siparisGuncelle2.BIRIMTUTAR = s.BIRIMTUTAR;
            siparisGuncelle2.TOPLAMTUTAR = s.TOPLAMTUTAR;
            siparisGuncelle2.ADET = s.ADET;
            siparisGuncelle2.ADRES = s.ADRES;
            siparisGuncelle2.TELEFON = s.TELEFON;
            siparisGuncelle2.EPOSTA = s.EPOSTA;
            siparisGuncelle2.BARKOD = s.BARKOD;
            db.SIPARISLER.AddOrUpdate(siparisGuncelle2);
            db.SaveChanges();
            return RedirectToAction("SiparisListele");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult SiparisListele()
        {
            var siparisler = db.SIPARISLER.ToList();
            return View(siparisler);
        }
    }
}