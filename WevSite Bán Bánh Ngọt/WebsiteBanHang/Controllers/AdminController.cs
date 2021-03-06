using DatabaseIO;
using DbWebsite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Net;
using System.IO;
using System.Data;

namespace WebsiteBanHang.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        private MyDb db = new MyDb();
        public ActionResult ListProduct()
        {
            DBIO dbo = new DBIO();
            var typeproduct = dbo.GetTypeProducts();
            ViewBag.typeproduct = typeproduct;
            /*  return View();*/

            /*  var products = db.products.Include(p => p.type_products);
              return View(products.ToList());*/
      /*      var product = dbo.GetProducts();
            ViewBag.pro = product;*/
            return View(db.products.ToList());
        }

        // GET: Admin/Details/5
        public ActionResult DetailProduct(int id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            products products = db.products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }
        public ActionResult AddProduct()
        {
           /* ViewBag.id_type = new SelectList(db.type_products, "id", "name_typepr");*/
            products pro = new products();
            return View(pro);
        }

        // POST: Admin/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddProduct(products pro)
        {
            try
            {
                if(pro.ImageUpload !=null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(pro.ImageUpload.FileName);
                    string extension = Path.GetExtension(pro.ImageUpload.FileName);
                    fileName = fileName + extension;
                    pro.images = fileName;
                    pro.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/assets/image/product/"), fileName));
                }
                db.products.Add(pro);
                db.SaveChanges();
                return RedirectToAction("ListProduct");
            }
            catch
            {
                return View(pro);
            }

            /*ViewBag.id_type = new SelectList(db.type_products, "id", "name_typepr", DbWebsite.products.id_type);*/
         
        }

        // GET: CRUD/Edit/5
        public ActionResult EditProduct(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            } 

            products products = db.products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
 /*           ViewBag.id_type = new SelectList(db.type_products, "id", "name_typepr", products.id_type);*/
            DBIO dbo = new DBIO();
            var type_product = dbo.GetTypeProducts();
            ViewBag.type_pr = type_product;
  
            /* var list = new List<string>() { "bánh mặn", "bánh ngọt" };
             ViewBag.list = list;*/
            return View(products);
        }

        // POST: CRUD/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditProduct(int id, products pro)
        {
            try
            {
                if (pro.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(pro.ImageUpload.FileName);
                    string extension = Path.GetExtension(pro.ImageUpload.FileName);
                    fileName = fileName + extension;
                    pro.images = fileName;
                    pro.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/assets/image/product/"), fileName));
                }
                db.Entry(pro).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ListProduct");
            }
            catch
            {
                return View(pro);
            }
        }
        public ActionResult ChooseType_Product()
        {
            type_products type_pr = new type_products();
            type_pr.CateCollection = db.type_products.ToList();
            return PartialView(type_pr);
        }
        public ActionResult ChooseProduct()
        {
            products pro = new products();
            pro.CateCollection = db.products.ToList();
            return PartialView(pro);

        }

        // GET: CRUD/Delete/5
        public ActionResult DeleteProduct(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            products products = db.products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            else
            {
                db.products.Remove(products);
                db.SaveChanges();
                return RedirectToAction("ListProduct");
            }
        }

      /*  // POST: CRUD/Delete/5
        [HttpPost, ActionName("DeleteProduct")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            products products = db.products.Find(id);
            db.products.Remove(products);
            db.SaveChanges();
            return RedirectToAction("ListProduct");
        }*/
    }
}
