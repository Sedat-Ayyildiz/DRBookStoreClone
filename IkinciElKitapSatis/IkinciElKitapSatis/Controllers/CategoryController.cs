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
    public class CategoryController : Controller
    {
        ikinciElKitapSatisEntities db=new ikinciElKitapSatisEntities();
        // GET: Category
        [MyAuthorization(Roles = "A")]
        public ActionResult Index()
        {
            var kategoriler=db.KATEGORILER.ToList();
            return View(kategoriler);
        }

        [MyAuthorization(Roles = "A")]
        [HttpGet]
        public ActionResult KategoriEkle()
        {
            return View();
        }

        [MyAuthorization(Roles = "A")]
        [HttpPost]
        public ActionResult KategoriEkle(KATEGORILER k)
        {
            db.KATEGORILER.Add(k);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult KategoriSil(int id)
        {
            var kategori = db.KATEGORILER.Find(id);
            db.KATEGORILER.Remove(kategori);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult KategoriGetir(int? id)
        {
            var kategorideger = db.KATEGORILER.Find(id);
            return View("KategoriGetir", kategorideger);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult KategoriGuncelle(KATEGORILER k)
        {
            var kategoriGuncelle = db.KATEGORILER.Find(k.KATEGORIID);
            kategoriGuncelle.KATEGORIID = k.KATEGORIID;
            kategoriGuncelle.KATEGORIAD = k.KATEGORIAD;
            db.KATEGORILER.AddOrUpdate(kategoriGuncelle);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}