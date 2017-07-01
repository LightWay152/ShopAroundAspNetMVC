using ShopAround.Common;
using ShopAround.Models;
using ShopAround.Models.Entities;
using System;
using System.Web.Mvc;
using ShopAround.Models.DAO;

namespace ShopAround.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Register()
        {
            //TODO: check usersession exist or not 
            var usersession = (LoginSession)Session[CommonConstants.USER_SESSION];
            if (usersession != null)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            //TODO: check usersession exist or not 
            var usersession = (LoginSession)Session[CommonConstants.USER_SESSION];
            if (usersession != null)
            {
                return RedirectToAction("Index", "Home");
            }

            RegisterDAO objDB = new RegisterDAO();
            nn_user user = new nn_user();

            if (ModelState.IsValid) //checking model is valid or not
            {
                if (objDB.CheckUser(model.Email) > 0)
                {
                    ModelState.AddModelError("", "This email already taken!");
                }
                else
                {
                    user.email = model.Email;
                    user.password = Encryptor.Md5Hash(model.Password);
                    user.name = model.Name;
                    user.mobile = model.Mobile;
                    user.address = model.Address;
                    user.dob = Convert.ToDateTime(model.DOB);
                    user.gender = model.Gender;
                    user.create_at = Convert.ToDateTime(model.CreateAt);
                    user.active = model.Active;
                    bool result = objDB.InsertUser(user); // passing Value to RegisterModel from model
                    if (result)
                    {
                        ViewData["result"] = result;
                        ModelState.Clear(); //clearing model
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Register Failed!");
                    }
                }
            }
            return View(model);
        }

    }
}