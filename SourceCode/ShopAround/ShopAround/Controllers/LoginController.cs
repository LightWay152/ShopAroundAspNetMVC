using ShopAround.Common;
using ShopAround.Models;
using ShopAround.Models.DAO;
using System.Web.Mvc;

namespace ShopAround.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            var userSession = Session[CommonConstants.USER_SESSION];
            if(userSession != null)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            var userSession = Session[CommonConstants.USER_SESSION];
            if(userSession != null)
            {
                return RedirectToAction("Index","Home");
            }
            else
            {
                return View("Index");
            }
        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (Session[CommonConstants.USER_SESSION] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            if (ModelState.IsValid)
            {
                var data = new LoginDAO();
                var result = data.Login(model.Email, Encryptor.Md5Hash(model.Password));
                if (result == 1)
                {
                    var user = data.GetUserByUsername(model.Email);
                    var usersession = new LoginSession
                    {
                        Username = user.email,
                        UserId = user.id,
                        FullName = user.name
                    };
                    Session.Add(CommonConstants.USER_SESSION, usersession);
                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Wrong Password!");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Username is Unavailable!");
                }
                else
                {
                    ModelState.AddModelError("", "Login Failed!");
                }
            }
            return View("Index");
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return Redirect("/");//Same with RedirecttoAction("Index","Home");
        }
    }
}