using IkinciElKitapSatis.Models;
using IkinciElKitapSatis.Security;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace IkinciElKitapSatis.Controllers
{
    public class CommentController : Controller
    {
        ikinciElKitapSatisEntities db = new ikinciElKitapSatisEntities();
        //GET: Comment
        [HttpGet]
        public PartialViewResult Yorumlar(int id)
        {
            ViewBag.BARKOD = id;
            var yorumlar = db.YORUMLAR
                      .Where(y => y.BARKOD == id)
                      .Include(y => y.KULLANICILAR)
                      .ToList();
            return PartialView(yorumlar);
        }

        [MyAuthorization(Roles = "A,M")]
        [HttpPost]
        public PartialViewResult Yorumlar(YORUMLAR y)
        {
            db.YORUMLAR.Add(y);
            db.SaveChanges();

            var yorumlar = db.YORUMLAR
                  .Where(x => x.BARKOD == y.BARKOD)
                  .Include(x => x.KULLANICILAR)
                  .ToList();

            ViewBag.BARKOD = y.BARKOD;
            return PartialView("Yorumlar", yorumlar);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult YorumlariListele()
        {
            var yorumlar = db.YORUMLAR.ToList();
            return View(yorumlar);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult YorumSil(int id)
        {
            var yorum = db.YORUMLAR.Find(id);
            db.YORUMLAR.Remove(yorum);
            db.SaveChanges();
            return RedirectToAction("YorumlariListele");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult YorumGetir(int? id)
        {
            var yorumdeger = db.YORUMLAR.Find(id);
            return View("YorumGetir", yorumdeger);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult YorumGuncelle(YORUMLAR y)
        {
            var yorumGuncelle = db.YORUMLAR.Find(y.YORUMID);
            yorumGuncelle.YORUMID = y.YORUMID;
            yorumGuncelle.YORUM = y.YORUM;
            yorumGuncelle.TARIH = y.TARIH;
            db.YORUMLAR.AddOrUpdate(yorumGuncelle);
            db.SaveChanges();
            return RedirectToAction("YorumlariListele");
        }
    }
}