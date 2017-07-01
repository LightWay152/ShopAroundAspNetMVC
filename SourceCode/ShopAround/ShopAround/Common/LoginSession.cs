using System;

namespace ShopAround.Common
{
    //TODO: Serializable mean you can get data from it,
    //it convert the session from binary to readable data
    [Serializable]
    public class LoginSession
    {
        public int UserId { set; get; }
        public string Username { set; get; }
        public string FullName { set; get; }
    }
}