using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShopAround.Startup))]
namespace ShopAround
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //ConfigureAuth(app);
        }
    }
}
