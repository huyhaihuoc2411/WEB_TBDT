using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LTW_Nhom8_ShopTBDT.Startup))]
namespace LTW_Nhom8_ShopTBDT
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
