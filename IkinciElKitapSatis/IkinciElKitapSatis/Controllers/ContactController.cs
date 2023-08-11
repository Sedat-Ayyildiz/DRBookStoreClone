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
    public class ContactController : Controller
    {
        ikinciElKitapSatisEntities db=new ikinciElKitapSatisEntities();
        // GET: Contact
        public ActionResult Index()
        {
            var iletisim=db.ILETISIM.ToList();
            return View(iletisim);
        }

        [HttpGet]
        public PartialViewResult Contact()
        {
            return PartialView();
        }

        [HttpPost]
        public PartialViewResult Contact(MESAJLAR m)
        {
            m.TARIH=DateTime.Parse(DateTime.Now.ToShortDateString());
            db.MESAJLAR.Add(m);
            db.SaveChanges();
            return PartialView();
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult IletisimListele()
        {
            var iletisim = db.ILETISIM.ToList();
            return View(iletisim);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult IletisimGetir(int? id)
        {
            var iletisimdeger = db.ILETISIM.Find(id);
            return View("IletisimGetir", iletisimdeger);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult IletisimGuncelle(ILETISIM h)
        {
            var iletisimGuncelle = db.ILETISIM.Find(h.ILETISIMID);
            iletisimGuncelle.ILETISIMID = h.ILETISIMID;
            iletisimGuncelle.ILETISIMADRES = h.ILETISIMADRES;
            iletisimGuncelle.ILETISIMTEL = h.ILETISIMTEL;
            iletisimGuncelle.ILETISIMMAIL = h.ILETISIMMAIL;
            db.ILETISIM.AddOrUpdate(iletisimGuncelle);
            db.SaveChanges();
            return RedirectToAction("IletisimListele");
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult MesajlariListele()
        {
            var mesajlar=db.MESAJLAR.ToList();
            return View(mesajlar);
        }

        [MyAuthorization(Roles = "A")]
        public ActionResult MesajSil(int id)
        {
            var mesaj = db.MESAJLAR.Find(id);
            db.MESAJLAR.Remove(mesaj);
            db.SaveChanges();
            return RedirectToAction("MesajlariListele");
        }
    }
}