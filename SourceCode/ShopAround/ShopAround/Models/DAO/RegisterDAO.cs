using ShopAround.Models.Entities;
using System;
using System.Linq;

namespace ShopAround.Models
{
    public class RegisterDAO
    {
        private readonly ShopAroundDbContext _db;

        public RegisterDAO()
        {
            _db = new ShopAroundDbContext();
        }

        public nn_user GetUserByUsername(string username)
        {
            return _db.nn_user.SingleOrDefault(x => x.email.Equals(username));
        }

        //TODO: Insert user
        public bool InsertUser(nn_user entity)
        {
            var user = _db.nn_user.SingleOrDefault(x => x.email == entity.email);
            if (user == null)
            {
                try
                {
                    _db.nn_user.Add(entity);
                    _db.SaveChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    //TODO: Read stacktrace in console
                    Console.WriteLine(ex.Message);
                    return false;
                }
            }
            return false;
        }

        //TODO: Check duplicate user
        public int CheckUser(string email)
        {
            return _db.nn_user.Count(x => x.email.Equals(email));
        }
        
    }
}