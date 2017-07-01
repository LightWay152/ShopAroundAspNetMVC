using ShopAround.Common;
using ShopAround.Models;
using ShopAround.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopAround.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddProductToCart()
        {
            if (Session[CommonConstants.USER_SESSION] != null)
            {
                string product_id = Request.Params[CommonConstants.CART_SESSION];
                if (Session[CommonConstants.CART_SESSION] != null)
                {
                    Session[CommonConstants.CART_SESSION] += "-" + product_id;
                }
                else
                {
                    Session[CommonConstants.CART_SESSION] += product_id;
                }
            }
            return View();
        }

        [HttpPost]
        public ActionResult removeFromCart(int id)
        {
            List<nn_product> Items = new List<nn_product>();
            var Item = Items.Single(p => p.id == id);
            Items.Remove(Item);
            return View();
        }

        [HttpGet]
        public ActionResult Cart()
        {
            ShopAroundDbContext db = new ShopAroundDbContext();
            List<UserModel> products = new List<UserModel>();
            if (Session[CommonConstants.USER_SESSION] == null)
                return RedirectToAction("Login", "Login");
            if (Session[CommonConstants.CART_SESSION] != null)
            {
                string[] product_ids = Session[CommonConstants.CART_SESSION].ToString().Split('-');
                foreach (string id in product_ids)
                {
                    int nid = int.Parse(id);
                    UserModel order = new UserModel();
                    nn_product p = db.nn_product.Where(x => x.id == nid).FirstOrDefault();
                    order.product = p;
                    UserModel t = products.Where(x => x.product.id == p.id).FirstOrDefault();
                    if (t != null)
                    {
                        t.number++;
                    }
                    else
                    {
                        products.Add(order);
                    }
                }
            }
            ViewBag.products = products;
            return View();
        }

    }
}