using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IkinciElKitapSatis.Models;
using System.Data.Entity;
using IkinciElKitapSatis.Security;

namespace IkinciElKitapSatis.Controllers
{
    public class HomeController : Controller
    {
        public ikinciElKitapSatisEntities db = new ikinciElKitapSatisEntities();
        public ActionResult Index(string p)
        {
            var kitaplar = from d in db.KITAPLAR select d;
            if (!string.IsNullOrEmpty(p))
            {
                kitaplar = kitaplar.Where(m => m.KITAPADI.Contains(p));
            }
            return View(kitaplar.ToList());
        }

        public ActionResult KitapDetay(int id)
        {
            var kitapdetay = db.KITAPLAR.Where(x => x.BARKOD == id).ToList();
            return View(kitapdetay);
        }

        [MyAuthorization(Roles ="A")]
        public ActionResult KitapListele()
        {
            var kitaplarListesi = db.KITAPLAR.ToList();
            return View(kitaplarListesi);
        }

        [MyAuthorization(Roles = "A")]
        [HttpGet]
        public ActionResult KitapEkle()
        {
            var yazarlar = db.YAZARLAR.ToList();
            var kategoriler = db.KATEGORILER.ToList();
            var yayinevleri = db.YAYINEVLERI.ToList();

            ViewBag.yazarlar = yazarlar;
            ViewBag.kategoriler = kategoriler;
            ViewBag.yayinevleri = yayinevleri;
            return View();
        }

        [MyAuthorization(Roles = "A")]
        [HttpPost]
        public ActionResult KitapEkle(KITAPLAR k)
        {
            db.KITAPLAR.Add(k);
            db.SaveChanges();

            var yazarlar = db.YAZARLAR.ToList();
            var kategoriler = db.KATEGORILER.ToList();
            var yayinevleri = db.YAYINEVLERI.ToList();

            ViewBag.yazarlar = yazarlar;
            ViewBag.kategoriler = kategoriler;
            ViewBag.yayinevleri = yayinevleri;

            return RedirectToAction("KitapListele");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult KitapSil(int id)
        {
            var kitap = db.KITAPLAR.Find(id);
            if (kitap != null)
            {
                db.KITAPLAR.Remove(kitap);
                db.SaveChanges();
            }
            return RedirectToAction("KitapListele");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult KitapGetir(int? id)
        {
            List<SelectListItem> kategoriler = (from k in db.KATEGORILER.ToList()
                                                select new SelectListItem
                                                {
                                                    Text = k.KATEGORIAD,
                                                    Value = k.KATEGORIID.ToString()

                                                }).ToList();
            List<SelectListItem> yazarlar = (from y in db.YAZARLAR.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = y.YAZARADI,
                                                 Value = y.YAZARID.ToString()

                                             }).ToList();

            List<SelectListItem> yayinevleri = (from x in db.YAYINEVLERI.ToList()
                                                select new SelectListItem
                                                {
                                                    Text = x.YAYINEVIADI,
                                                    Value = x.YAYINEVIID.ToString()

                                                }).ToList();
            ViewBag.k = kategoriler;
            ViewBag.y = yazarlar;
            ViewBag.x = yayinevleri;
            var kategorideger = db.KITAPLAR.Find(id);
            return View("KitapGetir", kategorideger);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult KitapGuncelle(KITAPLAR k)
        {
            var kitapGuncelle = db.KITAPLAR.Find(k.BARKOD);
            kitapGuncelle.BARKOD = k.BARKOD;
            kitapGuncelle.KATEGORIID = k.KATEGORIID;
            kitapGuncelle.KITAPADI = k.KITAPADI;
            kitapGuncelle.KITAPRESMI = k.KITAPRESMI;
            kitapGuncelle.KITAPACIKLAMA = k.KITAPACIKLAMA;
            kitapGuncelle.YAYINEVIID = k.YAYINEVIID;
            kitapGuncelle.YAZARID = k.YAZARID;
            kitapGuncelle.YAYINTARIHI = k.YAYINTARIHI;
            kitapGuncelle.FIYAT = k.FIYAT;
            kitapGuncelle.STOKMIKTARI = k.STOKMIKTARI;
            db.KITAPLAR.AddOrUpdate(kitapGuncelle);
            db.SaveChanges();
            return RedirectToAction("KitapListele");
        }

        //FİLTRELEMELER
        public ActionResult ArtanFiyat()
        {
            var artanFiyat = db.KITAPLAR.OrderBy(x => x.FIYAT).ToList();
            return View("Index", artanFiyat);
        }

        public ActionResult AzalanFiyat()
        {
            var azalanFiyat = db.KITAPLAR.OrderByDescending(x => x.FIYAT).ToList();
            return View("Index", azalanFiyat);
        }

        public ActionResult EnYeniler()
        {
            var enYeniler = db.KITAPLAR.OrderByDescending(x => x.YAYINTARIHI).ToList();
            return View("Index", enYeniler);
        }

        public ActionResult EnEskiler()
        {
            var enEskiler = db.KITAPLAR.OrderBy(x => x.YAYINTARIHI).ToList();
            return View("Index", enEskiler);
        }

        public ActionResult AdanZye()
        {
            var adanZye = db.KITAPLAR
                    .OrderBy(kitap => kitap.KATEGORILER.KATEGORIAD)
                    .ToList();
            return View("Index", adanZye);
        }

        public ActionResult ZdenAya()
        {
            var zdenAya = db.KITAPLAR
                    .OrderByDescending(kitap => kitap.KATEGORILER.KATEGORIAD)
                    .ToList();
            return View("Index", zdenAya);
        }
    }
}