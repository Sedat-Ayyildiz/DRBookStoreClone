using IkinciElKitapSatis.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IkinciElKitapSatis.Security;
using System.Web.Security;

namespace IkinciElKitapSatis.Controllers
{
    public class AboutController : Controller
    {
        ikinciElKitapSatisEntities db=new ikinciElKitapSatisEntities();
        // GET: About
        public ActionResult Index()
        {
            var hakkimizda = db.HAKKIMIZDA.ToList();
            return View(hakkimizda);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult HakkimizdaListele()
        {
            var hakkimizda=db.HAKKIMIZDA.ToList();
            return View(hakkimizda);
        }

        [MyAuthorization(Roles = "A")]
        [HttpGet]
        public ActionResult HakkimizdaEkle()
        {
            return View();
        }

        [MyAuthorization(Roles = "A")]
        [HttpPost]
        public ActionResult HakkimizdaEkle(HAKKIMIZDA h)
        {
            db.HAKKIMIZDA.Add(h);
            db.SaveChanges();
            return RedirectToAction("HakkimizdaListele");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult HakkimizdaSil(int id)
        {
            var hakkimizda = db.HAKKIMIZDA.Find(id);
            db.HAKKIMIZDA.Remove(hakkimizda);
            db.SaveChanges();
            return RedirectToAction("HakkimizdaListele");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult HakkimizdaGetir(int? id)
        {
            var hakkimizdadeger = db.HAKKIMIZDA.Find(id);
            return View("HakkimizdaGetir", hakkimizdadeger);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult HakkimizdaGuncelle(HAKKIMIZDA h)
        {
            var hakkimizdaGuncelle = db.HAKKIMIZDA.Find(h.HAKKIMIZDAID);
            hakkimizdaGuncelle.HAKKIMIZDAID = h.HAKKIMIZDAID;
            hakkimizdaGuncelle.HAKKIMIZDAACIKLAMA = h.HAKKIMIZDAACIKLAMA;
            hakkimizdaGuncelle.SPONSORRESIM = h.SPONSORRESIM;
            hakkimizdaGuncelle.SPONSORISIM = h.SPONSORISIM;
            db.HAKKIMIZDA.AddOrUpdate(hakkimizdaGuncelle);
            db.SaveChanges();
            return RedirectToAction("HakkimizdaListele");
        }
    }
}