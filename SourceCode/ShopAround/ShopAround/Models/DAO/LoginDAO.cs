using ShopAround.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopAround.Models.DAO
{
    public class LoginDAO
    {
        private readonly ShopAroundDbContext _db;

        public LoginDAO()
        {
            _db = new ShopAroundDbContext();
        }

        //TODO: get user information from login
        public int Login(string username, string password)
        {
            nn_user user = _db.nn_user.SingleOrDefault(x => x.email.Equals(username));
            if (user != null)
            {
                if (user.password.Equals(password))
                {
                    return 1;//return 1 -> login success
                }
                else
                {
                    return 0;//return 0 -> wrong password
                }
            }
            return -1;//return -1 -> user doesn't exist
        }

        public nn_user GetUserByUsername(string username)
        {
            return _db.nn_user.SingleOrDefault(x => x.email.Equals(username));
        }
    }
}