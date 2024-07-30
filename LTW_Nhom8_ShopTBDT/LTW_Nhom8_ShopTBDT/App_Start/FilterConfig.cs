using System.Web;
using System.Web.Mvc;

namespace LTW_Nhom8_ShopTBDT
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
