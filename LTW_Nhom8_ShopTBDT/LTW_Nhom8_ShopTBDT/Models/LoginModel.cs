using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace LTW_Nhom8_ShopTBDT.Models
{
    public class LoginModel
    {
        [Key]
        [Display(Name = "Username")]
        public string username { get; set; }
        [Display(Name = "Password")]
        public string password { get; set; }
    }
}