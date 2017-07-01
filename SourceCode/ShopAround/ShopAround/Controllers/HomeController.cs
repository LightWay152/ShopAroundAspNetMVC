using ShopAround.Models;
using ShopAround.Models.Entities;
using System;
using System.Linq;
using System.Web.Mvc;
using ShopAround.Common;
namespace ShopAround.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ShopAroundDbContext db = new ShopAroundDbContext();
            var data = db.nn_product.ToList();
            return View(data);
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult _Category()
        {
            ShopAroundDbContext db = new ShopAroundDbContext();
            var data = db.nn_category.ToList();
            return PartialView(data);
        }

        public ActionResult _CategoryProduct(int id)
        {
            ShopAroundDbContext db = new ShopAroundDbContext();
            var data = db.nn_product.Where(item => item.category_id == id).ToList();
            return View(data);
        }

        [ChildActionOnly]
        public ActionResult _MoreProduct()
        {
            ShopAroundDbContext db = new ShopAroundDbContext();
            var data = db.nn_product.ToList();
            return PartialView(data);
        }

    }
}